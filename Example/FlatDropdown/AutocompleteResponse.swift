//
//  AutocompleteResponse.swift
//  tutor
//
//  Created by Ampe on 3/28/18.
//  Copyright © 2018 tutor. All rights reserved.
//

import Foundation

class AutocompleteResponse {
    let schools: [GovSchool]
    let metadata: GovMetadata
    
    init(schools: [GovSchool], metadata: GovMetadata) {
        self.schools = schools
        self.metadata = metadata
    }
    
    convenience init?(dict: [String: Any]) {
        guard
            let schoolsDict = dict[JSONKeys.results.rawValue] as? [[String: Any]],
            let metadataDict = dict[JSONKeys.metadata.rawValue] as? [String: Any],
            let metadata = GovMetadata(dict: metadataDict)
        else {
            return nil
        }
        
        let schools = schoolsDict.compactMap { GovSchool(dict: $0) }
        
        self.init(schools: schools, metadata: metadata)
    }
    
    enum JSONKeys: String {
        case results = "results"
        case metadata = "metadata"
    }
}
