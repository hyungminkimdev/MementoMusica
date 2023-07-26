//
//  StartView.swift
//  Guitar
//
//  Created by Hyungmin Kim on 2023/04/18.
//

import SwiftUI

struct StartView: View {
    @Binding var isPresented : Int
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                // 8ecae6
                Color(red: 0x8E/255, green: 0xCA/255, blue: 0xE6/255).ignoresSafeArea()
                
                VStack(spacing: 15) {
                    Spacer()
                        .frame(width: geo.size.width * 1, height: geo.size.height * 0.05)
                    
                    Text("Memento Musica")
                        .foregroundColor(.white)
                        .font(.system(size: 45, weight: .bold))
                    ZStack {
                        Image("Pic1")
                            .resizable()
                            .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.7)
                    }
                    VStack {
                        Spacer()
                        
                        HStack {
                            Spacer()
                                .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.15)
                            Button("Continue ➤"){
                                isPresented = 1
                            }
                            .frame(width: geo.size.width * 0.5, height: geo.size.height * 0.15)
                            .foregroundColor(.white)
                            .font(.system(size: 25, weight: .regular))
                        }
                    }
                }
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(isPresented: .constant(0))
    }
}
