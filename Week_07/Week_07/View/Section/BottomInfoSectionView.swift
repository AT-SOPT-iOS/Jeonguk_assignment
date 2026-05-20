//
//  BottomInfoSectionView.swift
//  Week_07
//
//  Created by 정정욱 on 5/29/25.
//

import SwiftUI

struct BottomInfoSectionView: View {
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
    BottomInfoSectionView()
}
