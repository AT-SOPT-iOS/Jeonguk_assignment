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
    
    var body: some View {
        ScrollView {
            
            headerView
            
            //MARK: Banner Section
            
            BannerScrollView(bannerModel: bannerModel)
            
            //MARK: Top20 Section
            Top20ScrollView(top20Model: top20Model)
            
            PopularLiveScrollView(popularLiveModel: popularLiveModel)
        
        }
        .background(Color.black)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
    }
    
    var headerView: some View {
        HStack {
            Image(uiImage: ImageLiterals.tving)
                .resizable()
                .scaledToFit()
                .frame(width: 191, height: 78)
            
            Spacer()
            
            HStack(spacing: 10){
                Image(uiImage: ImageLiterals.search)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                Image(uiImage: ImageLiterals.tvingIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            }
        }
        .padding(.horizontal, 10)
    }
}

struct BannerScrollView: View {
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

struct Top20ScrollView: View {
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

struct PopularLiveScrollView: View {
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
    TvingMainView()
}
