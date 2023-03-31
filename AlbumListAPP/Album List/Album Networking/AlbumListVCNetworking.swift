//
//  AlbumListVCNetworking.swift
//  AlbumListAPP
//
//  Created by MohamedNajeh on 31/03/2023.
//

import Foundation

enum AlbumListNetworking {
    case getThumbNails
}

extension AlbumListNetworking: TargetType {
    var baseURL: String {
        switch self {
        case .getThumbNails:
            return URLs.baseURL.rawValue
        }
    }
    
    var path: String {
        switch self {
        case .getThumbNails:
            return "?client_id=Ahj-66mbyiRNL-GhTltHoIgGfkznNgv7SALhCOTLMaM"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getThumbNails:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getThumbNails:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
}
