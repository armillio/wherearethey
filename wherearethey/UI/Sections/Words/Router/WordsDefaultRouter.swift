//
//  WordsDefaultRouter.swift
//  wherearethey
//
//  Created by Armando Carmona on 17/09/2018.
//  Copyright (c) 2017, Happy Computer, LLC. All rights reserved.
//

import Foundation

class WordsDefaultRouter: WordsRouter {
    weak var viewController: BaseViewController?

    init(viewController: BaseViewController) {
        self.viewController = viewController
    }

    // MARK - Navigation funcions

}