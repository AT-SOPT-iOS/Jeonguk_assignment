//
//  Top20Model.swift
//  Week_03
//
//  Created by 정정욱 on 5/1/25.
//

import SwiftUI

struct Top20Model: Identifiable {
    var id = UUID()
    var top20Rank: String
    var top20Image: UIImage
}

extension Top20Model {
    static func mockData() -> [Top20Model] {
        return [
            Top20Model(top20Rank: "1", top20Image: ImageLiterals.refrigerator),
            Top20Model(top20Rank: "2", top20Image: ImageLiterals.signal),
            Top20Model(top20Rank: "3", top20Image: ImageLiterals.suzume),
            Top20Model(top20Rank: "4", top20Image: ImageLiterals.theRoadOfTheRings),
            Top20Model(top20Rank: "5", top20Image: ImageLiterals.iWantTouch)
        ]
    }
}
