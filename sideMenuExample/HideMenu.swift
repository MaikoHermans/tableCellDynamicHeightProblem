//
//  hideMenu.swift
//  sideMenuExample
//
//  Created by Maiko Hermans on 04/04/2017.
//  Copyright © 2017 Maiko Hermans. All rights reserved.
//

import UIKit
import SWRevealViewController
import UIKit.UIGestureRecognizerSubclass

extension UIViewController: SWRevealViewControllerDelegate {
    func hideMenuWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SWRevealViewController.dismissMenu))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissMenu() {
        if revealViewController().frontViewPosition == FrontViewPosition.right {
            self.revealViewController().revealToggle(animated: true)
        }
    }
    
    public func revealControllerPanGestureShouldBegin(_ revealController: SWRevealViewController!) -> Bool {
        let point = revealController.panGestureRecognizer().location(in: self.view)
        
        if revealController.frontViewPosition == FrontViewPosition.left && point.x < 50.0 {
            return true
        }
        else if revealController.frontViewPosition == FrontViewPosition.right {
            return true
        }
        
        return false
    }
    
    public func revealController(_ revealController: SWRevealViewController!, panGestureMovedToLocation location: CGFloat, progress: CGFloat) {
        if location >= revealController.rearViewRevealWidth {
            revealController.panGestureRecognizer().state = UIGestureRecognizerState.ended
        }
    }
}
