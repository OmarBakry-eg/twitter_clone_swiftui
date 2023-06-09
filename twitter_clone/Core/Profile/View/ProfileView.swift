//
//  ProfileView.swift
//  twitter_clone
//
//  Created by Omar on 09/04/2023.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter : TweetFilterViewModel = .tweets
    @Namespace var animation
    var body: some View {
        VStack (alignment: .leading){
            headerView
            actionButtons
            userInfoDetails
            tweetFilterBar
            items
            Spacer()
        }
       
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView {
    var headerView : some View {
        ZStack(alignment: .bottomLeading){
            Color(.systemBlue).ignoresSafeArea()
            VStack{
                Button {
                    
                }label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20,height: 16)
                        .foregroundColor(.white)
                        .offset(x:14,y:12)
                }
                
                Circle().frame(width: 72,height: 72)
                    .offset(x:16,y:24)
            }
        }.frame(height: 96)
    }
    
    var actionButtons : some View {
        HStack(spacing: 12){
            Spacer()
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray,lineWidth: 0.75))
            
            Button{}label: {
                Text("Edit Profile")
                    .font(.subheadline).bold()
                    .frame(width: 120,height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray,lineWidth: 0.75))
            }
        }.padding(.trailing)
        
    }
    
    var userInfoDetails : some View{
        VStack(alignment: .leading, spacing: 4){
            HStack{
                Text("Heath Ledger")
                    .font(.title2).bold()
                
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.blue)
            }
            Text("@joker")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            
            Text("Your mom favourite villain")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing:24) {
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                    Text("Gotham, NY")
                }
                HStack{
                    Image(systemName: "link")
                    Text("www.thejoker.com")
                }
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            HStack(spacing:24) {
                HStack(spacing:4){
                    Text("807")
                        .font(.subheadline)
                        .bold()
                    Text("Following")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                HStack(spacing:4){
                    Text("6.9M")
                        .font(.subheadline)
                        .bold()
                    Text("Followers")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }.padding(.vertical)
        }
        .padding(.horizontal)
    }
    
    var tweetFilterBar : some View {
        HStack {
            ForEach(TweetFilterViewModel.allCases,id: \.rawValue){
                item in
                VStack {
                    Text(item.title)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                    
                    if selectedFilter == item {
                        Capsule()
                            .frame(height: 3)
                            .foregroundColor(Color(.systemBlue))
                            .zIndex(1)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    }else{
                        Capsule()
                            .frame(height: 3)
                            .foregroundColor(Color(.clear))
                        
                    }
                }.onTapGesture {
                    withAnimation{
                        self.selectedFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x : 0, y : 17))
    }
    
    var items : some View {
        ScrollView{
            LazyVStack{
                ForEach(0...9,id: \.self){_ in
                    TwitterRowView()
                        .padding()
                }
            }
        }
    }
}
