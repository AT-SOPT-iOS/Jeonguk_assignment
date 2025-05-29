//
//  UIFont.swift
//  Week_07
//
//  Created by 정정욱 on 5/27/25.
//

import SwiftUI

// SwiftUI의 .font()는 Font 타입을 사용하기 때문에, UIFont를 SwiftUI용 Font로 변환해줘야 합니다.
extension Font {
    static var head1: Font {
        return Font.custom("Pretendard-Bold", size: 23)
    }

    static var textField: Font {
        return Font.custom("Pretendard-Medium", size: 15)
    }

    static var header: Font {
        return Font.custom("Pretendard-Bold", size: 15)
    }

    static var button: Font {
        return Font.custom("Pretendard-Medium", size: 14)
    }

    static var underlineButton: Font {
        return Font.custom("Pretendard-Light", size: 14)
    }
}
