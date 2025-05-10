//
//  CharacterDetailImageView.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
//

import SwiftUI

struct CharacterDetailImageView: View {
    let characterImageName: String
    
    var body: some View {
        ZStack() {
            Image(characterImageName)
                .resizable()
                .scaledToFill()
            
            LinearGradient(
                gradient: Gradient(colors: [.black.opacity(0.8), .clear]),
                startPoint: .bottom,
                endPoint: .top
            )
        }
    }
}

#Preview {
    CharacterDetailImageView(characterImageName: "Luke Skywalker")
}
