//
//  CommentCard.swift
//  GETAPI
//
//  Created by Mohammed Almalki on 30/12/1443 AH.
//

import SwiftUI

struct CommentCard: View {
    
    let deviceWidth = UIScreen.main.bounds.width
    let deviceHeight = UIScreen.main.bounds.height
    
    var CommentObj: Comment

    var body: some View {
        VStack(spacing: 8){

            HStack {

                Text(CommentObj.name)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(String("Id: \(CommentObj.postId)"))
                    .padding(5)
            }
            .padding(10)
            
            Text(CommentObj.body)
                .fontWeight(.light)
                .multilineTextAlignment(.leading)
                .foregroundColor(.white)
                .frame(width: deviceWidth - 50, height: 70)
            
            Spacer()

        }
        .frame(width: deviceWidth - 20, height: 150)
        .background(
            RadialGradient(gradient: Gradient(colors: [.cyan, .indigo]), center: UnitPoint(x: 0.9, y: 0.9), startRadius: 10, endRadius: 200)
        )
        .cornerRadius(25)
        // shadows..
        .shadow(color: Color.black.opacity(0.04), radius: 5, x: 5, y: 5)
        
    } // Body
}

struct CommentCard_Previews: PreviewProvider {
    static var previews: some View {
        CommentCard(CommentObj: Comment(id: 1, postId: 1, name: "Mohammed", email: "moomksa2015@gmail.com", body: "omnis et fugit eos sint saepe ipsam unde est\ndolores sit sit assumenda laboriosam\ndolor deleniti voluptatem id nesciunt et\nplaceat dolorem cumque laboriosam sunt non"))
    }
}
