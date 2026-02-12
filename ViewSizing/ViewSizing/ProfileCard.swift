//
//  ProfileCard.swift
//  ViewSizing
//
//  Created by GU on 21/12/25.
//

import SwiftUI

struct ProfileCard: View {
    var body: some View {
        VStack{
            HStack{
                Image("Image")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                Image(systemName: "plus")
                    .font(.title)
                    .background(.white)
                    .cornerRadius(15)
                    .offset(x: -40, y:30)
                VStack(alignment: .leading) {
                    Text("Dhoni")
                        .font(.title)
                        .bold()
                    HStack{
                        VStack{
                            Text("7")
                                .font(.headline)
                                .bold()
                            
                            Text("Followers")
                                .font(.caption)
                            
                        }
                        .padding(5)
                        VStack{
                            Text("100")
                                .font(.headline)
                                .bold()
                            
                            Text("Followers")
                                .font(.caption)
                        }
                        .padding(5)
                        VStack{
                            Text("2")
                                .font(.headline)
                                .bold()
                            
                            Text("Posts")
                                .font(.caption)
                        }
                        .padding(5)
                    }
                }
                    
                
            }
        }
        Spacer()
        
    }
}

#Preview {
    ProfileCard()
}
