//
//  WordsDefaultPresenter.swift
//  wherearethey
//
//  Created by Armando Carmona on 17/09/2018.
//  Copyright (c) 2017, Happy Computer, LLC. All rights reserved.
//

import Foundation

struct WordsViewModel {

}

// MARK: - Main Class
class WordsDefaultPresenter: WordsPresenter {
    fileprivate let interactorManager: WordsInteractorManager
    fileprivate let router: WordsRouter
    fileprivate weak var view: WordsView?

    fileprivate let viewModelBuilder = WordsViewModelBuilder()

    required init(interactorManager: WordsInteractorManager, router: WordsRouter, view: WordsView) {
        self.interactorManager = interactorManager
        self.router = router
        self.view = view
    }

    // MARK: - WordsPresenter

}

// MARK: - Model Builder
class WordsViewModelBuilder {
    func buildViewModel() -> WordsViewModel {
        return WordsViewModel()
    }
}