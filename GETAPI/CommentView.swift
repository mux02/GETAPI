//
//  CommentView.swift
//  GETAPI
//
//  Created by Mohammed Almalki on 01/01/1444 AH.
//

import SwiftUI

struct CommentView: View {
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.vertical) {
                ForEach(Singleton.shared.arrComm, id: \.id) { item in
                        CommentCard(CommentObj: item)
                        .padding(10)
                    }
                } // Scroll
            } // Vstack
            .navigationTitle("CommentView")
            .navigationBarTitleDisplayMode(.inline)
            
        } // Navi
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView()
    }
}
