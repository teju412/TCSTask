//  Observer.swift
//  ReactivePrograming
//  Created by TejaDanasvi on 6/10/21.
//

import Foundation

class Observer<T> {
    var value:T?{
        didSet {
            observerBlock?(value)
        }
    }
    init(value:T?) {
        self.value = value
    }
    private var observerBlock: ((T?) -> Void)?

    func addObserver(observer:@escaping(T?) -> Void) {
        self.observerBlock = observer
    }
}
