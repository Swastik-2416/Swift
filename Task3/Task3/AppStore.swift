//
//  AppStore.swift
//  Task3
//
//  Created by GU on 20/12/25.
//

import SwiftUI

struct AppStore: View {
    var body: some View {
        ScrollView{
            VStack{
                HStack {
                    Text("Apps")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        Spacer()
                    Image("Image")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .padding(10)
                }
                HStack {
                    HStack {
                        Image(systemName: "star.fill")
                        Text("Category")
                            .font(.subheadline)
                            .offset(x: -10)
                            .padding(8)
                            
                    }
                    .background(.gray.opacity(0.1))
                    .cornerRadius(50)
                    HStack {
                        Image(systemName: "star.fill")
                        Text("Category")
                            .font(.subheadline)
                            .offset(x: -10)
                            .padding(8)
                            
                    }
                    .background(.gray.opacity(0.1))
                    .cornerRadius(50)
                    HStack {
                        Image(systemName: "star.fill")
                        Text("Category")
                            .font(.subheadline)
                            .offset(x: -10)
                            .padding(8)
                            
                    }
                    .background(.gray.opacity(0.1))
                    .cornerRadius(50)
                    
                }
                Text("CONTEXT TEXT")
                    .offset(x: -125 , y: 8)
                    
                Text("Announcement title which can be very long")
                    .font(.title)
                    .padding(5)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    Color.blue
                        .frame(width: 385, height: 200)
                        .clipShape(Rectangle())
                        .cornerRadius(20)
                        .overlay() {
                            VStack {
                                Image("Image 2")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Rectangle())
                                    .cornerRadius(20)
                            }
                        }
                        .padding(5)
                }
                HStack {
                    Text("Top Apps of the Week")
                        .font(.title3)
                        .bold()
                        .padding(8)
                    Image(systemName: "chevron.right")
                    Spacer()
                }
                HStack {
                    Image("Image 2")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(Rectangle())
                        .cornerRadius(20)
                        .padding(8)
                    VStack(alignment: .leading) {
                        Text("App Name")
                            .font(.title3)
                        Text("Description text goes here")
                            .font(.caption)
                    }
                    Spacer()
                    Button("Get") {
                    }
                    .buttonStyle(.borderedProminent)
                    .offset(x: -10)
                    
                }
                HStack {
                    Text("Browse Categories")
                        .font(.title3)
                        .bold()
                        .padding(8)
                    Image(systemName: "chevron.right")
                    Spacer()
                }
                HStack {
                    ZStack {
                        Color.green.frame(width:180, height:100)
                            .clipShape(Rectangle())
                            .cornerRadius(10)
                        Text("Category 1")
                            .font(.headline)
                            .offset(x: -45, y: 30)
                            .foregroundColor(.white)
                        Image("Image 2")
                            .resizable()
                            .frame(width: 40, height: 30)
                            .clipShape(Rectangle())
                            .cornerRadius(10)
                            .offset(x: 60, y: -25)
                    }
                    ZStack {
                        Color.green.frame(width:180, height:100)
                            .clipShape(Rectangle())
                            .cornerRadius(10)
                        Text("Category 1")
                            .font(.headline)
                            .offset(x: -45, y: 30)
                            .foregroundColor(.white)
                        Image("Image 2")
                            .resizable()
                            .frame(width: 40, height: 30)
                            .clipShape(Rectangle())
                            .cornerRadius(10)
                            .offset(x: 60, y: -25)
                    }
                    
                    
                }
            }
            HStack {
                Text("Quick Links")
                    .font(.title3)
                    .bold()
                    .padding(8)
                Image(systemName: "chevron.right")
                Spacer()
            }
            Text("QuickLinks")
                .font(.title3)
                .bold()
            VStack(alignment: .leading) {
                ForEach(1..<11) { i in
                    Text("Link \(i)")
                }
            }
        }
    }
}

#Preview {
    AppStore()
}
