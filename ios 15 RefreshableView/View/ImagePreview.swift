//
//  ImagePreview.swift
//  ios 15 RefreshableView
//
//  Created by Adam Jemni on 10/7/21.
//

import SwiftUI

struct ImagePreview: View {
    
    var image:String
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
    }
}

struct ImagePreview_Previews: PreviewProvider {
    static var previews: some View {
        ImagePreview(image: "post2")
    }
}
