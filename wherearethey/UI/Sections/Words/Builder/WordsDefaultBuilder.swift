//
//  WordsDefaultBuilder.swift
//  wherearethey
//
//  Created by Armando Carmona on 17/09/2018.
//  Copyright (c) 2017, Happy Computer, LLC. All rights reserved.
//

import UIKit

class WordsDefaultBuilder: WordsBuilder {
    var router: WordsRouter?
    var interactorManager: WordsInteractorManager?
    var presenter: WordsPresenter?
    var view: WordsView?

    // MARK: - WordsBuilder protocol
    func buildWordsModule() -> BaseViewController? {
        buildView()
        buildRouter()
        buildInteractor()
        buildPresenter()
        buildCircularDependencies()
        return view as? BaseViewController
    }

    // MARK: - Private
    fileprivate func buildView() {
        self.view = WordsViewController()
    }

    fileprivate func buildRouter() {
        guard let view = self.view as? BaseViewController else {
            assert(false, "View has to be a BaseViewController")
            return
        }
        self.router = WordsDefaultRouter(viewController: view)
    }

    fileprivate func buildInteractor() {
        self.interactorManager = WordsDefaultInteractorManager() // TODO: set dependencies in init (use case/s, services...)
    }

    fileprivate func buildPresenter() {
        guard let interactorManager = self.interactorManager, let router = self.router, let view = self.view else {
            assert(false, "No dependencies available")
            return
        }
        self.presenter = WordsDefaultPresenter(interactorManager: interactorManager, router: router, view: view)
    }

    fileprivate func buildCircularDependencies() {
        guard let presenter = self.presenter, let view = self.view as? WordsViewController else {
            assert(false, "No dependencies available")
            return
        }
        view.presenter = presenter
    }
}
