//
//  VerticalSectionsView.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 16/02/2024.
//

import SwiftUI

struct VerticalSectionsView: View {
    var sections: [VerticalSectionViewData]
    
    var body: some View {
        List {
            ForEach(sections) { section in
                Section(section.title) {
                    ForEach(section.items) { item in
                        CharacterDetailVerticalItemView(item: item)
                    }
                }
                .headerProminence(.increased)
            }
            .listStyle(.insetGrouped)
        }
    }
}
