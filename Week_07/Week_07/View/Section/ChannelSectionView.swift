//
//  ChannelSectionView.swift
//  Week_07
//
//  Created by 정정욱 on 5/29/25.
//

import SwiftUI

struct ChannelSectionView: View {
    let channelModel: [ChannelModel]
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 7) {
                ForEach(channelModel, id: \.id) { data in
                    ZStack {
                        Rectangle()
                            .fill(Color.gray6)
                            .frame(width: 90, height: 45)
                            .cornerRadius(5)
                        
                        Image(uiImage: data.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 68, height: 34)
                    }
                }
            }
        }
        .padding(.top, 28)
        .padding(.leading, 15)
    }
}

#Preview {
    ChannelSectionView(channelModel: ChannelModel.mockData())
}
