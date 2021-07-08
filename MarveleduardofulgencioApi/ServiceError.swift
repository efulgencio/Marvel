//
//  ErrorService.swift
//  MarveleduardofulgencioApi
//
//  Created by eduardo fulgencio on 8/7/21.
//  Copyright © 2021 Eduardo Fulgencio. All rights reserved.
//

import Foundation

enum ServiceError: Error {
    case dataEmpty
    case jsonFailure(motive: String)
    case noError
    case error(description: String)
    case errorNoInfo
}

extension ServiceError: LocalizedError {
  var errorDescription: String? {
    switch self {
        case .dataEmpty:
            return TypeConstants.emptyData.rawValue
        case .jsonFailure(motive: let info):
          return info
    case .noError:
            return TypeConstants.NoError.rawValue
        case .error(description: let info):
          return info
        case .errorNoInfo:
          return "No info about error."
    }
  }
}
