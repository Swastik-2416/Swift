import SwiftUI

struct OnboardingCardView: View {
    // Hardcoded data is passed in directly
    let title: String
    let illustrationName: String
    let illustrationHeight: CGFloat?
    let illustrationOffsetX: CGFloat?
    let titleColor: Color
    let cardGradient: [Color]
    let cardHeight: CGFloat?

    let isActive: Bool
    let floatAvatar: Bool

    private let cornerRadius: CGFloat = 28
    private let defaultAvatarSize: CGFloat = 120
    private let defaultAvatarBottomOffset: CGFloat = 20

    var body: some View {
        // Use a default height when cardHeight isn't provided to avoid UIScreen usage
        let defaultHeight = cardHeight ?? 620

        VStack(spacing: 16) {
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(
                        LinearGradient(
                            colors: cardGradient,
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .shadow(color: .black.opacity(0.08), radius: 20, y: 12)

                VStack(alignment: .leading, spacing: 16) {
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(titleColor)
                        .padding(.top, 20) // slightly moved upward

                    Image(illustrationName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: illustrationHeight ?? 250 )
                        .offset(x: illustrationOffsetX ?? 0)

                    Spacer()
                }
                .padding(.horizontal, 28)
                
            }
            .frame(height: defaultHeight)

            .padding(.bottom, 28)
        }
        .padding(.horizontal, 24)
        .scaleEffect(isActive ? 1 : 0.92)
        .opacity(isActive ? 1 : 0.6)
        .animation(.spring(response: 0.5, dampingFraction: 0.85), value: isActive)
    }
}

#Preview {
    // Example hardcoded colors converted from hex
    let titleColor = Color(red: 30/255, green: 90/255, blue: 136/255)
    let cardGradient = [
        Color(red: 230/255, green: 238/255, blue: 242/255),
        Color(red: 243/255, green: 234/255, blue: 243/255)
    ]

    OnboardingCardView(
        title: "Celebrate your culture, wherever you are",
        illustrationName: "Illustration1",
        illustrationHeight: 250,
        illustrationOffsetX: 0,
        titleColor: titleColor,
        cardGradient: cardGradient,
        cardHeight: 520,
        isActive: true,
        floatAvatar: true
    )
    .padding()
}
