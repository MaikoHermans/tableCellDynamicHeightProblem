//
//  ViewController.swift
//  sideMenuExample
//
//  Created by Maiko Hermans on 21/03/2017.
//  Copyright © 2017 Maiko Hermans. All rights reserved.
//

import UIKit
import SWRevealViewController

class ViewController: UIViewController {

    @IBOutlet var openMenu: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        revealViewController().rearViewRevealWidth = self.view.frame.width * 0.85
        openMenu.target = self.revealViewController()
        openMenu.action = #selector(SWRevealViewController.revealToggle(_:))
        
        revealViewController().delegate = self
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        self.hideMenuWhenTappedAround()
    }
}

