//
//  AutoLayoutDishListViewController.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/18/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

class AutoLayoutDishListViewController: UIViewController {

    @IBOutlet weak var autoLayoutLabel: UILabel!
    
    
    @IBOutlet weak var leftButton: UIButton!
    
    
    @IBOutlet weak var rightButton: UIButton!
    
    
    @IBOutlet weak var yellowView: UIView!
    
    @IBOutlet weak var greenView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initSubView()
                
    }
        
        func initSubView(){
        //back button
        let backButton = UIBarButtonItem()
        backButton.title = ""
            self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        //title
            self.navigationItem.title = AutoLayoutDishListConfig.navigationTitle
        
            //auto layout for left button
            //
            //view.addConstraint([rightButton.rightAnchor ])
//            leftButton.frame.height = 30
            
            
            //autolayout lb
            
            
            //left button
            let leftButtonHeightConstraint = NSLayoutConstraint(item: leftButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
            let leftButtonWidthConstraint = NSLayoutConstraint(item: leftButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
             let leftButtonTopConstraint = NSLayoutConstraint(item: leftButton, attribute: .top, relatedBy: .equal, toItem: autoLayoutLabel, attribute: .bottom, multiplier: 1, constant: 20)
            let leftButtonLeadingConstraint = NSLayoutConstraint(item: leftButton, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 10)
            
            //right button
            let rightButtonHeightConstraint = NSLayoutConstraint(item: rightButton, attribute: .height
                , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
            let rightButtonWidthConstraint = NSLayoutConstraint(item: rightButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100)
            let rightButtonTopConstraint = NSLayoutConstraint(item: rightButton, attribute: .top, relatedBy: .equal, toItem: autoLayoutLabel, attribute: .bottom, multiplier: 1, constant: 20)
            
            let rightButtonTrailingConstraint = NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: rightButton, attribute: .trailing, multiplier: 1, constant: 10)
            
            
            //yellowView
            let yellowViewLeftConstraint = NSLayoutConstraint(item: yellowView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 10)
            let yellowViewTopConstraint = NSLayoutConstraint(item: yellowView, attribute: .top, relatedBy: .equal, toItem: leftButton, attribute: .bottom, multiplier: 1, constant: 10)
            
            //greenview
            let greenViewRightConstraint = NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: greenView, attribute: .trailing, multiplier: 1, constant: 10)
            let greenViewTopConstraint = NSLayoutConstraint(item: greenView, attribute: .top, relatedBy: .equal, toItem: leftButton, attribute: .bottom, multiplier: 1, constant: 10)
            let greenViewLeftConstraint = NSLayoutConstraint(item: greenView, attribute: .leading, relatedBy: .equal, toItem: yellowView, attribute: .trailing, multiplier: 1, constant: 10)
            let equalWithConstraint = NSLayoutConstraint(item: greenView, attribute: .width, relatedBy: .equal, toItem: yellowView, attribute: .width
                , multiplier: 1, constant: 0)
            
            //add constraint
            //rightButton.addConstraints([rightButtonHeightConstraint, rightButtonWidthConstraint])
            view.addConstraints([leftButtonHeightConstraint,leftButtonWidthConstraint, leftButtonLeadingConstraint, leftButtonTopConstraint, rightButtonHeightConstraint, rightButtonWidthConstraint , rightButtonTopConstraint, rightButtonTrailingConstraint, yellowViewLeftConstraint, yellowViewTopConstraint, greenViewLeftConstraint, greenViewRightConstraint,  greenViewTopConstraint, equalWithConstraint ])
//            NSLayoutConstraint.activate([
//                rightButton.heightAnchor.constraint(equalToConstant: 120)
//
//            ])
        }
    
//    newView.translatesAutoresizingMaskIntoConstraints = false
//    let horizontalConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: 0)
//    let verticalConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0)
//    let widthConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
//    let heightConstraint = NSLayoutConstraint(item: newView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
//    view.addConstraints([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])

}
