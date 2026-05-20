//
//  BaseBallSectionView.swift
//  Week_07
//
//  Created by 정정욱 on 5/29/25.
//

import SwiftUI

struct BaseBallSectionView: View {
    let baseBallModel: [BaseBallModel]
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 0) {
                ForEach(baseBallModel.indices, id: \.self) { index in
                    let data = baseBallModel[index]
                    let isEven = index % 2 == 0
                    
                    ZStack {
                        Rectangle()
                            .fill(isEven ? Color.white : Color.black)
                            .frame(width: 80, height: 50)
                        
                        Image(uiImage: data.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 55, height: 40)
                    }
                }
            }
        }
        .padding(.top, 28)
    }
}

#Preview {
    BaseBallSectionView(baseBallModel: BaseBallModel.mockData())
}
