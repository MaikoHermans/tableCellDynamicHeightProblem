//
//  MenuCellSubView.swift
//  sideMenuExample
//
//  Created by Maiko Hermans on 11/04/2017.
//  Copyright © 2017 Maiko Hermans. All rights reserved.
//

import UIKit

class MenuCellSubView: UIView {
    var subCells: [MenuTableCellContents] = [] {
        didSet {
            addSubCells()
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            let height = CGFloat(subCells.count * 40)
            return CGSize(width: self.frame.width, height: height)
        }
    }
    
    func addSubCells() {
        let count = CGFloat(subCells.count)
        
        // Set the height for the subcells
        let contentViewHeight = 40 * count
        let contentViewFrame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.width, height: contentViewHeight)
        self.frame = contentViewFrame
        
        var i = 0
        for cell in subCells {
            
            // create a view for each cell
            let cellView = UIView()
            let cellFrame = CGRect(x: 0, y: CGFloat(i * 40), width: contentViewFrame.width, height: 40)
            cellView.frame = cellFrame
            
            // add a image view to each cell
            let imageView = UIImageView(image: cell.cellImage)
            let imageViewFrame = CGRect(x: 0, y: (cellFrame.height - cellFrame.height / 2) / 2, width: cellFrame.width * 0.2, height: cellFrame.height / 2)
            imageView.frame = imageViewFrame
            imageView.contentMode = .scaleAspectFit
            
            // add a label to each cell
            let cellLabel = UILabel()
            let cellLabelFrame = CGRect(x: imageViewFrame.width, y: 0, width: cellFrame.width - imageViewFrame.width, height: 40)
            cellLabel.frame = cellLabelFrame
            //cellLabel.font = cell.cellFont
            
            cellLabel.text = cell.cellText.uppercased()
            cellLabel.textColor = cell.cellTextColor
            cellLabel.minimumScaleFactor = 15
            
            // add the imageview and button to the subcell view
            cellView.addSubview(imageView)
            cellView.addSubview(cellLabel)
            
            // add the subcell to the cell
            self.addSubview(cellView)
            i += 1
        }
    }
    
    func cleanSubViews() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
}
