//
//  UIImage.swift
//  Week_03
//
//  Created by 정정욱 on 5/1/25.
//

import UIKit

enum ImageLiterals {
   
    static var tiving_Benner1: UIImage { .load(name: "Benner1") }
    static var tiving_Benner2: UIImage { .load(name: "Benner2") }
    static var tiving_Benner3: UIImage { .load(name: "Benner3") }
    static var tiving_Benner4: UIImage { .load(name: "Benner4") }
    
    static var tiving_Top20_Image1: UIImage { .load(name: "movie1") }
    static var tiving_Top20_Image2: UIImage { .load(name: "movie2") }
    static var tiving_Top20_Image3: UIImage { .load(name: "movie3") }
    static var tiving_Top20_Image4: UIImage { .load(name: "movie4") }
    
}

extension UIImage {
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        return image
    }

    static func load(systemName: String) -> UIImage {
        guard let image = UIImage(systemName: systemName, compatibleWith: nil) else {
            return UIImage()
        }
        return image
    }
}
