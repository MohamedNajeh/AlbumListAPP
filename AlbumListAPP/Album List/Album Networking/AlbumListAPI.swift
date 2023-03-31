//
//  AlbumListAPI.swift
//  AlbumListAPP
//
//  Created by MohamedNajeh on 31/03/2023.
//

import Foundation
protocol AlbumListAPIProtocol {
    func getThumbNails(completion: @escaping (Result<Image?, ErrorMessages>) -> Void)
}

class AlbumListAPI: BaseAPI<AlbumListNetworking>, AlbumListAPIProtocol {
    func getThumbNails(completion: @escaping (Result<Image?, ErrorMessages>) -> Void) {
        self.fetchData(target: .getThumbNails, responseClass: Image?.self) { result in
            completion(result)
        }
    }
}
