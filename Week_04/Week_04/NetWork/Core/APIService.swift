//
//  APIService.swift
//  Week_04
//
//  Created by 정정욱 on 5/6/25.
//

import Foundation

final class APIService {
    static let shared = APIService()
    private init() {}

    private let baseURL = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"
    private let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String ?? ""


    func request<T: Decodable>(
        queryItems: [URLQueryItem],
        responseType: T.Type
    ) async throws -> T {
        
        print("BASE_URL: \(baseURL)")
        print("API_KEY: \(apiKey)")
        
        guard var urlComponents = URLComponents(string: baseURL) else {
            throw NetworkError.invalidURL
        }

        var fullQueryItems = queryItems
        fullQueryItems.insert(URLQueryItem(name: "key", value: apiKey), at: 0)
        urlComponents.queryItems = fullQueryItems

        guard let url = urlComponents.url else {
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.responseError
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.responseDecodingError
        }
    }
}
