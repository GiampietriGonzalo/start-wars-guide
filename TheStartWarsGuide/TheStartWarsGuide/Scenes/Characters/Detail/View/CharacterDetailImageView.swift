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
        Image(characterImageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .background(.black)
            .border(.black, width: 4)
            .frame(width: 100, height: 100, alignment: .center)
            .clipShape(.circle)
    }
}

#Preview {
    CharacterDetailImageView(characterImageName: "Darth Vader")
}
