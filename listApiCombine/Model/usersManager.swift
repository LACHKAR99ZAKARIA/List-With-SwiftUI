//
//  usersManager.swift
//  listApiCombine
//
//  Created by zakaria lachkar on 18/04/2023.
//

import Foundation
import Combine

class userManager: ObservableObject {
    
    @Published var users = [User]()
    @Published var page = 1
    var cancellables = Set<AnyCancellable>()
    
    func fetchNextPage() {
        let url = URL(string: "https://reqres.in/api/users")!
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        urlComponents.queryItems = [URLQueryItem(name: "page", value: "1")]

        var allUsers: [User] = []
        var currentPage = 1

        func fetchPage() {
            urlComponents.queryItems = [URLQueryItem(name: "page", value: "\(currentPage)")]
            URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in
                guard let data = data, error == nil else {
                    print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                    return
                }
                let decodedResponse = try? JSONDecoder().decode(Results.self, from: data)
                if let users = decodedResponse?.data {
                    allUsers.append(contentsOf: users)
                    if let totalPages = decodedResponse?.total_pages, currentPage < totalPages {
                        currentPage += 1
                        fetchPage()
                    } else {
                        self.users = allUsers
                    }
                }
            }.resume()
        }

        fetchPage()
    }
}
