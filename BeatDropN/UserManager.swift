//
//  UserManager.swift
//  BeatDropN
//
//  Created by Brian Tang on 7/17/16.
//  Copyright © 2016 bytLabs. All rights reserved.
//

import BoxContentSDK
import Foundation
import RxSwift

protocol UserStream {
    func user() -> Observable<BOXUser>
}

class UserManager : UserStream {
    
    let boxClient: BOXContentClient!
    let userSubject = ReplaySubject<BOXUser>.create(bufferSize: 1)
    
    init(boxClient: BOXContentClient!) {
        self.boxClient = boxClient
    }
    
    func authenticate() {
        boxClient.authenticateWithCompletionBlock { (user, error) in
            self.userSubject.onNext(user)
        }
    }
 
    func user() -> Observable<BOXUser> {
        return userSubject.asObservable()
    }
}