//
//  Seasons.swift
//  Pages de Reves
//
//  Created by Cyrille Chateau on 29/12/2023.
//

import SwiftUI

struct Seasons: View {
    var animalsOfForestText: [String] = [
        "L'Automne",
        "L'Automne",
        "L'Automne",
        "Le Printemps",
        "La Printemps",
        "La Printemps",
        "L'Été",
        "L'Été",
        "L'Été",
        "L'hiver",
        "L'hiver",
        "L'hiver"
    ]
    
    var animalsOfForestImages: [Image] = [
        Image("fall1"),
        Image("fall2"),
        Image("fall3"),
        Image("spring1"),
        Image("spring2"),
        Image("spring3"),
        Image("summer1"),
        Image("summer2"),
        Image("summer3"),
        Image("winter1"),
        Image("winter2"),
        Image("winter3")


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
                                ForEach(0..<animalsOfForestImages.count, id: \.self) { index in
                                    GeometryReader { geometry in
                                        VStack(alignment: .center) {
                                            animalsOfForestImages[index]
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: geometry.size.width*1, height: geometry.size.height*0.9)
                                                .clipped()
                                                .edgesIgnoringSafeArea(.top)
                                                
                                                
                                            
                                            Text(animalsOfForestText[index])
                                                .fontWeight(.regular)
                                                .foregroundColor(.black)
                                                .padding(.top, 20)
                                                .font(Font.custom("SF Compact Text", size: 40))
                                        }

                                    }
                                    .edgesIgnoringSafeArea(.top)
                                    .tag(index)
                                   // .scaledToFill()
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
            .edgesIgnoringSafeArea(.top)

            
        }
        
        
        
        
        
        
    }
}

#Preview {
    Seasons()
}
