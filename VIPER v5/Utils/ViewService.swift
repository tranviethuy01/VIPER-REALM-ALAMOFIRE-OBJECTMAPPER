//
//  ViewService.swift
//  VIPER v5
//
//  Created by Tran Viet Huy on 12/08/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import Foundation
import UIKit

final class ViewService {
    // MARK: Screen size
    class func screenSize() -> CGSize {
        return UIScreen.main.bounds.size
    }
    
    // MARK: Storyboard
    /**
     Method returns an instance of the view controller defined by the storyboard Id paramter from the storyboard defined by the storyboardName parameter
     - Parameter storyboardId: String
     - Parameter storyboardName: String
     - Returns: UIViewController?
     */
    class func viewController(_ storyboardId: String, storyboardName: String) -> UIViewController? {
        let storyboard = storyboardBoardWithName(storyboardName)
        let viewController: AnyObject = storyboard.instantiateViewController(withIdentifier: storyboardId)
        return viewController as? UIViewController
    }
    
    /**
     Method returns an instance of the storyboard defined by the storyboardName String parameter
     - Parameter storyboardName: UString
     - Returns: UIStoryboard
     */
    class func storyboardBoardWithName(_ storyboardName: String) -> UIStoryboard {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        return storyboard
    }
    /**
     Method returns an instance of a nib defined by the name String parameter
     - Parameter name: String
     - Returns: UINib?
     */
    class func nib(_ name: String) -> UINib? {
        let nib: UINib? = UINib(nibName: name, bundle: Bundle.main)
        return nib
    }
    /**
     Method returns an instance of a view defined by the nib name String parameter
     - Parameter nibName: String
     - Returns: UIView?
     */
    class func viewFrom(_ nibName: String) -> UIView? {
        let objects = Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)
        if objects!.count > 0 {
            return objects![0] as? UIView
        }
        return nil
    }
    
    // MARK: UITableView
    /**
     Method registers a nib name defined by the nibName String parameter with the tableview given by the tableview parameter
     - Parameter nibName:        String
     - Parameter tableView: UITableView
     */
    class func registerNibWithTableView(_ nibName: String, tableView: UITableView) {
        let nib = ViewService.nib(nibName)
        tableView.register(nib, forCellReuseIdentifier: nibName)
    }
    
    
    class func registerHeaderNibWithTableView(_ nibName: String, tableView: UITableView) {
        let nib = ViewService.nib(nibName)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: nibName)
    }
    // MARK: UICollectionView
    /**
     Method registers a nib name defined by the nibName String parameter with the collectionView given by the collectionView parameter
     - Parameter nibName:        String
     - Parameter collectionView: UICollectionView
     */
    class func registerNibWithCollectionView(_ nibName: String, collectionView: UICollectionView) {
        let nib = ViewService.nib(nibName)
        collectionView.register(nib, forCellWithReuseIdentifier: nibName)
    }
    
    /**
     Method registers a supplementary element of kind nib defined by the nibName String parameter and the kind String parameter with the collectionView parameter
     - Parameter nibName:        String
     - Parameter kind:           String
     - Parameter collectionView: UICollectionView
     */
    class func registerSupplementaryElementOfKindNibWithCollectionView(nibName: String, kind: String, collectionView: UICollectionView) {
        let nib = ViewService.nib(nibName)
        collectionView.register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: nibName)
    }
    /**
     Method to find top most view controller
     - Returns: UIViewController?
     */
    class func findTopMostViewController() -> UIViewController?{
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
}
