//
//  Top20Model.swift
//  Week_03
//
//  Created by 정정욱 on 5/1/25.
//

import UIKit

struct Top20Model {
    var top20Rank: String
    var top20Image: UIImage
}

extension Top20Model {
    static func mockData() -> [Top20Model] {
        return [
            Top20Model(top20Rank: "1", top20Image: ImageLiterals.tiving_Top20_Image1),
            Top20Model(top20Rank: "2", top20Image: ImageLiterals.tiving_Top20_Image2),
            Top20Model(top20Rank: "3", top20Image: ImageLiterals.tiving_Top20_Image3),
            Top20Model(top20Rank: "4", top20Image: ImageLiterals.tiving_Top20_Image4)
        ]
    }
}
