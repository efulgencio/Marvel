//
//  ApiService.swift
//  TestCompletionFunction
//
//  Created by Eduardo Fulgencio on 27/4/17.
//  Copyright © 2017 Eduardo Fulgencio. All rights reserved.
//

import Foundation

typealias DataTaskCompletionHandler = (Result<ApiServiceResults, ServiceError>)

enum ApiService {
  static let publicKey = "46996a2c4fafc17be9ee1914774decd5"
  static let urlSession = URLSession(configuration: .default)
  static var dataTask: URLSessionDataTask?
}

extension ApiService {
    
    static func getListCharacter(completion: @escaping ((Result<ApiServiceResults, ServiceError>) -> Void)) {
    
        guard let url = generateUrl(ApiCharacter.urlList.rawValue) else {
          return
        }
        
       let urlRequest = URLRequest(url: url)
    
       let task = urlSession.dataTask(with: urlRequest) { (data, response, error) in
        
        let result = processRequest(data: data, error: error as? ServiceError)

            OperationQueue.main.addOperation {
              completion(result)
            }
       }
        
       task.resume()
  
   }
    
    // MARK: - Private methods
    
    /// Generate url for request
    /// - Parameter urlApi : end point request
    /// - Returns: url
    private static func generateUrl(_ urlApi: String) -> URL? {
        let URLString = String(format: urlApi, URL_BASE, publicKey)
        return URL(string: URLString)
    }
    
}

extension ApiService {
    
    private static func processRequest(data: Data?, error: ServiceError?) -> DataTaskCompletionHandler {
       
        var protocolItems = [ProtocolItem]()
        
        if let error = error {
            return .failure(error)
          }
    
        guard let data = data else {
            return .failure(ServiceError.dataEmpty)
        }
        
        guard
          let json = try? JSONSerialization.jsonObject(with: data, options: []),
          let results = json as? [String: AnyObject]
        else {
            return .failure(ServiceError.jsonFailure(motive: "Error convert data to JSON"))
        }
        
        for contentElements in results where contentElements.key == "data" {
            if let characters  = contentElements.value["results"] as! NSArray? {
                for characterDict in characters {
                    protocolItems.append(StructItem(character: characterDict as! NSDictionary))
                }
            }
        }
        
        return .success(ApiServiceResults(results: protocolItems))
        
    }
}


/*
 
 //  puede que estas dos líneas no hagan falta ????????
 //  urlRequest.httpMethod = "GET"
 //  urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
 
 
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
 
 */
