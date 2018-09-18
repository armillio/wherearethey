//
//  ConfigurationDefaultPresenter.swift
//  wherearethey
//
//  Created by Armando Carmona on 17/09/2018.
//  Copyright (c) 2017, Happy Computer, LLC. All rights reserved.
//

import Foundation

struct ConfigurationViewModel {

}

// MARK: - Main Class
class ConfigurationDefaultPresenter: ConfigurationPresenter {
    fileprivate let interactorManager: ConfigurationInteractorManager
    fileprivate let router: ConfigurationRouter
    fileprivate weak var view: ConfigurationView?

    fileprivate let viewModelBuilder = ConfigurationViewModelBuilder()

    required init(interactorManager: ConfigurationInteractorManager, router: ConfigurationRouter, view: ConfigurationView) {
        self.interactorManager = interactorManager
        self.router = router
        self.view = view
    }

    // MARK: - ConfigurationPresenter

}

// MARK: - Model Builder
class ConfigurationViewModelBuilder {
    func buildViewModel() -> ConfigurationViewModel {
        return ConfigurationViewModel()
    }
}