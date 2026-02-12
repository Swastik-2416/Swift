//import SwiftUI
//
//struct AppGlassEffect: ViewModifier {
//    let selected: Bool
//    
//    func body(content: Content) -> some View {
//        content
//            .background(
//                RoundedRectangle(cornerRadius: 20)
//                    .fill(.ultraThinMaterial)
//            )
//            .overlay(
//                RoundedRectangle(cornerRadius: 20)
//                    .stroke(
//                        selected ? Color.orange : Color.white.opacity(0.3),
//                        lineWidth: selected ? 2 : 1
//                    )
//            )
//            .shadow(color: .black.opacity(0.1), radius: 10, y: 6)
//    }
//}
//
//extension View {
//    func appGlass(selected: Bool = false) -> some View {
//        modifier(AppGlassEffect(selected: selected))
//    }
//}
