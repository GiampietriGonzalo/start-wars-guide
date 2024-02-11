//
//  CellWithImage.swift
//  TheStartWarsGuide
//
//  Created by Gonzalo.Giampietri on 09/02/2024.
//

import SwiftUI
import Observation

struct CellWithImage: View {
    @State var text: String
    @State var imageName: String
    
    var body: some View {
        HStack {
            Image(imageName, bundle: nil)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .background(.black)
                .clipShape(.circle)
            Text(text)
            Spacer()
        }
    }
}

#Preview {
    CellWithImage(text: "Luke Skywalker", imageName: "1")
}
