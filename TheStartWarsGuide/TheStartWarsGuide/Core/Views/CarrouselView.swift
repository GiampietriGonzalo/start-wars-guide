//
//  CarrouselView.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 19/02/2024.
//

import SwiftUI

struct CarrouselView: View {
    @State var section: CarrouselSectionViewData
    @State var fullWidth: CGFloat
    
    var body: some View {
        VStack {
            CarrouselTitleView(title: section.title)
            CarrouselBodyView(section: section, fullWidth: fullWidth)
            Spacer(minLength: 32)
        }
    }
}

fileprivate struct CarrouselTitleView: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .padding(.leading, 8)
            Spacer()
        }
    }
}

fileprivate struct CarrouselBodyView: View {
    let section: CarrouselSectionViewData
    let fullWidth: CGFloat
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(section.items) { items in
                    CardView(viewData: items)
                        .frame(width: section.items.count > 1 ? fullWidth * 0.8 : fullWidth * 0.95,
                               height: section.type.rawValue)
                }
            }
        }
        .scrollDisabled(section.items.count == 1)
        .padding(.leading, 8)
    }
}
