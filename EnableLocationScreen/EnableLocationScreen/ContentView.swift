import SwiftUI

struct ContentView: View {
    
    @State private var currentPage = 0
    
    var body: some View {
        TabView(selection: $currentPage) {
            
            ChooseLanguageView(currentPage: $currentPage)
                .tag(0)
            
            PreferenceView(currentPage: $currentPage)
                .tag(1)
            
            LocationPermission(currentPage: $currentPage)
                .tag(2)
            
            StateSelectionView(currentPage: $currentPage)
                .tag(3)
            
            
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
