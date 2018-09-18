//
//  BaseNavigationController.swift
//  wherearethey
//
//  Created by Armando on 9/17/18.
//  Copyright © 2018 Happy Computer. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController, UIGestureRecognizerDelegate {
    // blazy var themeColors = ThemeColors()
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        congigureInteractivePopGestureRecognizer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    // MARK: - Configure
    func congigureInteractivePopGestureRecognizer() {
        interactivePopGestureRecognizer?.delegate = self
    }
}
