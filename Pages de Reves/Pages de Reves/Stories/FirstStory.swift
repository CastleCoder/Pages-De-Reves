//
//  FirstStory.swift
//  Pages de Reves
//
//  Created by Cyrille Chateau on 18/12/2023.
//

import SwiftUI

struct FirstStory: View {
    var firstStoryText: [String] = [
        "Un Fjord",
        "Une fôret",
        "Le désert",
        "Ola Quetal",
        "Hello World from Tokyooooooooooo",
        "Ola Quetal"
    ]
    
    var firstStoryImages: [Image] = [
        Image("paris"),
        Image("paris"),
        Image("paris"),
        Image("paris"),
        Image("paris"),
        Image("paris")
    ]
    
    @State private var currentPage = 0
    @State private var isLastPage = false

    
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(hex: 0xF1D6A4))
                .edgesIgnoringSafeArea(.all)
            VStack {
                //Spacer()
                            TabView(selection: $currentPage) {
                                ForEach(0..<firstStoryImages.count, id: \.self) { index in
                                    GeometryReader { geometry in
                                        VStack(alignment: .center) {
                                            firstStoryImages[index]
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: geometry.size.width * 0.7)
                                                .clipped()
                                                .cornerRadius(20)
                                                .clipped()
                                            
                                                
                                            
                                            Text(firstStoryText[index])
                                                .foregroundColor(.black)
                                                .padding(.top, 20)
                                        }
                                        .padding(.leading, geometry.size.width * 0.15)
                                    }
                                    .tag(index)
                                }
                            }
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                            .onAppear {
                                UIPageControl.appearance().currentPageIndicatorTintColor = .white
                                UIPageControl.appearance().pageIndicatorTintColor = UIColor.white.withAlphaComponent(0.5)
                            }
                //Spacer()
                            
                        }
            
        }
        
        
        
        
        
    }
    
    
}

extension Color {
    init(hex: UInt) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 8) & 0xff) / 255,
            blue: Double(hex & 0xff) / 255
        )
    }
}

#Preview {
    FirstStory()
}
