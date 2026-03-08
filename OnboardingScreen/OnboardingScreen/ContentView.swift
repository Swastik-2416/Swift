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
        Color.title1,
        Color.title2,
        Color.title3
    ]

    let cardGradients: [[Color]] = [
        [Color.cardOne],
        [Color.cardTwo],
        [Color.cardThree]
    ]

    let backgroundGradients: [[Color]] = [
        [Color.oneTop, Color.oneBottom],
        [Color.twoTop, Color.twoBottom],
        [Color.threeTop, Color.threeBottom]
    ]

    let illustrationHeights: [CGFloat] = [250, 380, 400]

    let illustrationOffsets: [CGFloat] = [0,0,0]

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
                            .fill(idx == currentPage ? Color.title3 : Color.white.opacity(0.4))
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

private struct InlineCTA: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text("Get Started")
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.title3)
                .cornerRadius(30)
        }
    }
}

#Preview {
    ContentView()
}
