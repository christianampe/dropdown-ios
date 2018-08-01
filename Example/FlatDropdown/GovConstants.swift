//
//  GovConstants.swift
//  tutor
//
//  Created by Ampe on 3/27/18.
//  Copyright © 2018 tutor. All rights reserved.
//

import Foundation

struct Constants {
    
    enum CollegeScoreCard: String {
        case apiKey = "Maienbui9tNu1E3HQzPNY519alRjCtm4t8cvEh6w"
        case baseUrl = "https://api.data.gov/ed/collegescorecard/v1"
    }
    
    enum Endpoints: String {
        case school = "schools.json"
    }
    
    enum QueryParameters: String {
        case apiKey = "api_key"
    }
    
    enum FieldParameters: String {
        case autocomplete = "school.name"
    }
    
    enum OptionParameters: String {
        case fields = "_fields"
        case page = "_page"
        case perPage = "_per_page"
        case sort = "_sort"
        case zip = "_zip"
        case distance = "_distance"
    }
    
}
