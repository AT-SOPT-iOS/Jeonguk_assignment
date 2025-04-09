//
//  UIFont.swift
//  Week_1
//
//  Created by 정정욱 on 4/10/25.
//

import UIKit

extension UIFont {
    enum Pretendard {
        static func regular(size: CGFloat) -> UIFont {
            return UIFont(name: "Pretendard-Regular", size: size)!
        }
        
        static func bold(size: CGFloat) -> UIFont {
            return UIFont(name: "Pretendard-Bold", size: size)!
        }

        static func semiBold(size: CGFloat) -> UIFont {
            return UIFont(name: "Pretendard-SemiBold", size: size)!
        }
        
        // 필요한 스타일 추가 가능
    }
}
