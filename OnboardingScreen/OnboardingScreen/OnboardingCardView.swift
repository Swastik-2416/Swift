import SwiftUI

struct OnboardingCardView: View {
    let title: String
    let illustrationName: String
    let illustrationHeight: CGFloat?
    let illustrationOffsetX: CGFloat?
    let titleColor: Color
    let cardGradient: [Color]
    let cardHeight: CGFloat?

    let isActive: Bool
    let floatAvatar: Bool

    private let cornerRadius: CGFloat = 30
    private let defaultAvatarSize: CGFloat = 120
    private let defaultAvatarBottomOffset: CGFloat = 20

    var body: some View {
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
                        .padding(.top, 20)

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
}
