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
    
    
    /**
     Method to show customize alert with message and action, action can be nil
     - Parameter message: String
     - Parameter action: ()->()?
     */
    
    /*
    class func showAlert(message: String, action: (()->())? = nil) {
        if let topVC = ViewService.findTopMostViewController(), let alert = LoshipAlertWireFrame.createLoshipAlertViewController(content: message, action: action){
            topVC.presentOverContext(alert, animated: true, completion: nil)
        }
    }
    
    class func showAdvanceAlert(title: String?,
                                content: NSAttributedString?,
                                confirmTitle: String?,
                                confirmAction: (()->())?,
                                imageName: String? = nil,
                                imageWidth: CGFloat? = nil,
                                imageHeight: CGFloat? = nil,
                                confirmBackgroundColor: UIColor? = nil,
                                confirmTintColor: UIColor? = nil) {
        if let topVC = ViewService.findTopMostViewController(), let alert = AdvanceAlertWireFrame.createAdvanceAlertViewController(alertTitle: title, alertContent: content, confirmTitle: confirmTitle, confirmAction: confirmAction, imageName: imageName, imageWidth: imageWidth, imageHeight: imageHeight, confirmBackgroundColor: confirmBackgroundColor, confirmTintColor: confirmTintColor) {
            topVC.presentOverContext(alert, animated: true, completion: nil)
        }
        
    }
    
    class func showConfirmAndCancelAlert(title: String?,
                                         content: NSAttributedString?,
                                         confirmTitle: String?,
                                         confirmAction: (()->())?,
                                         cancelTitle: String?,
                                         cancelAction: (()->())?,
                                         imageName: String? = nil,
                                         imageWidth: CGFloat? = nil,
                                         imageHeight: CGFloat? = nil,
                                         confirmBackgroundColor: UIColor? = nil,
                                         confirmTintColor: UIColor? = nil,
                                         cancelBackgroundColor: UIColor? = nil,
                                         cancelTintColor: UIColor? = nil,
                                         style: ConfirmAndCancelStyle = .horizontal) {
        if let topVC = ViewService.findTopMostViewController(),
            let alert = ConfirmAndCancelWireFrame.createConfirmAndCancelViewController(title,
                                                                                       content,
                                                                                       confirmTitle,
                                                                                       cancelTitle,
                                                                                       confirmAction,
                                                                                       cancelAction,
                                                                                       imageName,
                                                                                       imageWidth,
                                                                                       imageHeight,
                                                                                       confirmBackgroundColor,
                                                                                       confirmTintColor,
                                                                                       cancelBackgroundColor,
                                                                                       cancelTintColor,
                                                                                       style: style) {
            topVC.presentOverContext(alert, animated: true, completion: nil)
        }
    }
    
    /**
     Method to clear all upper view hierarchy to prepare for deallocation, add completedAction such as set viewController to nil to deallocate after clear all view controller hierarchy
     - Parameter viewController: UIViewController
     - Parameter completedAction: ()->()?
     */
    class func clearViewController(viewController: UIViewController, completedAction: (()->())? = nil) {
        clear(viewController: viewController)
        if let completedAction = completedAction {
            completedAction()
        }
    }
    class func clear(viewController: UIViewController) {
        if let presentedViewController = viewController.presentedViewController {
            clear(viewController: presentedViewController)
            return
        }
        else if let tabBarController = viewController as? UITabBarController, checkIfTabBarControllerIsCleared(tabBarController: tabBarController) == false {
            if let viewControllers = tabBarController.viewControllers {
                for tabBarViewController in viewControllers {
                    clear(viewController: tabBarViewController)
                }
            }
            clear(viewController: tabBarController)
            return
        }
        else if let navigationController = viewController as? UINavigationController, checkIfNavigationControllerIsCleared(navigationController: navigationController) == false{
            navigationController.viewControllers = [navigationController.viewControllers[0]]
            clear(viewController: navigationController)
            return
        }
        else if let presentingViewController = viewController.presentingViewController {
            viewController.dismiss(animated: false, completion: {
                clear(viewController: presentingViewController)
            })
            
            return
            
        }
    }
    class func checkIfTabBarControllerIsCleared(tabBarController: UITabBarController) -> Bool{
        if let viewControllers = tabBarController.viewControllers {
            let filterViewController = viewControllers.filter({ (vc) -> Bool in
                if vc.presentingViewController == nil && vc.presentedViewController == nil  {
                    if let vc = vc as? UINavigationController {
                        return checkIfNavigationControllerIsCleared(navigationController: vc)
                    }
                    else {
                        return true
                    }
                }
                return false
            })
            if filterViewController.count == viewControllers.count{
                return true
            }
            return false
        }
        return true
    }
    class func checkIfNavigationControllerIsCleared(navigationController: UINavigationController) -> Bool {
        if navigationController.viewControllers.count == 1 {
            return true
        }
        return false
    }
    class func checkIfViewControllerIsCleared(viewController: UIViewController) -> Bool {
        if viewController.presentingViewController == nil, viewController.presentedViewController == nil {
            return true
        }
        return false
    }
    
    class func showLoadingIndicator() {
        CustomLoadingView.sharedInstance.show()
    }
    class func hideLoadingIndicator() {
        CustomLoadingView.sharedInstance.hide()
    }
    
    class func showWithdrawLoadingIndicator(title: String, content: String, subContent: String) {
        CustomWithdrawLoadingView.sharedInstance.show(title: title, content: content, subContent: subContent)
    }
    class func hideWithdrawLoadingIndicator() {
        CustomWithdrawLoadingView.sharedInstance.hide()
    }
    
    class func updateWithdrawLoadingIndicator(title: String, content: String, subContent: String) {
        CustomWithdrawLoadingView.sharedInstance.updateView(title: title, content: content, subContent: subContent)
    }
    class func showFinishWithdrawLoadingIndicator(title: String, content: String) {
        CustomWithdrawLoadingView.sharedInstance.showFinish (title: title, content: content)
    }
    
    
    class func showPhotoList(_ imageList: [String], selectedImage: String?) {
        if let topMostVC = ViewService.findTopMostViewController(), let vc = ViewPhotoListWireFrame.createViewPhotoList(imageList: imageList, selectedImage: selectedImage) {
            topMostVC.present(vc, animated: true, completion: nil)
        }
    }

    class func renderShowHideView(isShow: Bool, zeroHeightConstraint: NSLayoutConstraint, bottomSpaceConstraint: NSLayoutConstraint) {
        zeroHeightConstraint.isActive = !isShow
        bottomSpaceConstraint.isActive = isShow
    }
    
    class func showWeb(_ url: String, title: String) {
        if let topMostVC = findTopMostViewController(), let vc = SeeOftenQuestionWireFrame.createSeeOftenQuestionViewController(url: url, title: title){
            let navigationController = UINavigationController.init(rootViewController: vc)
            topMostVC.customPresent(navigationController, animated: true)
        }
    }
    
    class func share(content: String, completion: (() -> Void)? = nil) {
        // set up activity view controller
        DispatchQueue.main.async {
            let textToShare = [content]
            if let topMostVC = findTopMostViewController() {
                let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
                activityViewController.popoverPresentationController?.sourceView = topMostVC.view // so that iPads won't crash
                // present the view controller
                topMostVC.customPresent(activityViewController, animated: true, completion: completion)
            }
        }
        
        
    }
    */
}
