//
//  VerticalItemView.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 15/02/2024.
//

import SwiftUI

struct VerticalItemView: View {
    var item: SectionItemViewData
    
    var body: some View {
        HStack {
            if let image = item.image, !image.isEmpty {
                Label(item.title, systemImage: image)
                    .foregroundStyle(.primary.opacity(0.7))
                    .padding([.leading], 6)
            } else {
                Text(item.title)
                    .foregroundStyle(.primary.opacity(0.7))
                    .padding(.leading, 6)
            }
            Spacer()
            Text(item.description)
                .multilineTextAlignment(.trailing)
                .padding(EdgeInsets(top: 2, leading: 0, bottom: 2, trailing: 8))
                .foregroundStyle(.primary.opacity(0.7))
                
        }
    }
}

#Preview {
    VerticalItemView(item: .vehicleCostMock)
}
