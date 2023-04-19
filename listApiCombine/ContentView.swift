//
//  ContentView.swift
//  listApiCombine
//
//  Created by zakaria lachkar on 18/04/2023.
//

import SwiftUI
import URLImage

struct ContentView: View {
    
    @ObservedObject var UserManager = userManager()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack{
            List(UserManager.users, id: \.id , rowContent: { u in
                rowCell(email: u.email, first_name: u.first_name, last_name: u.last_name, avatar: u.avatar)
            })
            .onAppear {
                self.UserManager.fetchNextPage()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
