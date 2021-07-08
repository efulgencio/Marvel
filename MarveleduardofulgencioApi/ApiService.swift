//
//  ApiService.swift
//  TestCompletionFunction
//
//  Created by Eduardo Fulgencio on 27/4/17.
//  Copyright © 2017 Eduardo Fulgencio. All rights reserved.
//

import Foundation

typealias DataTaskCompletionHandler = ([ProtocolItem]?, ErrorService?) -> Void

struct InfoResponse: Codable {
    var copyright: String
    var code: Int
    var status: String
    
    enum CodingKeys: String, CodingKey {
      case copyright, code,  status
    }
}

enum ErrorService: Error {
    case NoError(description: String)
    case Error(description: String)
    case ErrorNoInfo
}

struct ApiService {
    
    static func getListCharacter(completion: @escaping DataTaskCompletionHandler) {
       
        var protocolItems = [ProtocolItem]()

        guard let url = URL(string: String(format: ApiCharacter.urlList.rawValue, URL_BASE, Constants.publicKey.rawValue)) else {
           return
       }
        
       var urlRequest = URLRequest(url: url)
       urlRequest.httpMethod = "GET"
       urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
       let session = URLSession(configuration: URLSessionConfiguration.default)
       
       let task = session.dataTask(with: urlRequest) { (data, response, error) in
           
           guard let responseData = data, error == nil else {
                completion(protocolItems, ErrorService.Error(description: error!.localizedDescription))
                return
           }
        
           do {
                if let jsonArray = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: AnyObject] {
                    if let infoResponse = try JSONDecoder().decode(InfoResponse.self, from: responseData) as InfoResponse? {
                        if infoResponse.status.uppercased() == TypeConstants.OkResponse.rawValue {
                            
                             for contentElements in jsonArray where contentElements.key == "data" {
                                 if let characters  = contentElements.value["results"] as! NSArray? {
                                     for characterDict in characters {
                                         protocolItems.append(StructItem(character: characterDict as! NSDictionary))
                                     }
                                 }
                             }
                            
                             completion(protocolItems, ErrorService.NoError(description: TypeConstants.NoError.rawValue ))
                        } else {
                            completion(protocolItems, ErrorService.NoError(description: TypeConstants.NoError.rawValue ))
                        }
                    }
                } else {
                    completion(protocolItems, ErrorService.NoError(description: TypeConstants.NoError.rawValue ))
                }
           } catch  {
               return
           }
       }
        
       task.resume()
  
   }
}
