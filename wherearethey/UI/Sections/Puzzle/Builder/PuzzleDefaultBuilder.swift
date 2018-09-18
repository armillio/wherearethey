//
//  PuzzleDefaultBuilder.swift
//  wherearethey
//
//  Created by Armando Carmona on 17/09/2018.
//  Copyright (c) 2017, Happy Computer, LLC. All rights reserved.
//

import UIKit

class PuzzleDefaultBuilder: PuzzleBuilder {
    var router: PuzzleRouter?
    var interactorManager: PuzzleInteractorManager?
    var presenter: PuzzlePresenter?
    var view: PuzzleView?

    // MARK: - PuzzleBuilder protocol
    func buildPuzzleModule() -> BaseViewController? {
        buildView()
        buildRouter()
        buildInteractor()
        buildPresenter()
        buildCircularDependencies()
        return view as? BaseViewController
    }

    // MARK: - Private
    fileprivate func buildView() {
        self.view = PuzzleViewController()
    }

    fileprivate func buildRouter() {
        guard let view = self.view as? BaseViewController else {
            assert(false, "View has to be a BaseViewController")
            return
        }
        self.router = PuzzleDefaultRouter(viewController: view)
    }

    fileprivate func buildInteractor() {
        self.interactorManager = PuzzleDefaultInteractorManager() // TODO: set dependencies in init (use case/s, services...)
    }

    fileprivate func buildPresenter() {
        guard let interactorManager = self.interactorManager, let router = self.router, let view = self.view else {
            assert(false, "No dependencies available")
            return
        }
        self.presenter = PuzzleDefaultPresenter(interactorManager: interactorManager, router: router, view: view)
    }

    fileprivate func buildCircularDependencies() {
        guard let presenter = self.presenter, let view = self.view as? PuzzleViewController else {
            assert(false, "No dependencies available")
            return
        }
        view.presenter = presenter
    }
}
