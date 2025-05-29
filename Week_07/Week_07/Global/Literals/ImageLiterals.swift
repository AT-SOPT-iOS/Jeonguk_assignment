//
//  ImageLiterals.swift
//  Week_07
//
//  Created by 정정욱 on 5/27/25.
//

import SwiftUI

enum ImageLiterals {

    // MARK: - TextField Icons
    
    static var icXcircle: UIImage { .load(name: "ic_xcircle") }
    static var icEyeSlash: UIImage { .load(name: "ic_eyeSlash") }

    // MARK: - Logo
    
    static var tvingLogo: UIImage { .load(name: "tvingLogo") }
    static var tving: UIImage { .load(name: "tving") }
    static var tvingIcon: UIImage { .load(name: "tvingIcon") }
    
    // MARK: - BaseBallTeam
    
    static var kia: UIImage { .load(name: "kia") }
    static var dosan: UIImage { .load(name: "dosan") }
    static var lg: UIImage { .load(name: "lg") }
    static var samsung: UIImage { .load(name: "samsung") }

    // MARK: - Long Thumbnails
    
    static var whatYourName: UIImage { .load(name: "whatYourName") }
    static var askToStar: UIImage { .load(name: "askToStar") }
    static var divorceInsurance: UIImage { .load(name: "divorceInsurance") }
    static var earthArcade3: UIImage { .load(name: "earthArcade3") }
    static var residentLife: UIImage { .load(name: "residentLife") }
    static var runWithSJ: UIImage { .load(name: "runWithSJ") }
    static var transitLove3: UIImage { .load(name: "transitLove3") }

    // MARK: - Shorts Thumbnails
    
    static var baseBall: UIImage { .load(name: "baseBall") }
    static var harryPorter: UIImage { .load(name: "harryPorter") }
    static var heartSignal: UIImage { .load(name: "heartSignal") }
    static var iamSolo: UIImage { .load(name: "iamSolo") }
    static var iWantTouch: UIImage { .load(name: "iWantTouch") }
    static var kong: UIImage { .load(name: "kong") }
    static var nctLife: UIImage { .load(name: "nctLife") }
    static var refrigerator: UIImage { .load(name: "refrigerator") }
    static var signal: UIImage { .load(name: "signal") }
    static var suzume: UIImage { .load(name: "suzume") }
    static var theRoadOfTheRings: UIImage { .load(name: "theRoadOfTheRings") }
    
    //MARK: - Channel
    
    static var afc: UIImage { .load(name: "afc") }
    static var appleTV: UIImage { .load(name: "appleTV") }
    static var kbl: UIImage { .load(name: "kbl") }
    static var kbo: UIImage { .load(name: "kbo") }
    
    //MARK: ETC
    
    static var search: UIImage { .load(name: "SearchIamge") }
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
