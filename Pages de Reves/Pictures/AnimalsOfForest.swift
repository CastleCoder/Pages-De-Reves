//
//  AnimalsOfForest.swift
//  Pages de Reves
//
//  Created by Cyrille Chateau on 29/12/2023.
//

import SwiftUI

struct AnimalsOfForest: View {
    var animalsOfForestText: [String] = [
        "Un cerf",
        "Une chouette",
        "Un écureuil",
        "Un hérisson",
        "Un hibou",
        "Un lapin",
        "Un loup",
        "Un ours",
        "Un renard",
        "Un sanglier"
    ]
    
    var animalsOfForestImages: [Image] = [
        Image("cerf"),
        Image("chouette"),
        Image("ecureuil"),
        Image("herisson"),
        Image("hibou"),
        Image("lapin"),
        Image("loup"),
        Image("ours"),
        Image("renard"),
        Image("sanglier")

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
    AnimalsOfForest()
}
