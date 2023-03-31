//
//  MVVMObservable.swift
//  AlbumListAPP
//
//  Created by MohamedNajeh on 31/03/2023.
//

import Foundation

import Foundation

class Observable<T> {

    var value: T {
        didSet {
            listener?(value)
        }
    }

    private var listener: ((T) -> Void)?

    init(_ value: T) {
        self.value = value
    }

    func bind(_ closure: @escaping (T) -> Void) {
        closure(value)
        listener = closure
    }
}
