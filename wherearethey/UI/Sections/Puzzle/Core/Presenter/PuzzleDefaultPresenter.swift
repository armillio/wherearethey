//
//  PuzzleDefaultPresenter.swift
//  wherearethey
//
//  Created by Armando Carmona on 17/09/2018.
//  Copyright (c) 2017, Happy Computer, LLC. All rights reserved.
//

import Foundation

struct PuzzleViewModel {

}

// MARK: - Main Class
class PuzzleDefaultPresenter: PuzzlePresenter {
    fileprivate let interactorManager: PuzzleInteractorManager
    fileprivate let router: PuzzleRouter
    fileprivate weak var view: PuzzleView?

    fileprivate let viewModelBuilder = PuzzleViewModelBuilder()

    required init(interactorManager: PuzzleInteractorManager, router: PuzzleRouter, view: PuzzleView) {
        self.interactorManager = interactorManager
        self.router = router
        self.view = view
    }

    // MARK: - PuzzlePresenter

}

// MARK: - Model Builder
class PuzzleViewModelBuilder {
    func buildViewModel() -> PuzzleViewModel {
        return PuzzleViewModel()
    }
}