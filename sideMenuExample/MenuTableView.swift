//
//  menuTableView.swift
//  sideMenuExample
//
//  Created by Maiko Hermans on 05/04/2017.
//  Copyright © 2017 Maiko Hermans. All rights reserved.
//

import UIKit

class MenuTableView: UITableView {
    var userImage: UIImage? = UIImage(named: "Image")
    var userName: FullName? = FullName(firstName: "First", lastName: "Lastname")
    var userEmail: String? = "email@email.com"
    
    fileprivate var headerView: UIView?
    fileprivate var userImageView: UIImageView?
    fileprivate var labelName: UILabel?
    fileprivate var labelEmail: UILabel?

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        addHeader()
        addFooter()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addTopBounceBackground()
    }
    
    func addHeader() {
        let width = self.frame.width
        let height = self.frame.height
        
        let headerHeight = height * 0.3
        let headerFrame = CGRect(x: 0, y: 0, width: self.frame.width, height: headerHeight)
        
        let imageSize = width * 0.3
        let userImageFrame = CGRect(x: 0, y: 0, width: imageSize, height: imageSize)
        
        headerView = UIView(frame: headerFrame)
        headerView?.backgroundColor = UIColor.gray
        
        userImageView = UIImageView(image: userImage)
        userImageView?.frame = userImageFrame
        userImageView?.contentMode = .scaleAspectFit
        
        userImageView?.layer.cornerRadius = userImageFrame.width / 2
        userImageView?.clipsToBounds = true
        userImageView?.layer.borderWidth = imageSize * 0.05
        userImageView?.layer.borderColor = UIColor.red.cgColor
        
        let labelFrame = CGRect(x: 0, y: 0, width: width * 0.8, height: height * 0.04)
        labelName = UILabel(frame: labelFrame)
        labelName?.text = userName!.firstName + " " + userName!.lastName
        labelName?.textColor = UIColor.white
        labelName?.textAlignment = .center
        // labelName?.font = Your font here
        
        labelEmail = UILabel(frame: labelFrame)
        labelEmail?.text = userEmail
        labelEmail?.textColor = UIColor.white
        labelEmail?.textAlignment = .center
        // labelEmail.font = Your font here
        
        headerView?.addSubview(userImageView!)
        headerView?.addSubview(labelName!)
        headerView?.addSubview(labelEmail!)
        self.tableHeaderView = headerView!
        
        addPositions()
    }
    
    func addPositions() {
        let xPosImage = (headerView!.frame.width - userImageView!.frame.width) / 2
        let yPosImage = (headerView!.frame.height * 0.15)
        let widthImage = userImageView!.frame.width
        let heightImage = userImageView!.frame.height
        userImageView?.frame = CGRect(x: xPosImage, y: yPosImage, width: widthImage, height: heightImage)
        
        let xPosName = (headerView!.frame.width - labelName!.frame.width) / 2
        let yPosName = userImageView!.frame.maxY + (headerView!.frame.height * 0.05)
        let widthName = labelName!.frame.width
        let heightName = labelName!.frame.height
        labelName?.frame = CGRect(x: xPosName, y: yPosName, width: widthName, height: heightName)
        
        let xPosEmail = (headerView!.frame.width - labelEmail!.frame.width) / 2
        let yPosEmail = labelName!.frame.maxY
        let widthEmail = labelEmail!.frame.width
        let heightEmail = labelEmail!.frame.height
        labelEmail?.frame = CGRect(x: xPosEmail, y: yPosEmail, width: widthEmail, height: heightEmail)
    }
    
    func addFooter() {
        self.tableFooterView = UIView()
    }
    
    func addTopBounceBackground() {
        var bounceFrame = self.bounds
        bounceFrame.origin.y = -bounceFrame.size.height
        let bounceView = UIView(frame: bounceFrame)
        bounceView.backgroundColor = UIColor.gray
        self.addSubview(bounceView)
    }
}
