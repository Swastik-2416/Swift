import SwiftUI

struct ContentView: View {

    @State private var currentPage = 0
    @State private var floatAvatar = false

    // Hardcoded pages data
    let titles = [
        "Celebrate your culture, wherever you are",
        "Find people who feel like home",
        "A space made for every culture"
    ]
    let illustrationNames = ["Illustration1", "Illustration2", "Illustration3"]
    let avatarNames = ["avatar1", "avatar2", "avatar3"]

    let titleColors: [Color] = [
        Color(red: 30/255, green: 90/255, blue: 136/255),
        Color(red: 106/255, green: 27/255, blue: 135/255),
        Color(red: 177/255, green: 44/255, blue: 28/255)
    ]

    let cardGradients: [[Color]] = [
        [Color(red: 230/255, green: 238/255, blue: 242/255), Color(red: 243/255, green: 234/255, blue: 243/255)],
        [Color(red: 238/255, green: 211/255, blue: 247/255), Color(red: 245/255, green: 232/255, blue: 250/255)],
        [Color(red: 246/255, green: 215/255, blue: 208/255), Color(red: 250/255, green: 234/255, blue: 230/255)]
    ]

    let backgroundGradients: [[Color]] = [
        [Color(red: 95/255, green: 150/255, blue: 165/255), Color(red: 127/255, green: 179/255, blue: 194/255), Color(red: 242/255, green: 166/255, blue: 201/255)],
        [Color(red: 155/255, green: 69/255, blue: 184/255), Color(red: 183/255, green: 106/255, blue: 212/255), Color(red: 216/255, green: 166/255, blue: 234/255)],
        [Color(red: 238/255, green: 123/255, blue: 110/255), Color(red: 242/255, green: 154/255, blue: 139/255), Color(red: 245/255, green: 194/255, blue: 184/255)]
    ]

    let illustrationHeights: [CGFloat] = [250, 400, 360]

    let illustrationOffsets: [CGFloat] = [0, 0, 35]

    var body: some View {
        GeometryReader { geo in
            ZStack {

                LinearGradient(
                    colors: backgroundGradients[currentPage],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 0.6), value: currentPage)

                TabView(selection: $currentPage) {
                    ForEach(Array(titles.enumerated()), id: \ .offset) { index, title in
                        OnboardingCardView(
                            title: title,
                            illustrationName: illustrationNames[index],
                            illustrationHeight: illustrationHeights[index],
                            illustrationOffsetX: illustrationOffsets[index],
                            titleColor: titleColors[index],
                            cardGradient: cardGradients[index],
                            cardHeight: 600,
                            isActive: currentPage == index,
                            floatAvatar: floatAvatar
                        )
                        .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .onAppear { floatAvatar = true }
                .zIndex(0)

                Group {
                    Image(avatarNames[currentPage])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 370, height:450)

                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                        .offset(x: -90, y: 90)
                        .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: floatAvatar)
                }
                .zIndex(1)

                HStack(spacing: 8) {
                    ForEach(0..<titles.count, id: \.self) { idx in
                        Circle()
                            .fill(idx == currentPage ? Color(red: 200/255, green: 90/255, blue: 36/255) : Color.white.opacity(0.4))
                            .frame(width: idx == currentPage ? 12 : 8, height: 8)
                            .animation(.spring(), value: currentPage)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, max(geo.safeAreaInsets.bottom + 36, 48))
                .frame(maxHeight: .infinity, alignment: .bottom)
                .zIndex(2)

            }
  
            .overlay {
                if currentPage == titles.count - 1 {
                    let buttonHeight: CGFloat = 52
                    let bottomMargin: CGFloat = -1
                    let yPos = geo.size.height - (buttonHeight / 2) - bottomMargin
                    InlineCTA(title: "Get started", action: { print("Navigate to Home") })
                        .frame(width: geo.size.width * 0.7, height: buttonHeight)
                        .position(x: geo.size.width / 2, y: yPos)
                        .animation(.spring(), value: currentPage)
                        .zIndex(3)
                }
            }
        }
    }
}

// Inline CTA component placed directly in ContentView.swift per request
private struct InlineCTA: View {
    let title: String
    let action: () -> Void
    var backgroundColor: Color = Color(red: 196/255, green: 69/255, blue: 12/255)
    var foregroundColor: Color = .white
    var cornerRadius: CGFloat = 30

    var body: some View {
        Button(action: action) {
            Text(title)
                .fontWeight(.semibold)
                .foregroundColor(foregroundColor)
                .frame(maxWidth: .infinity)
                .padding()
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
        }
    }
}

#Preview {
    ContentView()
}
