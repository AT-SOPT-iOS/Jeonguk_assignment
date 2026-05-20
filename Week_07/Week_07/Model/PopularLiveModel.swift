//
//  PopularMovieModel.swift
//  Week_03
//
//  Created by 정정욱 on 5/2/25.
//

import SwiftUI

struct PopularLiveModel: Identifiable {
    var id = UUID()
    var image: UIImage
    var rank: String
    var channel: String
    var episode: String
    var rating: String
}

extension PopularLiveModel {
    static func mockData() -> [PopularLiveModel] {
        return [
            PopularLiveModel(image: ImageLiterals.askToStar, rank: "1", channel: "뿅뿅지구오락실", episode: "14화", rating: "24.1"),
            PopularLiveModel(image: ImageLiterals.divorceInsurance, rank: "2", channel: "뿅뿅지구오락실", episode: "지구오락실 14화", rating: "23.7"),
            PopularLiveModel(image: ImageLiterals.earthArcade3, rank: "3", channel: "JTBC", episode: "우기의 아쉽다 3화", rating: "78.7"),
            PopularLiveModel(image: ImageLiterals.residentLife, rank: "4", channel: "JTBC", episode: "영서의 요아정 먹방 12화", rating: "91.7"),
            PopularLiveModel(image: ImageLiterals.runWithSJ, rank: "5", channel: "JTBC", episode: "나연아 건강챙겨 1화", rating: "91.7")
        ]
    }
}
