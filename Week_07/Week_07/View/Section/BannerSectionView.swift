//
//  BannerSectionView.swift
//  Week_07
//
//  Created by 정정욱 on 5/29/25.
//

import SwiftUI

struct BannerSectionView: View {
    let bannerModel: [BannerModel]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 0) {
                ForEach(bannerModel, id: \.id) { data in
                    Image(uiImage: data.Image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: 400)
                        .clipped()
                        .containerRelativeFrame(.horizontal)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .frame(height: 400)
    }
}

#Preview {
    BannerSectionView(bannerModel: BannerModel.mockData())
}
