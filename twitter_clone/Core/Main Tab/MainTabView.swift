//
//  MainTabView.swift
//  twitter_clone
//
//  Created by Omar on 09/04/2023.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    var body: some View {
        TabView(selection: $selectedIndex){
            FeedView().onTapGesture {
                self.selectedIndex = 0
            }.tabItem {
                Image(systemName: "house")
            }.tag(0)
            
            Text("Search").onTapGesture {
                self.selectedIndex = 1
            }.tabItem {
                Image(systemName: "magnifyingglass")
            }.tag(1)
            
            Text("Notifications").onTapGesture {
                self.selectedIndex = 2
            }.tabItem {
                Image(systemName: "bell")
            }.tag(2)
            
            Text("Messages").onTapGesture {
                self.selectedIndex = 3
            }.tabItem {
                Image(systemName: "envelope")
            }.tag(3)

        }
       
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
