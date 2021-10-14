//
//  Home.swift
//  StraggedGrid
//
//  Created by Adam Jemni on 10/4/21.
//

import SwiftUI

struct Home: View {
    
    @State var posts: [Post] = []
    // To show dynamic ...
    @State var columns: Int = 2
    
    // smooth Hero effect ...
    @Namespace var animation
    
    
    var body: some View {
        
        NavigationView {
            ScrollRefreshable (title: "Pull 2 Refresh", tinColor: .red, content: {
                
                StaggeredGrid(columns: columns, list: posts, content: { post in
                    // Post Card View ...
                    PostCardView(post: post)
                        .matchedGeometryEffect(id: post.id, in: animation)
                })
                    .padding(.horizontal)
            }){
                // Refresh Content ...
                // Await Task ...
                // Since iOS 15 will show indicator until await task finishes ...
                await Task.sleep(2_000_000_000)
            }
                .navigationTitle("Staggered Grid")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            columns += 1
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            columns = max(columns - 1, 1)
                        } label: {
                            Image(systemName: "minus")
                        }
                    }
                }
            // Animation
                .animation(.easeInOut, value: columns)
        }
        .onAppear {
            for index in 1...10 {
                posts.append(Post(imageURL: "post\(index)"))
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Since we declared T as Identifiable ...
// So we need to pass Identifiable conform  collection/Array ...

struct PostCardView: View{
    
    var post: Post
    
    var body: some View{
        
        Image(post.imageURL)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(10)
        
    }
}
