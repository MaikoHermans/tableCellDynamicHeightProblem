//
//  MenuTableCell.swift
//  sideMenuExample
//
//  Created by Maiko Hermans on 06/04/2017.
//  Copyright © 2017 Maiko Hermans. All rights reserved.
//

import UIKit

struct MenuTableCellContents {
    var identifier: cellIdentifier
    var cellImage: UIImage
    var cellText: String
    //var cellFont: UIFont
    var cellTextColor: UIColor
    var subCells: [MenuTableCellContents]?
    
    /// Normal cells without subcells
    init(identifier: cellIdentifier, cellImage: UIImage, cellText: String, /*cellFont: UIFont,*/ cellTextColor: UIColor) {
        self.identifier = identifier
        self.cellImage = cellImage
        self.cellText = cellText
        self.cellTextColor = cellTextColor
        //self.cellFont = cellFont
    }
    
    /// Cells with subcells
    init(identifier: cellIdentifier, cellImage: UIImage, cellText: String, /*cellFont: UIFont,*/ cellTextColor: UIColor, subCells: [MenuTableCellContents]) {
        self.identifier = identifier
        self.cellImage = cellImage
        self.cellText = cellText
        self.cellTextColor = cellTextColor
        //self.cellFont = cellFont
        self.subCells = subCells
    }
    
    enum cellIdentifier {
        case standard
        case noIcon
        case subcell
        case standardAppointment
        case businessAppointment
        case groupAppointment
    }
}

class MenuTableCell: UITableViewCell {
    
    @IBOutlet var cell_icon: UIImageView!
    @IBOutlet var cell_label: UILabel!
    @IBOutlet var cell_contentView: MenuCellSubView!
    
    
    var cellImage: UIImage?
    var cellText: String?
    var cellTextColor: UIColor?
    //var cellFont: UIFont?

    var subCells: [MenuTableCellContents]?
    
    private var contentViewHeight: CGFloat?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        //drawSubCells()
        cell_label.text = cell_label.text?.uppercased()
        
        super.draw(rect)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cell_label.text = cell_label.text?.uppercased()
    }
}

/// Making the required calls
extension MenuTableCell {
    func appointmentTapped(sender: UIButton) {
        switch sender.tag {
            case MenuTableCellContents.cellIdentifier.standardAppointment.hashValue:
                print("standard")
            case MenuTableCellContents.cellIdentifier.businessAppointment.hashValue:
                print("business")
            case MenuTableCellContents.cellIdentifier.groupAppointment.hashValue:
                print("group")
            default:
                return
        }
    }
}
