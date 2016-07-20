//
//  ControllerFactory.swift
//  BeatDropN
//
//  Created by Brian Tang on 7/17/16.
//  Copyright © 2016 bytLabs. All rights reserved.
//

import Foundation
import Swinject

class ControllerFactory {
    
    let resolverType: ResolverType!
    
    init(resolverType: ResolverType!) {
        self.resolverType = resolverType
    }
    
    func createMainViewController() -> MainViewController {
        let controller = MainViewController(
            controllerFactory: self,
            tracksStream: resolverType.resolve(HypeTracksStream.self),
            userManager: resolverType.resolve(UserManager.self))
        return controller
    }
    
    func createSettingsViewController() -> SettingsViewController {
        let controller = SettingsViewController()
        return controller
    }
}