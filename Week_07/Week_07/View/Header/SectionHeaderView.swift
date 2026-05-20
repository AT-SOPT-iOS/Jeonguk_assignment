//
//  SectionHeaderView.swift
//  Week_07
//
//  Created by 정정욱 on 5/28/25.
//

import SwiftUI

struct SectionHeaderView: View {
    var DisplayTitle: String = ""
    var moreButtonDisplayed: Bool = true
    
    var body: some View {
        HStack(alignment: .center) {
            Text(DisplayTitle)
                .font(.header)
                .bold()
                .foregroundStyle(Color.white)
            Spacer()
            
            if moreButtonDisplayed {
                Text("더보기")
                    .font(.button)
                    .foregroundStyle(Color.gray2)
            }
        }
        .padding(.horizontal, 12)
    }
}

#Preview {
    SectionHeaderView(DisplayTitle: "오늘의 티빙 TOP 20" ,moreButtonDisplayed: false)
        .background(Color.black)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
}
