//
//  File.swift
//  BeatDropN
//
//  Created by Brian Tang on 7/16/16.
//  Copyright © 2016 bytLabs. All rights reserved.
//

import BoxContentSDK
import Foundation
import Swinject
import UIKit

class AppStartupManager {
    
    let container = Container()
    
    var window: UIWindow?
    
    init() {
        container.register(ControllerFactory.self) { r in ControllerFactory(resolverType: r) }
        
        // Hype Machine related
        container.register(HypeMachineService.self) { _ in HypeMachineService() }.inObjectScope(.Container)
        container.register(HypeTracksStream.self) { r in r.resolve(HypeMachineService.self)! }.inObjectScope(.Container)
        
        // Box related
        container.register(BOXContentClient.self) { _ in
            BOXContentClient.setClientID(Constants.CLIENT_ID, clientSecret: Constants.CLIENT_SECRET)
            return BOXContentClient()
        }.inObjectScope(.Container)
        container.register(UserManager.self) { r in UserManager(boxClient: r.resolve(BOXContentClient.self)!) }
            .inObjectScope(.Container)
        container.register(FolderManager.self) { r in FolderManager(boxClient: r.resolve(BOXContentClient.self)) }
            .inObjectScope(.Container)
    }
    
    func start() {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let controllerFactory = container.resolve(ControllerFactory.self)
        window?.rootViewController = UINavigationController(rootViewController: controllerFactory!.createMainViewController())
        window?.makeKeyAndVisible()
        
        container.resolve(HypeMachineService.self)?.getTracks()
    }
}