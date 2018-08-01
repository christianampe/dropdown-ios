//
//  GovMethodsWrapper.swift
//  tutor
//
//  Created by Ampe on 3/27/18.
//  Copyright © 2018 tutor. All rights reserved.
//

import Moya

extension Networking.Gov.Methods {
    
    enum Wrapper {
        case autocomplete(text: String)
    }
    
}

// MARK: - TargetType Protocol Implementation
extension Networking.Gov.Methods.Wrapper: TargetType {
    
    var baseURL: URL {
        return URL(string: Networking.Gov.Constants.CollegeScoreCard.baseUrl.rawValue)!
    }
    
    var path: String {
        switch self {
        case .autocomplete:
            return Networking.Gov.Constants.Endpoints.school.rawValue
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .autocomplete:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case let .autocomplete(text):
            return .requestParameters(parameters: [Networking.Gov.Constants.FieldParameters.autocomplete.rawValue: text,
                Networking.Gov.Constants.OptionParameters.fields.rawValue: "id,school.name",
                Networking.Gov.Constants.QueryParameters.apiKey.rawValue:
                    Networking.Gov.Constants.CollegeScoreCard.apiKey.rawValue],
                                      encoding: URLEncoding.queryString)
        }
    }
    
    var sampleData: Data {
        switch self {
        case .autocomplete(let text):
            return "Half measures are as bad as nothing at all. \(text)".utf8Encoded
        }
    }
    
    var headers: [String: String]? {
        return nil // ["Content-type": "application/json"]
    }
    
}

// MARK: - Helpers
private extension String {
    
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
    
}
