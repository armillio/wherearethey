//
//  Container.swift
//  wherearethey
//
//  Created by Armando Carmona on 17/09/2018.
//  Copyright (c) 2017, Happy Computer, LLC. All rights reserved.
//

import UIKit

class Container {
    static let sharedContainer = Container()
    var mainRootViewController: UIViewController?
}

// MARK: - AppDelegate Injection
extension Container {
    func inject() -> UIWindow? {
        guard let window = self.window() else { return nil }
        return window
    }
    
    func window() -> UIWindow? {
        let window = UIWindow(frame: self.screen().bounds)
        guard let rootVC = self.createMainRootViewController() else { return nil }
        window.rootViewController = rootVC
        return window
    }
    
    func resetWindow(withWindow window: UIWindow) {
        guard let rootVC = self.createMainRootViewController() else { return }
        window.rootViewController = rootVC
    }
    
    func screen() -> UIScreen {
        return UIScreen.main
    }
    
    func createMainRootViewController() -> UIViewController? {
        guard
            let configurationViewController = self.configurationBuilder().buildConfigurationModule(),
            let wordsViewController = self.wordsBuilder().buildWordsModule(),
            let puzzleViewController = self.puzzleBuilder().buildPuzzleModule()else {
                assert(false, "Root Module failed to build. Check your DI setup.")
                return nil
        }
        
        let configurationController = BaseNavigationController(rootViewController: configurationViewController)
        let wordsController = BaseNavigationController(rootViewController: wordsViewController)
        let puzzleController = BaseNavigationController(rootViewController: puzzleViewController)
        
        let rootViewController = UITabBarController()
        rootViewController.viewControllers = [configurationController, puzzleController, wordsController]
        rootViewController.selectedIndex = 1
        mainRootViewController = rootViewController
        return mainRootViewController
    }
}

// MARK: - Builders Injection
extension Container {
    
    func configurationBuilder() -> ConfigurationBuilder {
        return ConfigurationDefaultBuilder()
    }
    
    func wordsBuilder() -> WordsBuilder {
        return WordsDefaultBuilder()
    }
    
    func puzzleBuilder() -> PuzzleBuilder {
        return PuzzleDefaultBuilder()
    }
    
}

extension Container {
    func sharedApplication() -> UIApplication {
        return UIApplication.shared
    }
}
