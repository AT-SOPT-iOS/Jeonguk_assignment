//
//  ChannelModel.swift
//  Week_07
//
//  Created by 정정욱 on 5/28/25.
//

import SwiftUI

struct ChannelModel: Identifiable {
    let id = UUID()
    var image: UIImage
}

extension ChannelModel {
    static func mockData() -> [ChannelModel] {
        return [
            ChannelModel(image: ImageLiterals.afc),
            ChannelModel(image: ImageLiterals.appleTV),
            ChannelModel(image: ImageLiterals.kbl),
            ChannelModel(image: ImageLiterals.kbo),
            ChannelModel(image: ImageLiterals.kia),
            ChannelModel(image: ImageLiterals.dosan),
            ChannelModel(image: ImageLiterals.lg),
            ChannelModel(image: ImageLiterals.samsung)
        ]
    }
}
