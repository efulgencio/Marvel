//
//  Notificacion.swift
//  MarveleduardofulgencioApi
//
//  Created by eduardo fulgencio on 12/01/2021.
//  Copyright © 2021 Eduardo Fulgencio. All rights reserved.
//

import Foundation

//
//class Notificacion{
//    
//    var id: String? = ""
//    var idclinica: String? = ""
//    var title: String? = ""
//    var message: String? = ""
//    var photo: String? = ""
//    var type: String? = ""
//    var timestamp: String? = ""
//    var readnotif: Bool = false
//    var removenotif: Bool = false
//    
//    init() {
//    }
//    
//    init?(dictionary: [String: Any],id:String) {
//        self.id = id
//        if(dictionary.keys.contains("idclinica")){
//            self.idclinica = dictionary["idclinica"] as? String
//        }
//        if(dictionary.keys.contains("title")){
//            self.title = dictionary["title"] as? String
//        }
//        if(dictionary.keys.contains("message")){
//            self.message = dictionary["message"] as? String
//        }
//        if(dictionary.keys.contains("photo")){
//            self.photo = dictionary["photo"] as? String
//        }
//        if(dictionary.keys.contains("type")){
//            self.type = dictionary["type"] as? String
//        }
//        if(dictionary.keys.contains("timestamp")){
//            if let aux = dictionary["timestamp"] as? Date {
//                self.timestamp = stringFromDate(aux)
//            }
//        }
//        if(dictionary.keys.contains("readnotif")){
//            self.readnotif = dictionary["readnotif"] as! Bool
//        }
//        if(dictionary.keys.contains("removenotif")){
//            self.removenotif = dictionary["removenotif"] as! Bool
//        }
//    }
//    
//}
