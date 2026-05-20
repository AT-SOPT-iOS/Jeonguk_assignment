//
//  ScrollableTabBarView.swift
//  Week_07
//
//  Created by 정정욱 on 5/29/25.
//

import SwiftUI

struct ScrollableTabBarView: View {
    let tabs = ["홈", "드라마", "예능", "영화", "스포츠", "뉴스", "몰아보기", "SOPT"]
    @State private var selectedIndex: Int = 0
    @Namespace private var indicatorNamespace

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 28) {
                ForEach(tabs.indices, id: \.self) { index in
                    Button(action: {
                        withAnimation(.easeInOut) {
                            selectedIndex = index
                        }
                    }) {
                        VStack(spacing: 7) {
                            Text(tabs[index])
                                .foregroundColor(selectedIndex == index ? .white : .gray)

                            // 인디케이터 바
                            if selectedIndex == index {
                                RoundedRectangle(cornerRadius: 2)
                                    .fill(Color.white)
                                    .frame(height: 3)
                                    .matchedGeometryEffect(id: "indicator", in: indicatorNamespace)
                            } else {
                                Color.clear.frame(height: 3)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 18)
        }
        .padding(.bottom, 7)
        .background(Color.black)
    }
}

#Preview {
    ScrollableTabBarView()
}
