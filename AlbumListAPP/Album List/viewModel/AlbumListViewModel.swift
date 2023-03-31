//
//  AlbumListViewModel.swift
//  AlbumListAPP
//
//  Created by MohamedNajeh on 31/03/2023.
//

import Foundation

protocol AlbumListViewModelProtocol {
    func getThumbNails()
    func setError(_ message: ErrorMessages)
    var thumbNails: Observable<Image?> { get  set }
    var errorMessage: Observable<String?> { get set }
    var errorType: Observable<ErrorMessages?> { get set }
    var isLoading: Observable<Bool> { get set }
}

class AlbumListViewModel : AlbumListViewModelProtocol {
 
    
    var thumbNails: Observable<Image?>            = Observable(nil)
    
    var errorMessage: Observable<String?>         = Observable(nil)
    
    var errorType: Observable<ErrorMessages?>     = Observable(nil)
    
    var isLoading: Observable<Bool>               = Observable(false)
    
    var api:AlbumListAPIProtocol?
    
    init(api:AlbumListAPI = AlbumListAPI()){
        self.api = api
    }
    
    func getThumbNails() {
        self.isLoading.value = true
        self.api?.getThumbNails(completion: { [weak self] result in
            self?.isLoading.value = false
            switch result {
            case .success(let thumbNaisl):
                self?.thumbNails.value = thumbNaisl
            case .failure(let error):
                self?.setError(error)
            }
        })
    }
    
    func setError(_ message: ErrorMessages) {
        self.errorMessage.value = message.rawValue
    }
}
