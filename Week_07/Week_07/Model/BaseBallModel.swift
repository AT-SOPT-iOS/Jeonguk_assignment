//
//  BaseBallModel.swift
//  Week_07
//
//  Created by 정정욱 on 5/28/25.
//

import SwiftUI

struct BaseBallModel: Identifiable {
    let id = UUID()
    var image: UIImage
}

extension BaseBallModel {
    static func mockData() -> [BaseBallModel] {
        return [
            BaseBallModel(image: ImageLiterals.kia),
            BaseBallModel(image: ImageLiterals.dosan),
            BaseBallModel(image: ImageLiterals.lg),
            BaseBallModel(image: ImageLiterals.samsung),
            BaseBallModel(image: ImageLiterals.kia),
            BaseBallModel(image: ImageLiterals.dosan),
            BaseBallModel(image: ImageLiterals.lg),
            BaseBallModel(image: ImageLiterals.samsung)
        ]
    }
}
