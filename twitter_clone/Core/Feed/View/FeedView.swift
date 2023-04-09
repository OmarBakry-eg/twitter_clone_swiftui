//
//  FeedView.swift
//  twitter_clone
//
//  Created by Omar on 02/04/2023.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView{
            LazyVStack {
                ForEach(0...15 ,id: \.self){ _ in
                    TwitterRowView()		    
            }
        }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
