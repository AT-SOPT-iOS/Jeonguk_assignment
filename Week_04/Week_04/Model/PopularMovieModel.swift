//
//  PopularMovieModel.swift
//  Week_03
//
//  Created by 정정욱 on 5/2/25.
//

import UIKit

struct PopularMovieModel {
    var Image: UIImage
}

extension PopularMovieModel {
    static func mockData() -> [PopularMovieModel] {
        return [
            PopularMovieModel(Image: ImageLiterals.tiving_Top20_Image1),
            PopularMovieModel(Image: ImageLiterals.tiving_Top20_Image2),
            PopularMovieModel(Image: ImageLiterals.tiving_Top20_Image3),
            PopularMovieModel(Image: ImageLiterals.tiving_Top20_Image1),
            PopularMovieModel(Image: ImageLiterals.tiving_Top20_Image2),
            PopularMovieModel(Image: ImageLiterals.tiving_Top20_Image3),
        ]
    }
}
