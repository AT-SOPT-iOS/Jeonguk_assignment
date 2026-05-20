//
//  PopularLiveModel.swift
//  Week_03
//
//  Created by 정정욱 on 5/2/25.
//

import SwiftUI

struct BannerModel: Identifiable {
    var id = UUID()
    var Image: UIImage
}

extension BannerModel {
    static func mockData() -> [BannerModel] {
        return [
            BannerModel(Image: ImageLiterals.iWantTouch),
            BannerModel(Image: ImageLiterals.kong),
            BannerModel(Image: ImageLiterals.nctLife),
            BannerModel(Image: ImageLiterals.refrigerator),
            BannerModel(Image: ImageLiterals.signal),
            BannerModel(Image: ImageLiterals.suzume),
            BannerModel(Image: ImageLiterals.theRoadOfTheRings)
        ]
    }
}
