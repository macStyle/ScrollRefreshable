//
//  TestView.swift
//  ios 15 RefreshableView
//
//  Created by Adam Jemni on 10/7/21.
//

import SwiftUI

struct TestView: View {
    
    var image:String
    
    var body: some View {
        
        NavigationView{
            
        ScrollRefreshable (title: "Pull 2 Refresh", tinColor: .red, content: {
            
            
            NavigationLink(destination: ImagePreview(image: image)) {
                Image("post1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
            }
            
            Image("post1")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            Image("post2")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            Image("post3")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            Image("post4")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            .padding(.horizontal)
        }){
            // Refresh Content ...
            // Await Task ...
            // Since iOS 15 will show indicator until await task finishes ...
            await Task.sleep(2_000_000_000)
        }
        .navigationTitle("Staggered Grid")
        .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(image: "post1")
    }
}
