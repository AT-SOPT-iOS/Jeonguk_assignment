//
//  Top20Model.swift
//  Week_03
//
//  Created by 정정욱 on 5/1/25.
//

import UIKit

struct Top20Model {
    var Top20Rank: String
    var Top20Image: UIImage
}

extension Top20Model {
    static func mockData() -> [Top20Model] {
        return [
            Top20Model(Top20Rank: "1", Top20Image: ImageLiterals.tiving_Top20_Image1),
            Top20Model(Top20Rank: "2", Top20Image: ImageLiterals.tiving_Top20_Image2),
            Top20Model(Top20Rank: "3", Top20Image: ImageLiterals.tiving_Top20_Image3),
            Top20Model(Top20Rank: "4", Top20Image: ImageLiterals.tiving_Top20_Image4)
        ]
    }
}
