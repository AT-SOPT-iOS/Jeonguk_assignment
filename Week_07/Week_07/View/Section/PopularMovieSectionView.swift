//
//  PopularMovieSectionView.swift
//  Week_07
//
//  Created by 정정욱 on 5/29/25.
//

import SwiftUI

struct PopularMovieSectionView: View {
    let popularMovieModel: [PopularMovieModel]
    
    var body: some View {
        SectionHeaderView(DisplayTitle: "실시간 인기 영화")
            .padding(.top, 18)
        
        ScrollView(.horizontal) {
            LazyHStack(spacing: 8) {
                ForEach(popularMovieModel, id: \.id) { data in
                    Image(uiImage: data.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 98, height: 146)
                }
            }
        }
        .padding(.leading, 12)
        .padding(.top, 9)
    }
}

#Preview {
    PopularMovieSectionView(popularMovieModel: PopularMovieModel.mockData())
}
