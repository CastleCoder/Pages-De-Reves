//
//  MainPage.swift
//  Pages de Reves
//
//  Created by Cyrille Chateau on 13/12/2023.
//

import SwiftUI
import AVKit

struct MainPage: View {
    @State private var player: AVAudioPlayer?
    
    var body: some View {
        
        
        
        NavigationStack{
            NavigationLink(destination: StoriesBoard()){
                
                ZStack(){
                    GeometryReader { geometry in
                        Image("backgroundpresentation")
                            .resizable()
                        //.aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width*1)
                    }
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    Text("Appuyez sur l'écran")
                        .font(Font.custom("Chalkboard SE", size: 40))
                        .fontWeight(.semibold)
                        .foregroundColor(.presentation)
                }
                .onDisappear() {
                    stopSound()
                }
            }
        }
        .navigationTitle("Page Principale")
        .onAppear() {
            playSound()
        }
        
    }
    
    func playSound() {
        if let soundURL = Bundle.main.url(forResource: "Main_theme", withExtension: "mp3") {
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
    MainPage()
}
