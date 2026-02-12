import SwiftUI

struct LocationPermission: View {
    @Binding  var currentPage: Int
    
    var body: some View {
        VStack(spacing: 24) {
            
            Spacer()
            
            VStack(spacing: 10) {
                Text("Find your community nearby")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Enable location to discover Indians,\nevents, and places around you")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
            }
            .padding(.top, 20)
            
            VStack(spacing: 16) {
                
                infoCard(
                    icon: "person.3.fill",
                    title: "Connect with Indians nearby",
                    subtitle: "Find people from your state or who speak your language"
                )
                
                infoCard(
                    icon: "location.fill",
                    title: "Discover cultural events",
                    subtitle: "Never miss festivals, gatherings and celebrations near you."
                )
                
                infoCard(
                    icon: "building.2.fill",
                    title: "Find Indian restaurants & stores",
                    subtitle: "Locate temples, grocery stores and authentic cuisine"
                )
            }
            .padding(.horizontal)
            
            Spacer()
            VStack(spacing: 14) {
                
                Button {
                } label: {
                    Text("Enable Location")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.primaryColor)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .shadow(color: .orange.opacity(0.4), radius: 10, y: 6)
                }
                
                Button {
                } label: {
                    Text("Skip for Now")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(.white)
                        .foregroundColor(Color.primaryColor)
                        .cornerRadius(30)
                        .shadow(color: .orange.opacity(0.4), radius: 10, y: 6)
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 50)
            
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
    
    @ViewBuilder
    func infoCard(icon: String, title: String, subtitle: String) -> some View {
            HStack(spacing: 14) {
                Circle()
                    .fill(Color.primaryColor)
                    .frame(width: 44, height: 44)
                    .overlay(Image(systemName: icon).foregroundColor(.white))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.headline)
                        .foregroundStyle(Color.primaryColor)
                    
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(.black.opacity(0.5))
                }
                
                Spacer()
            }
            .padding()
            .glassEffect(in: .rect(cornerRadius:20))
        }
    }


#Preview {
    LocationPermission(currentPage: .constant(3))
}

