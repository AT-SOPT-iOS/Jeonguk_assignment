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
                    headerView
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

                    BannerScrollView(bannerModel: bannerModel)
                    Top20ScrollView(top20Model: top20Model)
                    PopularLiveScrollView(popularLiveModel: popularLiveModel)
                    PopularMovieScrollView(popularMovieModel: popularMovieModel)
                    BaseBallScrollView(baseBallModel: baseBallModel)
                    ChannelScrollView(channelModel: channelModel)
                    BottomInfoView()
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

    var headerView: some View {
        HStack {
            Image(uiImage: ImageLiterals.tving)
                .resizable()
                .scaledToFit()
                .frame(width: 191, height: 78)

            Spacer()

            HStack(spacing: 10) {
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
        .padding(.horizontal, 16)
        .padding(.top, 10)
        .padding(.bottom, 8)
        .background(Color.black)
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

struct PopularMovieScrollView: View {
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

struct BaseBallScrollView: View {
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

struct ChannelScrollView: View {
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

struct BottomInfoView: View {
    var body: some View {
        VStack(spacing: 0) {
            Button {
                // 액션
            } label: {
                ZStack {
                    Rectangle()
                        .fill(Color.gray6)
                        .frame(height: 50)
                        .cornerRadius(5)
                    HStack {
                        Text("공지")
                            .foregroundColor(.gray7)
                            .font(.system(size: 11))
                        
                        Text("티빙 계정 공유 정책 추가 안내")
                            .foregroundColor(.white)
                            .font(.system(size: 11))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 16)
                }
                .padding(.top, 23)
                .padding(.horizontal, 14)
            }

            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    HStack(spacing: 6) {
                        bottomLink("고객 문의")
                        separatorDot()
                        bottomLink("이용약관")
                        separatorDot()
                        bottomLink("개인정보처리방침", isHighlighted: true)
                    }

                    HStack(spacing: 6) {
                        bottomLink("사업자정보")
                        separatorDot()
                        bottomLink("인재채용")
                    }
                }

                Spacer()
            }
            .padding(.top, 13)
            .padding(.horizontal, 20)
        }
    }

    @ViewBuilder
    private func bottomLink(_ text: String, isHighlighted: Bool = false) -> some View {
        Button(action: {
            // 각 버튼 액션
        }) {
            Text(text)
                .foregroundColor(isHighlighted ? .white : .gray7)
                .font(.system(size: 11))
        }
    }

    private func separatorDot() -> some View {
        Circle()
            .fill(Color.gray7)
            .frame(width: 2, height: 2)
            .alignmentGuide(.firstTextBaseline) { d in d[VerticalAlignment.center] }
    }
}

#Preview {
    TvingMainView()
}
