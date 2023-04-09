//
//  TweetFilterViewModel.swift
//  twitter_clone
//
//  Created by Omar on 09/04/2023.
//

import Foundation


enum TweetFilterViewModel : Int, CaseIterable {
case tweets
case likes
case replies
    
    var title : String {
        switch self {
        case .tweets: return "Tweets"
        case .likes: return "Likes"
        case .replies: return "Replies"
        }
    }
}
