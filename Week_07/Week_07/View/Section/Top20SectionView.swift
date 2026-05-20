//
//  Top20SectionView.swift
//  Week_07
//
//  Created by 정정욱 on 5/29/25.
//

import SwiftUI

struct Top20SectionView: View {
    let top20Model: [Top20Model]
    
    var body: some View {
        SectionHeaderView(DisplayTitle: "오늘의 티빙 TOP 20" ,moreButtonDisplayed: false)
            .padding(.top, 9)
        
        ScrollView(.horizontal) {
            LazyHStack(spacing: 20) {
                ForEach(top20Model, id: \.id) { data in
                    HStack(alignment: .bottom) {
                        Text("\(data.top20Rank)")
                            .italic()
                            .font(.system(size: 50, weight: .bold))
                            .foregroundStyle(Color.white)
                            .rotationEffect(.degrees(3))
                        
                        Image(uiImage: data.top20Image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 98, height: 146)
                    }
                }
            }
        }
        .padding(.leading, 12)
        .padding(.top, 9)
    }
}

#Preview {
    Top20SectionView(top20Model: Top20Model.mockData())
}
