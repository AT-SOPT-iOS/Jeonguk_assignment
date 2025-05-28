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
    
    var body: some View {
        ScrollView {
            
            headerView
            
            //MARK: Banner Section
            
            BannerScrollView(bannerModel: bannerModel)
            
            //MARK: Top20 Section
            
            SectionHeaderView(moreButtonDisplayed: false)
            Top20ScrollView(top20Model: top20Model)
        
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
    TvingMainView()
}
