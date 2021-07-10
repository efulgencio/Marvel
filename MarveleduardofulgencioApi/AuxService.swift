//
//  InfoResponse.swift
//  MarveleduardofulgencioApi
//
//  Created by eduardo fulgencio on 8/7/21.
//  Copyright © 2021 Eduardo Fulgencio. All rights reserved.
//

import Foundation

enum ApiCharacter: String {
    case URL_BASE = "https://gateway.marvel.com:443/v1/public/"
    case urlList = "%@characters?ts=1&apikey=%@&hash=2e6171c282cbca87032d394cf4c64f90"
    case urlDetall = "%@characters/%@?ts=1&apikey=%@&hash=2e6171c282cbca87032d394cf4c64f90"
}

struct ApiServiceResults {
  let results: [ProtocolItem]?
}

struct InfoResponse: Codable {
    var copyright: String
    var code: Int
    var status: String
    
    enum CodingKeys: String, CodingKey {
      case copyright, code,  status
    }
}
