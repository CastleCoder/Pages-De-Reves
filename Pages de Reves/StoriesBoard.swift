//
//  StoriesBoard.swift
//  Pages de Reves
//
//  Created by Cyrille Chateau on 13/12/2023.
//

import SwiftUI
import AVKit



struct StoriesBoard: View {
    
    let screenWidth = UIScreen.main.bounds.width
    
    @State private var player: AVAudioPlayer?
    
    
    
    
    var storyTitle: [String] = [ // Titre des histoires
        "OKKKKKKKKKKKKKKK",
        "OlaAAAAAAAAAA",
        "OKKKKKKKKKKKKKKK",
        "OlaAAAAAAAAAA",
        "OKKKKKKKKKKKKKKK",
        "OlaAAAAAAAAAA",
    ]
    
    var storyCover: [Image] = [ // Assets des histoires
        Image("paris"),
        Image("paris"),
        Image("paris"),
        
        
        
        
    ]
    
    var pictureBook : [Image] = [ // Assets des imagiers
        Image("paris"),
        Image("renard"),
        Image("montagne"),
        Image("winter1"),
        Image("Banana"),
        Image("Agriculteur"),
        Image("Purple"),

        
    ]
    
    var pictureBookTitle : [String] = [ // Titre des imagiers
        "Les villes",
        "Les animaux de la forêt",
        "Les paysages",
        "Les saisons",
        "Les fruits",
        "Les métiers",
        "Les couleurs"
        
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
        AnyView(Landscapes()),
        AnyView(Seasons()),
        AnyView(Fruits()),
        AnyView(Jobs()),
        AnyView(Colors()),

    ]
    
    var body: some View {
        let elementWidth = screenWidth * 0.95

        NavigationStack {
            ZStack {
                Image("backgroundArray")
                    .resizable()
                    .aspectRatio(contentMode:  .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center) {
           /*         Text("Histoires")
                        .font(Font.custom("Chalkboard SE", size: 50))
                        .foregroundColor(.orange)
                        .padding(.top, 40)
                    
                    HStack {
                        ScrollView(.horizontal) {
                            LazyHStack(spacing: 30) {
                                ForEach(0..<min(storyTitle.count, storyCover.count, storyLink.count), id: \.self) { index in
                                    NavigationLink(destination: storyLink[index]) {
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
                                    }
                                    .onDisappear() {
                                        stopSound()
                                    }
                                }
                            }
                            .padding(.top, 10)
                        }
                        
                    }
                    .frame(width: elementWidth) */
                    
                    Text("Imagiers")
                        .font(Font.custom("Chalkboard SE", size: 50))
                        .foregroundColor(.colorStorieBoard)
                        .padding(.top, 40)
                    
                    HStack {
                        ScrollView(.horizontal) {
                            LazyHStack(spacing: 30) {
                                ForEach(0..<min(pictureBook.count, pictureBookTitle.count, pictureLink.count), id: \.self) { index in
                                    NavigationLink(destination: pictureLink[index]) {
                                        VStack {
                                            pictureBook[index]
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .cornerRadius(10.0)
                                                .frame(height: 300)
                                            
                                            Text(pictureBookTitle[index])
                                                .font(Font.custom("Chalkboard SE", size: 20))
                                                .fontWeight(.medium)
                                                .foregroundColor(.color2)
                                                .multilineTextAlignment(.center)
                                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                                        }
                                    }
                                    .onDisappear() {
                                        stopSound()
                                    }
                                }
                            }
                            .padding(.top, 10)
                        }
                    }
                    .frame(width: elementWidth)
                }
                
            }
            .navigationTitle("Tableaux")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
        .onAppear() {
            playSound()
        }
    }
    
    
    func playSound() {
        if let soundURL = Bundle.main.url(forResource: "boardsTheme", withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: soundURL)
                
                // Le nombre de loop -1 servira pour une lecture à l'infini
                player?.numberOfLoops = -1
                player?.play()
                print("Lecture du son")
            } catch {
                print("Error", error.localizedDescription)
            }
            
        }
    }
    func stopSound() {
        player?.stop()
        print("Arret du son")
    }
    
}

#Preview {
    StoriesBoard()
}
