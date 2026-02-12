//
//  BadgeTab.swift
//  PageTab
//
//  Created by GU on 02/02/26.
//

import SwiftUI

struct BadgeTab: View {
    @State private var unreadMessages = 2
    var body: some View {
        TabView{
            Tab("Home", systemImage: "house.fill"){
                
            }
            .badge(unreadMessages)
            Tab(){
                
            }
            .badge(unreadMessages)
            Tab(){
                
            }
            .badge(unreadMessages)
        }
    }
}

#Preview {
    BadgeTab()
}
