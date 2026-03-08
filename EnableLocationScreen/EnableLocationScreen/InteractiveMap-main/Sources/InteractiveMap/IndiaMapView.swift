//
//  IndiaMapView.swift
//  InteractiveMap
//
//  A ready-to-use SwiftUI view that renders the interactive India map.
//

import SwiftUI

@available(iOS 15.0, *)
public struct IndiaMapView: View {
    @State private var selectedPath = PathData()
    @State private var selectedState: String? = nil
    @Binding var currentPage: Int

    public init(currentPage: Binding<Int>) {
        self._currentPage = currentPage
    }

    public var body: some View {
            VStack {
                Text( "Where do you belong" )
                    .font(.largeTitle.bold())
                    .padding(5)
                    .foregroundColor(.white)
                    .padding(.top, 100)
                Text("Select your home, state or region")
                    .font(.title3.bold())
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.bottom, 50)
                
                // The interactive map
                GeometryReader { geo in
                    InteractiveMap(svgName: "in") { pathData in
                        InteractiveShape(pathData)
                            .stroke(Color.white.opacity(0.4), lineWidth: 0.6)
                            .background(
                                InteractiveShape(pathData)
                                    .fill(selectedPath == pathData
                                          ? Color.selected
                                : Color.notSelected
                            ))
                                
                            .contentShape(InteractiveShape(pathData))
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    selectedPath = pathData
                                }
                            }
                        // Ensure small states like Delhi ("INDL") and Goa ("INGA") are on top
                            .zIndex(selectedPath == pathData ? 100 : (pathData.id == "INDL" || pathData.id == "INGA" ? 50 : 1))
                            .overlay(
                                Group {
                                    if selectedPath == pathData,
                                       let bounds = pathData.boundingBox,
                                       let svgBounds = pathData.svgBounds {
                                        
                                        let scale = min(geo.size.width / svgBounds.width, geo.size.height / svgBounds.height)
                                        let x = (bounds.midX - svgBounds.origin.x) * scale
                                        let y = (bounds.midY - svgBounds.origin.y) * scale
                                        
                                        Text(pathData.name)
                                            .font(.caption.bold())
                                            .foregroundColor(.white)
                                            .shadow(color: .black, radius: 2)
                                            .position(x: x, y: y)
                                        // Allow tap to pass through the text
                                            .allowsHitTesting(false)
                                    }
                                }
                            )
                    }
                }
                Button {
                    withAnimation {
                        currentPage += 1
                    }
                } label: {
                    Text("Continue")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(!selectedPath.id.isEmpty ? Color.appPrimary : .white.opacity(0.5))
                        .foregroundColor(!selectedPath.id.isEmpty ? .white : Color.appPrimary)
                        .cornerRadius(30)
                        .shadow(color: .black.opacity(0.2), radius: 10, y: 6)
                }
                
                .padding(.horizontal)
                .padding(.bottom, 50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(
                    colors: [.topGradient, .bottomGradient],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )

            .ignoresSafeArea()
        }
        
}



//@available(iOS 15.0, macOS 12.0, *)
//struct IndiaMapView_Previews: PreviewProvider {
//    static var previews: some View {
//        IndiaMapView()
//            .preferredColorScheme(.dark)
//    }
//}
#Preview {
   
    return IndiaMapView(currentPage: .constant(3))
}

