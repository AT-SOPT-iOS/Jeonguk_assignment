//
//  PopularLiveModel.swift
//  Week_03
//
//  Created by 정정욱 on 5/2/25.
//

import UIKit

struct PopularLiveModel {
    var Image: UIImage
    var Rank: String
    var channel: String
    var episode: String
    var rating: String
}

extension PopularLiveModel {
    static func mockData() -> [PopularLiveModel] {
        return [
            PopularLiveModel(Image: ImageLiterals.tiving_PopularLive_Image3, Rank: "1", channel: "JTBC", episode: "이혼숙려캠프 34화", rating: "27.7"),
            PopularLiveModel(Image: ImageLiterals.tiving_PopularLive_Image4, Rank: "2", channel: "뿅뿅지구오락실", episode: "14화", rating: "24.1"),
            PopularLiveModel(Image: ImageLiterals.tiving_PopularLive_Image1, Rank: "3", channel: "뿅뿅지구오락실", episode: "지구오락실 14화", rating: "23.7"),
            PopularLiveModel(Image: ImageLiterals.tiving_PopularLive_Image2, Rank: "4", channel: "JTBC", episode: "전공의 생활 3화", rating: "17.7"),
        ]
    }
}
