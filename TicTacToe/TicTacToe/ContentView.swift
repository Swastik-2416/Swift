import SwiftUI

struct ContentView: View {
    @State private var array = [
        [" ", " ", " "],
        [" ", " ", " "],
        [" ", " ", " "]
    ]

    @State private var currentPlayer = "X"

    var body: some View {
        Grid(horizontalSpacing: 2, verticalSpacing: 3) {
            ForEach(0..<3, id: \.self) { row in
                GridRow {
                    ForEach(0..<3, id: \.self) { column in
                        ButtonView(
                            array: $array,
                            row: row,
                            column: column,
                            currentPlayer: $currentPlayer
                        )
                    }
                }
            }
        }
    }
}

struct ButtonView: View {
    @Binding var array: [[String]]
    let row: Int
    let column: Int
    @Binding var currentPlayer: String

    var body: some View {
        Button {
            if array[row][column] == " " {
                array[row][column] = currentPlayer
                currentPlayer = currentPlayer == "X" ? "O" : "X"
            }
        } label: {
            Text(array[row][column])
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.yellow)
        }
    }
}

#Preview {
    ContentView()
}
