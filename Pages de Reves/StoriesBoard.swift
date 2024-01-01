//
//  StoriesBoard.swift
//  Pages de Reves
//
//  Created by Cyrille Chateau on 13/12/2023.
//

import SwiftUI

struct StoriesBoard: View {
    
    
    
    var storyTitle: [String] = [ // Titre des histoires
        "Hello World from Tokyo",
        "Ola Quetal",
        "Hello World from Tokyo",
        "Ola Quetal",
        "Hello World from Tokyooooooooooo",
        "Ola Quetal"
    ]
    
    var storyCover: [Image] = [ // Assets des histoires
        Image("paris")
        
        
        
    ]
    
    var pictureBook : [Image] = [ // Assets des imagiers
        Image("paris"),
        Image("renard"),
        Image("montagne")
    ]
    
    var pictureBookTitle : [String] = [ // Titre des imagiers
        "Les villes",
        "Les animaux de la forêt",
        "Les paysages"
        
    ]
    
    var storyLink: [AnyView] = [ // Liens des histoires
        AnyView(FirstStory()),
        AnyView(SecondStory()),
        AnyView(FirstStory()),
        AnyView(FirstStory())
    ]
    
    var pictureLink: [AnyView] = [ // Liens des imagiers
        AnyView(Cities()),
        AnyView(AnimalsOfForest()),
        AnyView(Landscapes())
    ]
    
    var body: some View {
            NavigationStack {
                
                ZStack{
                    Image("backgroundArray")
                        .resizable()
                        .aspectRatio(contentMode:  .fill)
                        .edgesIgnoringSafeArea(.all)
                    //VStack(alignment: .center){
                        /*VStack{
                            Text("Histoires")
                                .font(Font.custom("Chalkboard SE", size: 50))
                                .foregroundColor(.orange)
                                .padding(.top, 40)
                            
                            HStack( spacing: 30) {
                                // ScrollView(.horizontal) {
                                
                                ForEach(0..<min(storyTitle.count, storyCover.count, storyLink.count), id: \.self) { index in
                                    NavigationLink(
                                        destination: storyLink[index],
                                        label: {
                                            VStack {
                                                storyCover[index]
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .cornerRadius(10.0)
                                                
                                                Text(storyTitle[index])
                                                    .font(Font.custom("Chalkboard SE", size: 20))
                                                    .fontWeight(.medium)
                                                    .foregroundColor(.orange)
                                                    .multilineTextAlignment(.center)
                                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                                            }
                                            .frame(width: geometry.size.width*0.2)
                                            
                                        }
                                    )
                                }
                                
                                
                                
                                // }
                                
                                .frame(width: geometry.size.width*1)
                                
                                
                                .padding(.top, 10)
                            }
                        } */
                        
                        VStack(alignment: .center){
                            Text("Imagiers")
                                .font(Font.custom("Chalkboard SE", size: 50))
                                .foregroundColor(.colorStorieBoard)
                                .padding(.top, 40)
                            GeometryReader{ geometry in

                            ScrollView(.horizontal) {
                                HStack(spacing: 30) {
                                    ForEach(0..<min(pictureBook.count, pictureBookTitle.count, pictureLink.count), id: \.self) { index in
                                        NavigationLink(
                                            destination: pictureLink[index],
                                            label: {
                                                VStack {
                                                    pictureBook[index]
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .cornerRadius(10.0)
                                                    
                                                    Text(pictureBookTitle[index])
                                                        .font(Font.custom("Chalkboard SE", size: 20))
                                                        .fontWeight(.medium)
                                                        .foregroundColor(.color2)
                                                        .multilineTextAlignment(.center)
                                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                                                }
                                                .frame(width: geometry.size.width*0.2)
                                            }
                                        )
                                    }
                                    
                                }
                                //.padding(.leading, 100)
                                .frame(width: geometry.size.width*1)
                                
                                .padding(.top, 10)
                                //Spacer()
                                //.background(Color.green)
                            }
                        }
                   // }
                    
                    
                    
                    
                }
            }
            .navigationTitle("Tableaux")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)

        }
        
    }
    
}

#Preview {
    StoriesBoard()
}
