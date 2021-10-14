//
//  StaggeredGrid.swift
//  ios 15 RefreshableView
//
//  Created by Adam Jemni on 10/4/21.
//

import SwiftUI

// Refer the stragged video...

struct StaggeredGrid<Content: View,T:Identifiable>: View where T: Hashable{
    
    // It will return each object from collection to build View ...
    var content: (T) -> Content
    
    var list: [T]
    // Columns...
    var columns: Int
    // Properties ...
    var showsIndicators: Bool
    var spacing: CGFloat
    
    init(columns: Int ,showsIndicators: Bool = false, spacing: CGFloat = 10,list:[T],@ViewBuilder content: @escaping (T)->Content) {
        self.content = content
        self.list = list
        self.spacing = spacing
        self.showsIndicators = showsIndicators
        self.columns = columns
    }
    
    // Straggered Grid Function ...
    func SetUpList()->[[T]]{
        
        // Creating empty sub arrays of columns count ...
        var gridArray: [[T]] = Array(repeating: [], count: columns)
        
        // Spiliting array for VStack oriented View ...
        var currentIndex: Int = 0
        
        for object in list{
            gridArray[currentIndex].append(object)
            
            // Increasing index count ...
            // and resetting if overbounds the columns count ...
            if currentIndex == (columns - 1){
                currentIndex = 0
            }
            else{
                currentIndex += 1
            }
        }
        return gridArray
    }
    
    var body: some View {
        
        ScrollView (.vertical, showsIndicators: showsIndicators) {
            HStack (alignment:.top){
                ForEach(SetUpList(),id: \.self) { columnsData in
                    
                    // For optimized using LazyStack ...
                    LazyVStack(spacing:spacing){
                        ForEach(columnsData){ object in
                            content(object)
                            
                        }
                    }
                }
            }
            // Only vertical padding ...
            // Horizontal padding will be user's optional ...
            .padding(.vertical)
        }
        
    }
}

//
//struct StaggeredGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        StaggeredGrid()
//    }
//}
