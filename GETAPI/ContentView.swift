//
//  ContentView.swift
//  GETAPI
//
//  Created by Mohammed Almalki on 25/12/1443 AH.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var ShowProgress = false // Bool variable to control the sheet
    
    let FirstURLRequest = "https://jsonplaceholder.typicode.com/posts/1/comments"
    
    let SecondURLRequest = "https://jsonplaceholder.typicode.com/comments"
    
    init() {
        
        print("Loading Data...") // it will be printed first, then perform the below AF function
        
        // Using AF request will call a GET request by default
        // Test: Try SecondURLRequest and see what will change in the result
        AF.request(SecondURLRequest).responseDecodable(of: [Comment].self) { response in
            
            guard let comments = response.value else { return } // to avoid Optional case
            
            print(comments) // Test
            Singleton.shared.arrComm = comments // assign the value of JSON array to the new arrComm
        }
    }
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0) {
            Button {
                ShowProgress.toggle()
            } label: {
                 Text("Show Comments")
                
                Image(systemName: "archivebox.fill")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
            }
            
        } // VStack
        .padding(10)
        .sheet(isPresented: $ShowProgress) {
                CommentView()
        } // Sheet Cover
    } // Body
}

struct Comment: Decodable { // to convert JSON data into Decodable Object
    var id: Int
    var postId: Int
    var name: String
    var email: String
    var body: String
    
}

class Singleton: NSObject { // Singleton Class
    
    var arrComm = [Comment]() // array of Comment Object to store the value of AF request
    
    static let shared = Singleton() // Singleton Object
    
    override init() {
        super.init()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
