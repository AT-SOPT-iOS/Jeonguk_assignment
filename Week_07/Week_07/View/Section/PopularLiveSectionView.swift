//
//  PopularLiveSectionView.swift
//  Week_07
//
//  Created by 정정욱 on 5/29/25.
//

import SwiftUI

struct PopularLiveSectionView: View {
    let popularLiveModel: [PopularLiveModel]
    
    var body: some View {
        SectionHeaderView(DisplayTitle: "실시간 인기 LIVE")
            .padding(.top, 9)
        
        ScrollView(.horizontal) {
            LazyHStack(spacing: 7) {
                ForEach(popularLiveModel, id: \.id) { data in
                    VStack() {
                        Image(uiImage: data.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 160, height: 80)
                        
                        HStack(alignment: .top) {
                            Text("\(data.rank)")
                                .italic()
                                .font(.system(size: 19, weight: .bold))
                                .foregroundStyle(Color.white)
                                .rotationEffect(.degrees(3))
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text(data.channel)
                                    .font(.system(size: 10))
                                    .foregroundStyle(Color.white)
                                Text(data.episode)
                                    .font(.system(size: 10))
                                    .foregroundStyle(Color.gray2)
                                Text(data.rating)
                                    .font(.system(size: 10))
                                    .foregroundStyle(Color.gray2)
                            }
                            
                            Spacer()
                        }
                        .padding(.top, 10)
                    }
                }
            }
        }
        .padding(.leading, 12)
        .padding(.top, 9)
    }
}

#Preview {
    PopularLiveSectionView(popularLiveModel: PopularLiveModel.mockData())
}
