//
//  MenuViewController.swift
//  sideMenuExample
//
//  Created by Maiko Hermans on 05/04/2017.
//  Copyright © 2017 Maiko Hermans. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate {
    @IBOutlet var menu_table: MenuTableView!
    
    var cellContent: [MenuTableCellContents] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCells()
        
        
        let menuCell = UINib(nibName: "MenuTableCell", bundle: nil)
        menu_table.register(menuCell, forCellReuseIdentifier: "menuCell")
        
        menu_table.delegate = self
        menu_table.dataSource = self
        menu_table.rowHeight = UITableViewAutomaticDimension
        menu_table.estimatedRowHeight = 50
    }
    
    /// setup the required cells for the menu
    func setupCells() {
        let normal1 = MenuTableCellContents(identifier: .standard, cellImage: UIImage(named: "icn_pin")!, cellText: "normal1", cellTextColor: UIColor.black)
        let normal2 = MenuTableCellContents(identifier: .standard, cellImage: UIImage(named: "icn_pin")!, cellText: "normal2", cellTextColor: UIColor.black)
        let normal3 = MenuTableCellContents(identifier: .standard, cellImage: UIImage(named: "icn_pin")!, cellText: "normal3", cellTextColor: UIColor.black)
        
        let sub1 = MenuTableCellContents(identifier: .standardAppointment, cellImage: UIImage(named: "icn_pin")!, cellText: "sub1", cellTextColor: UIColor.black)
        let sub2 = MenuTableCellContents(identifier: .businessAppointment, cellImage: UIImage(named: "icn_pin")!, cellText: "sub2", cellTextColor: UIColor.black)
        let sub3 = MenuTableCellContents(identifier: .groupAppointment, cellImage: UIImage(named: "icn_pin")!, cellText: "sub3", cellTextColor: UIColor.black)
        let subcells1 = MenuTableCellContents(identifier: .standard, cellImage: UIImage(named: "icn_pin")!, cellText: "subcells1", cellTextColor: UIColor.black, subCells: [sub1, sub2, sub3])
        
        let sub4 = MenuTableCellContents(identifier: .subcell, cellImage: UIImage(named: "icn_pin")!, cellText: "sub4", cellTextColor: UIColor.black)
        let sub5 = MenuTableCellContents(identifier: .subcell, cellImage: UIImage(named: "icn_pin")!, cellText: "sub5", cellTextColor: UIColor.black)
        let sub6 = MenuTableCellContents(identifier: .subcell, cellImage: UIImage(named: "icn_pin")!, cellText: "sub6", cellTextColor: UIColor.black)
        let subcells2 = MenuTableCellContents(identifier: .standard, cellImage: UIImage(named: "icn_pin")!, cellText: "subcells2", cellTextColor: UIColor.black, subCells: [sub4, sub5, sub6])
        
        let normal4 = MenuTableCellContents(identifier: .standard, cellImage: UIImage(named: "icn_pin")!, cellText: "normal4", cellTextColor: UIColor.black)
        
        let sub7 = MenuTableCellContents(identifier: .subcell, cellImage: UIImage(named: "icn_pin")!, cellText: "sub7", cellTextColor: UIColor.black)
        let sub8 = MenuTableCellContents(identifier: .subcell, cellImage: UIImage(named: "icn_pin")!, cellText: "sub8", cellTextColor: UIColor.black)
        let sub9 = MenuTableCellContents(identifier: .subcell, cellImage: UIImage(named: "icn_pin")!, cellText: "sub9", cellTextColor: UIColor.black)
        let subcells3 = MenuTableCellContents(identifier: .standard, cellImage: UIImage(named: "icn_pin")!, cellText: "subcells3", cellTextColor: UIColor.black, subCells: [sub7, sub8, sub9])
        
        let noIcon1 = MenuTableCellContents(identifier: .noIcon, cellImage: UIImage(), cellText: "noIcon1", cellTextColor: UIColor.black)
        let noIcon2 = MenuTableCellContents(identifier: .noIcon, cellImage: UIImage(), cellText: "noIcon2", cellTextColor: UIColor.black)
        let noIcon3 = MenuTableCellContents(identifier: .noIcon, cellImage: UIImage(), cellText: "noIcon3", cellTextColor: UIColor.black)
        
        cellContent = [normal1, normal2, normal3, subcells1, subcells2, normal4, subcells3, noIcon1, noIcon2, noIcon3]
    }
}

/// required methods for the uitableview
extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let content = cellContent[indexPath.item]
        
        let cell = menu_table.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuTableCell
        
        cell.cell_icon.image = content.cellImage
        cell.cell_label.text = content.cellText
        cell.cell_label.textColor = content.cellTextColor
        //cell.cell_label.font = content.cellFont
        
        cell.cell_contentView.subCells = content.subCells ?? []
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
