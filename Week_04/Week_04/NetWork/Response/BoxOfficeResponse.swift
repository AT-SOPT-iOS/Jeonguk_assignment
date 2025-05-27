//
//  MovieResponse.swift
//  Week_04
//
//  Created by 정정욱 on 5/9/25.
//

import Foundation

struct BoxOfficeResponse: Codable {
    let boxOfficeResult: BoxOfficeResult
}

// MARK: - BoxOfficeResult

struct BoxOfficeResult: Codable {
    let boxofficeType, showRange: String
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}

// MARK: - DailyBoxOfficeList

struct DailyBoxOfficeList: Codable {
    let rank: String
    let movieNm: String
    let openDt: String
    let salesAcc: String
    let audiAcc: String
    
    enum CodingKeys: String, CodingKey {
        case rank
        case movieNm, openDt, salesAcc, audiAcc
    }
}
