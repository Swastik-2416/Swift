//
//  Remote control task.swift
//  statebindings
//
//  Created by GU on 07/01/26.
//

import SwiftUI

struct RemoteControlTask: View {
    @Binding var selected: Bool
    var body: some View {
        Text(selected ? "Music is OFF" :"Music is ON")
            
    }
}
struct Remote_control_task: View {
    @State private var selected: Bool = false
    var body: some View {
        HStack {
            Image(systemName: "music.note")
                .font(.largeTitle.bold())
                        Text(selected ? "Paused" :"Now Playing")
                .font(.largeTitle.bold())
            

        }
        RemoteControlTask(selected: $selected)
        Button(action: {
            selected.toggle()
        }, label: {
            Image(systemName: selected ? "pause.fill" : "play.fill")
                .font(.largeTitle.bold())
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .clipShape(Circle())
        })
        
    }
}

#Preview {
    Remote_control_task()
}

