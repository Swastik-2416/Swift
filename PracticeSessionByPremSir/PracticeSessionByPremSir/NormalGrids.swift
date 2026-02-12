//
//  Flags.swift
//  PracticeSessionByPremSir
//
//  Created by Swastik Mandal on 05/02/26.
//

import SwiftUI

struct NormalGrids: View {
    var body: some View {
        Grid{
            GridRow{
                Symbol(symbol: "delete.left", color: .gray)
                Symbol(symbol: "plus.forwardslash.minus", color: .orange)
                Symbol(symbol: "percent", color: .orange)
                Symbol(symbol: "divide", color: .orange)
            }
            GridRow {
                Number(ch: "7")
                Number(ch: "8")
                Number(ch: "9")
                Symbol(symbol: "multiply", color: .orange)
            }
            GridRow {
                Number(ch: "4")
                Number(ch: "5")
                Number(ch: "6")
                Symbol(symbol: "minus", color: .orange)
            }
            GridRow {
                Number(ch: "1")
                Number(ch: "2")
                Number(ch: "3")
                Symbol(symbol: "plus", color: .orange)
            }
            GridRow {
                Number(ch: "1")
                Number(ch: "2")
                Number(ch: "3")
                Symbol(symbol: "equal", color: .orange)
            }
        }
    }
}
struct Number: View {
    let ch : String
    var body: some View {
        ZStack{
            Circle()
                .foregroundStyle(.gray)
                .frame(width:50, height: 50)
            Text(ch)
                .foregroundStyle(.white)
        }
    }
}
struct Symbol: View {
    let symbol: String
    let color: Color
    var body: some View {
        ZStack{
            Circle()
                .foregroundStyle(color)
                .frame(width:50, height:50)
            Image(systemName: symbol)
                .foregroundStyle(.white)
            
        }
    }
}


#Preview {
    NormalGrids()
}
