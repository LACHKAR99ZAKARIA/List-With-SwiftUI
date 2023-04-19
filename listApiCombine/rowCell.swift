//
//  rowCell.swift
//  listApiCombine
//
//  Created by zakaria lachkar on 18/04/2023.
//

import SwiftUI
import URLImage

struct rowCell: View  {
    var email : String
    var first_name : String
    var last_name : String
    var avatar : String
    var body: some View {
        VStack{
            HStack(content:{
                URLImage(URL(string: self.avatar)!) { image, info in
                    image
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 50, height: 50)
                }
                VStack{
                    HStack{
                        Text(self.first_name)
                        Text(self.last_name)
                    }
                    Text(self.email)
                }
            })
        }
    }
}



struct rowCell_Previews: PreviewProvider {
    static var previews: some View {
        rowCell(email: "tst@tst.tst", first_name: "tst", last_name: "tst", avatar: "https://reqres.in/img/faces/1-image.jpg")
            .previewLayout(.sizeThatFits)
    }
}
