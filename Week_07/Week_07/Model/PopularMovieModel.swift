//
//  PopularMovieModel.swift
//  Week_07
//
//  Created by 정정욱 on 5/28/25.
//

import SwiftUI

struct PopularMovieModel: Identifiable {
    let id = UUID()
    var image: UIImage
}

extension PopularMovieModel {
    static func mockData() -> [PopularMovieModel] {
        return [
            PopularMovieModel(image: ImageLiterals.harryPorter),
            PopularMovieModel(image: ImageLiterals.kong),
            PopularMovieModel(image: ImageLiterals.suzume),
            PopularMovieModel(image: ImageLiterals.theRoadOfTheRings),
            PopularMovieModel(image: ImageLiterals.refrigerator),
            PopularMovieModel(image: ImageLiterals.iWantTouch)
        ]
    }
}
