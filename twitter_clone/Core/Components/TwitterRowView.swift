//
//  TwitterRowView.swift
//  twitter_clone
//
//  Created by Omar on 02/04/2023.
//

import SwiftUI

struct TwitterRowView: View {
    let arr : [String] = ["bubble.left", "arrow.2.squarepath","heart","bookmark"]
    var body: some View {
        VStack(alignment:.leading){
            HStack(alignment: .top) {
                Circle()
                    .frame(width: 56,height: 56)
                    .foregroundColor(Color(.systemBlue))
                VStack (alignment: .leading,spacing: 10){
                    HStack {
                        Text("Omar Bakry")
                            .font(.subheadline).bold()
                        Text("@Omar").font(.caption).foregroundColor(.gray)
                        Text("2w").font(.caption).foregroundColor(.gray)
                    }
                    
                    Text("I belive in myself").font(.subheadline).multilineTextAlignment(.leading)
                }
            }.padding(.horizontal)
            HStack{
                ForEach(0...3, id:\.self){i in
                    Spacer()
                    Button(action: {
                        //
                    }, label: {
                        Image(systemName: arr[i]).font(.subheadline).foregroundColor(.black)
                        
                    })
                    Spacer()
                }
            }.padding(.top)
                .padding(.bottom,5)
            Divider().padding(.bottom,9)
        }
    }
}

struct TwitterRowView_Previews: PreviewProvider {
    static var previews: some View {
        TwitterRowView()
    }
}

