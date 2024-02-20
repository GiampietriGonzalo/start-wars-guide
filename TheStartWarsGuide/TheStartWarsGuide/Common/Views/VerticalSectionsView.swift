//
//  VerticalSectionsView.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 16/02/2024.
//

import SwiftUI

struct VerticalSectionsView: View {
    var sections: [SectionViewData]
    
    var body: some View {
        VStack {
            ForEach(sections) { section in
                VStack {
                    HStack {
                        Text(section.title)
                            .font(.title2)
                            .padding(.leading, 8)
                        Spacer()
                    }
                    .padding(.bottom, 2)
                    ForEach(section.items) { item in
                        VerticalItemView(item: item)
                            .padding(EdgeInsets(top: 0.5, leading: 16, bottom: 0.5, trailing: 16))
                    }
                }
                Divider()
            }
            .padding(EdgeInsets(top: 24, leading: 16, bottom: 0, trailing: 16))
        }
    }
}


#Preview {
    VerticalSectionsView(sections: [.mock, .mock])
}
