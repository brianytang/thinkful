//
//  BoxService.swift
//  BeatDropN
//
//  Created by Brian Tang on 7/16/16.
//  Copyright © 2016 bytLabs. All rights reserved.
//

import Alamofire
import BoxContentSDK
import Foundation
import RxSwift


protocol FolderStream {
    func folder() -> Observable<BOXFolder>
}

class FolderManager : FolderStream {
    
    let boxClient: BOXContentClient!
    let folderSubject = ReplaySubject<BOXFolder>.create(bufferSize: 1)
    
    init(boxClient: BOXContentClient!) {
        self.boxClient = boxClient
    }
    
    func folder() -> Observable<BOXFolder> {
        return folderSubject.asObservable()
    }
    
    func getFolders(folderId: String!) {
        boxClient.folderInfoRequestWithID(folderId).performRequestWithCompletion { (folder, error) in
            self.folderSubject.onNext(folder)
        }
    }
}