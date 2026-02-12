import SwiftUI

struct ChooseLanguageView: View {
    
    @State private var selectedLanguage: String? = nil
    @Binding  var currentPage: Int

    
    let languages: [(String, String)] = [
        ("Hindi", "हिंदी"),
        ("Bangla", "বাংলা"),
        ("Tamil", "தமிழ்"),
        ("Telugu", "తెలుగు"),
        ("Assamese", "অসমীয়া"),
        ("Marathi", "मराठी"),
        ("Gujarati", "ગુજરાતી"),
        ("Kannada", "ಕನ್ನಡ")
    ]
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 6) {
                Text("Choose Your Language")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(languages, id: \.0) { lang in
                    languageCard(
                        title: lang.0,
                        native: lang.1,
                        selected: selectedLanguage == lang.0

                    ) {
                        toggle(lang.0)
                    }
                }
            }
            .padding()
            
            Spacer()
            Button {
                withAnimation {
                    currentPage += 1
                }
            } label: {
                Text("Continue")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(((selectedLanguage?.isEmpty) != nil) ? Color.primaryColor : .white.opacity(0.5))
                    .foregroundColor(((selectedLanguage?.isEmpty) != nil) ? .white : Color.primaryColor)
                    .cornerRadius(30)
                    .disabled(selectedLanguage == nil)
                    .padding(.horizontal)
                    .padding(.bottom, 50)
            }
            .padding(.horizontal)
//            .padding(.bottom, 30)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(
                colors: [.gradientTop, .gradientBottom],
                startPoint: .top,
                endPoint: .bottom
            )
        )

        .ignoresSafeArea()
    }
    
    func languageCard(
        title: String,
        native: String,
        selected: Bool,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Text(title)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(Color.primaryColor)
                Text(native)
                    .font(.headline)
                    .bold()
                    .foregroundStyle(Color.primaryColor.opacity(0.6))
            }
            .frame(maxWidth: .infinity, minHeight: 90)
                    .padding()
                    .glassEffect(in: .rect(cornerRadius: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(selected ? Color.primaryColor : Color.clear, lineWidth: 2)
                    )
                    .scaleEffect(selected ? 0.97 : 1)
                    .animation(.easeInOut(duration: 0.15), value: selected)


        }
    }
    
    func toggle(_ language: String) {
        if selectedLanguage == language {
            selectedLanguage = nil   // deselect if tapped again
        } else {
            selectedLanguage = language
        }
    }

}
#Preview {
    ChooseLanguageView(currentPage: .constant(0))
}


