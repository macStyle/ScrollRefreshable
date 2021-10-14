//
//  ScrollRefreshable.swift
//  ios 15 RefreshableView
//
//  Created by Adam Jemni on 10/4/21.
//

import SwiftUI

// It will use Apple's Refreshable Modifier...
// Not any from UIKit ...

struct ScrollRefreshable<Content: View>: View {
    
    var content: Content
    var onRefresh: () async ->()
    
    init(title: String, tinColor: Color,@ViewBuilder content: @escaping ()->Content, onRefresh: @escaping () async ->()){
        self.content = content()
        self.onRefresh = onRefresh
        
        // Modifying Refresh Control ...
        UIRefreshControl.appearance().attributedTitle = NSAttributedString(string: title)
        UIRefreshControl.appearance().tintColor = UIColor(tinColor)
    }
    var body: some View {
        
        List{
            content
                .listRowSeparatorTint(Color.clear)
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
        .listStyle(.plain)
        .refreshable {
            await onRefresh()
        }
        
    }
}

struct ScrollRefreshable_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
