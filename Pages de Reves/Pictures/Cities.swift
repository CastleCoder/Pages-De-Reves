//
//  Cities.swift
//  Pages de Reves
//
//  Created by Cyrille Chateau on 29/12/2023.
//

import SwiftUI

struct Cities: View {
    var citiesText: [String] = [
        "Cap Town, Afrique du Sud",
        "Le Caire, Egypte",
        "Londres, Royaume-Uni",
        "Moscou, Russie",
        "New York, Etats-Unis",
        "Paris, France",
        "Rio de Janeiro, Brésil",
        "Rome, Italie",
        "Sydney, Australie",
        "Tokyo, Japon"
    ]
    
    var citiesImages: [Image] = [
        Image("capetown"),
        Image("lecaire"),
        Image("londres"),
        Image("moscou"),
        Image("newyork"),
        Image("paris"),
        Image("riodejaneiro"),
        Image("rome"),
        Image("sydney"),
        Image("tokyo")

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
                                    ForEach(0..<citiesImages.count, id: \.self) { index in
                                        GeometryReader { geometry in
                                            VStack(alignment: .center) {
                                                citiesImages[index]
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: geometry.size.width*1, height: geometry.size.height*0.9)
                                                    .clipped()
                                                    .edgesIgnoringSafeArea(.top)
                                                    
                                                    
                                                
                                                Text(citiesText[index])
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
    Cities()
}
