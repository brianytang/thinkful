//
//  HypeMachineService.swift
//  BeatDropN
//
//  Created by Brian Tang on 7/17/16.
//  Copyright © 2016 bytLabs. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import RxSwift
import UIKit

protocol HypeTracksStream {
    func tracks() -> Observable<[HypeTrack]>
}

class HypeMachineService : HypeTracksStream {
    
    let hypemUrl = "https://api.hypem.com/v2/popular?mode=now&page=1&count=10"
    let tracksStream = ReplaySubject<[HypeTrack]>.create(bufferSize: 1)
    
    init() {        
    }
    
    func getTracks() {
        Alamofire.request(.GET, hypemUrl).responseArray(completionHandler: { (response: Response<[HypeTrack], NSError>) in
            if let tracksArray = response.result.value {
                self.tracksStream.onNext(tracksArray)
            } else if let error = response.result.error {
                print("ERROR! (\(error.code)) \(error.description)")
            }
        })
    }
    
    func tracks() -> Observable<[HypeTrack]> {
        return tracksStream.asObservable()
    }
}