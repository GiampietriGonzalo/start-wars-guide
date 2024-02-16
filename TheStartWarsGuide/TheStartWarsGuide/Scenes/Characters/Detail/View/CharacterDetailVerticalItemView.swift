//
//  CharacterDetailVerticalItemView.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 15/02/2024.
//

import SwiftUI

struct CharacterDetailVerticalItemView: View {
    var item: SectionItemViewData
    
    var body: some View {
        HStack {
            Label(item.title, systemImage: item.image ?? "")
            Spacer()
            Text(item.description)
                .multilineTextAlignment(.trailing)
                
        }
    }
}
