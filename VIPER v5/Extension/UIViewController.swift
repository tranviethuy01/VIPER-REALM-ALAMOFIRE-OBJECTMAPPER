//
//  UIViewController.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/31/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

extension UIViewController {
    //func to show alert
    func presentOverContext (_ viewController : UIViewController , animation : Bool, completion :(() -> ())? ) {
        viewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        viewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        
        if let tabBarController = tabBarController {
            DispatchQueue.main.async {
                tabBarController.present(viewController, animated: true, completion: completion)
            }
        }
        else if let navigationController = navigationController {
            DispatchQueue.main.async {
                navigationController.present(viewController, animated: true, completion: completion)
            }
        
        }
        else {
            DispatchQueue.main.async { [weak self] in
                if let weakSelf = self {
                    weakSelf.present(viewController, animated: true, completion: completion)
                
                }
                
            }
        
        }
    
    }

}
