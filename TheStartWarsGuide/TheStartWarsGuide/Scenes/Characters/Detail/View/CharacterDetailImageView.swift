//
//  CharacterDetailImageView.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 16/02/2024.
//

import SwiftUI

struct CharacterDetailImageView: View {
    
    let characterImageName: String
    
    var body: some View {
        VStack {
            Spacer()
            Image(characterImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(.circle)
        }
    }
}

#Preview {
    CharacterDetailImageView(characterImageName: "Luke Skywalker")
}
