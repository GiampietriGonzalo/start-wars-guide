//
//  CardView.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo Giampietri
//

import SwiftUI

struct CardView: View {
    let viewData: SectionViewData

    var body: some View {
        VStack {
            Spacer(minLength: 16)
            Text(viewData.title)
                .font(.title3)
                .multilineTextAlignment(.center)
            Divider().background(.primary)
           
            if let imageName = viewData.imageName?.replacingOccurrences(of: "/", with: ""),
               !imageName.isEmpty {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 280)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                Divider().background(.primary)
            }
            
            CardInformationView(items: viewData.items)
        }
        .border(.primary, width: 0.2)
    }
}

fileprivate struct CardInformationView: View {
    let items: [SectionItemViewData]
    
    var body: some View {
        ScrollView {
            ForEach(items) { item in
                VerticalItemView(item: item)
                    .clipShape(.rect(cornerRadius: 8))
                    .font(.headline)
                Divider()
            }
        }
        .scrollDisabled(true)
    }
}

#Preview {
    CardView(viewData: .mock)
        .padding(10)
        .preferredColorScheme(.dark)
}
