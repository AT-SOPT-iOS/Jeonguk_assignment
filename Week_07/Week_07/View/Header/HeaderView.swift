//
//  HeaderView.swift
//  Week_07
//
//  Created by 정정욱 on 5/29/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
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
