//
//  GovMethods.swift
//  tutor
//
//  Created by Ampe on 3/28/18.
//  Copyright © 2018 tutor. All rights reserved.
//

import Moya

// MARK: - Autocomplete Methods
extension Networking.Gov.Methods.Autocomplete {
    
    //
    // Make Request To API To Get List Of Colleges Back
    //
    static func schoolName(with input: String, handler: @escaping (AutocompleteResponse?) -> ()) {
        provider.request(.autocomplete(text: input)) { (result) in
            switch result {
            case let .success(response):
                handler(autocompleteModel(from: response))
                
            case .failure(_):
                return
            }
        }
    }
    
}

// MARK: - Helper Methods
private extension Networking.Gov.Methods.Autocomplete {
    
    //
    // Success Methods
    //
    static func autocompleteModel(from response: Response) -> AutocompleteResponse? {
        guard let json = extractJson(from: response.data) else {
            return nil // json extraction failed
        }
        
        return buildModelResponse(from: json)
    }
    
    static func extractJson(from data: Data) -> [String: Any]? {
        guard let jsonData = try? JSONSerialization.jsonObject(with: data, options: []) else {
            return nil // serialization failed
        }
        
        guard let json = jsonData as? [String: Any] else {
            return nil // json improperly formatted
        }
        
        return json
    }
    
    static func buildModelResponse(from json: [String: Any]) -> AutocompleteResponse? {
        guard let response = AutocompleteResponse(dict: json) else {
            return nil // model initalization failed
        }
        
        return response
    }
    
    //
    // Failure Methods
    //
    
}
