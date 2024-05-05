//
//  MainPage.swift
//  Pages de Reves
//
//  Created by Cyrille Chateau on 13/12/2023.
//

import SwiftUI

struct MainPage: View {
    var body: some View {
        NavigationStack{
            
            ZStack(){
                
                    GeometryReader { geometry in
                        Image("backgroundpresentation")
                            .resizable()
                            //.aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width*1)
                        
                    }
                    
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        NavigationLink(destination: StoriesBoard()){
                            Text("Entrer")
                                .font(Font.custom("Chalkboard SE", size: 40))
                                .fontWeight(.semibold)
                                .foregroundColor(.presentation)
                            
                            
                        }
                
                
                
            }
            
        }
        .navigationTitle("Page Principale")
    }
    
}

#Preview {
    MainPage()
}
