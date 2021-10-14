//
//  Post.swift
//  ios 15 RefreshableView
//
//  Created by Adam Jemni on 10/4/21.
//

import SwiftUI

struct Post: Identifiable, Hashable {

    var id = UUID().uuidString
    var imageURL: String
    
}
