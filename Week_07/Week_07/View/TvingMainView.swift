//
//  ContentView.swift
//  Week_07
//
//  Created by 정정욱 on 5/27/25.
//

import SwiftUI

struct TvingMainView: View {
    let bannerModel = BannerModel.mockData()
    let top20Model = Top20Model.mockData()
    let popularLiveModel = PopularLiveModel.mockData()
    let popularMovieModel = PopularMovieModel.mockData()
    let baseBallModel = BaseBallModel.mockData()
    let channelModel = ChannelModel.mockData()
    
    @State private var isTabBarSticky: Bool = false
    @State private var tabBarOffset: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack(spacing: 0) {
                    
                    HeaderView()
                    GeometryReader { geo in
                        Color.clear
                            .onAppear {
                                tabBarOffset = geo.frame(in: .global).minY
                            }
                            .background(
                                GeometryReader { innerGeo in
                                    Color.clear
                                        .onChange(of: innerGeo.frame(in: .global).minY) { oldValue, newValue in
                                            withAnimation(.easeInOut(duration: 0.2)) {
                                                isTabBarSticky = newValue < 60
                                            }
                                        }
                                }
                            )
                    }
                    .frame(height: 0)
                    
                    if !isTabBarSticky {
                        ScrollableTabBarView()
                            .background(Color.black)
                    }
                    
                    BannerSectionView(bannerModel: bannerModel)
                    Top20SectionView(top20Model: top20Model)
                    PopularLiveSectionView(popularLiveModel: popularLiveModel)
                    PopularMovieSectionView(popularMovieModel: popularMovieModel)
                    BaseBallSectionView(baseBallModel: baseBallModel)
                    ChannelSectionView(channelModel: channelModel)
                    BottomInfoSectionView()
                }
            }
            
            if isTabBarSticky {
                VStack(spacing: 0) {
                    ScrollableTabBarView()
                }
                .transition(.move(edge: .top))
                .animation(.easeInOut(duration: 0.2), value: isTabBarSticky)
                .zIndex(1)
            }
        }
        .background(Color.black)
    }
}

#Preview {
    TvingMainView()
}
