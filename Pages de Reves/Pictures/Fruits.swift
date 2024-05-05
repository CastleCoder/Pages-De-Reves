//
//  Fruits.swift
//  Pages de Reves
//
//  Created by Cyrille Chateau on 29/12/2023.
//

import SwiftUI

struct Fruits: View {
    var animalsOfForestText: [String] = [
        "L'Abricot",
        "La Pomme",
        "La Banane",
        "La Noix de Coco",
        "La Fraise",
        "La Framboise",
        "L'Orange",
        "L'Ananas",
        "Le Raisin",
        "Le Melon"
    ]
    
    var animalsOfForestImages: [Image] = [
        Image("Abricot"),
        Image("Apple"),
        Image("Banana"),
        Image("coconut"),
        Image("Fraises"),
        Image("Framboises"),
        Image("orangeFruit"),
        Image("pineapple"),
        Image("Raisins"),
        Image("watermelon")

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
    Fruits()
}
