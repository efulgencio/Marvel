//
//  Constants.swift
//  MarveleduardofulgencioApi
//
//  Created by eduardo fulgencio on 08/01/2021.
//  Copyright © 2021 Eduardo Fulgencio. All rights reserved.
//


// MARK: - Path json

enum PathJson: String {
   case dataResult = "data.result"
   case thumbnailPath = "thumbnail.path"
   case thumbnailExtension = "thumbnail.extension"
   case characterId = "id"
   case characterName = "name"
}

enum ErrorImageNotExist : String {
    case message = "image_not_available"
}

enum TypeConstants: String {
    case OkResponse = "OK"
    case NoError = ""
    case emptyData = "No content."
}
