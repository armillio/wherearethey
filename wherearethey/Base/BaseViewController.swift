//
//  BaseViewController.swift
//  wherearethey
//
//  Created by Armando on 9/17/18.
//  Copyright © 2018 Happy Computer. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
//    lazy var themeColors = ThemeColors()
//    lazy var themeImages = ThemeImages()
//    lazy var themeFonts = ThemeFonts()
    
    lazy var notificationCenter = NotificationCenter.default
    
    var firstTimeViewAppear = true
    var popCalled = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackground()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureBackground()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        firstTimeViewAppear = false
    }
    
    fileprivate func configureBackground() {
        //self.view.backgroundColor = themeColors.backgrounds()
    }
    
    func configureTapInView() {
    }
    
    @objc func endEdit(_ gesture: UIGestureRecognizer?) {
        view.endEditing(true)
    }
    
    // MARK: - Private
    
    // MARK: - Actions
    //    @objc func backButtonPressed(_ sender: UIBarButtonItem) {
    //        guard let _ = navigationController?.popViewController(animated: true) else { return }
    //    }
    
    // MARK: Loading Screen
    func showLockScreenAnimated() {
        // TODO: Implement load screen
    }
    
    func dismissLockScreenAnimated() {
        // TODO: Implement load screen
    }
    
    // MARK: Determine width of the cell
    
    func widthOfCell(withSafeArea safeArea: CGFloat, withList list: Int?) -> CGFloat{
        var numberColumns: Int
        let columnPadding = 0  as Int
        
        if (UI_USER_INTERFACE_IDIOM() == .pad){
            if(UIApplication.shared.statusBarOrientation == .portrait){
                numberColumns = 2
            }else{
                numberColumns = 3
            }
        }else{
            if(UIApplication.shared.statusBarOrientation == .portrait){
                numberColumns = 1;
            }else{
                if(list == 1){
                    numberColumns = 1;
                }else{
                    numberColumns = 2;
                }
            }
        }
        let width = Int(safeArea) / numberColumns
        let finalWidth = width - columnPadding
        return CGFloat(finalWidth)
    }
    
    func configureEmptyPlaceholder(withParent parent: UIView?, withEmpty empty: UIView?) {
        parent?.addSubview(empty ?? UIView())
        empty?.translatesAutoresizingMaskIntoConstraints = false
        parent?.addConstraints([
            NSLayoutConstraint(item: empty as Any, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: parent?.frame.size.width ?? 0),
            NSLayoutConstraint(item: empty as Any, attribute: .centerX, relatedBy: .equal, toItem: parent, attribute: .centerX, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: empty as Any, attribute: .centerY, relatedBy: .equal, toItem: parent, attribute: .centerY, multiplier: 1.0, constant: 0),
            ])
    }
}
