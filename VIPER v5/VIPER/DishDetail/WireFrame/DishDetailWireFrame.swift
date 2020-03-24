//
//  DishDetailWireFrame.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/19/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

class DishDetailWireFrame: DishDetailWireFrameProtocol {
    
    static func createDishDetailViewController(code: String, avatar: String, title: String, shopName: String) -> DishDetailViewController? {
        
        // code
        
        let storyBoard = UIStoryboard(name: ViperDishDetailConfig.storyBoardName, bundle: nil)
        //print (storyBoard)
        if let vc = storyBoard.instantiateViewController(withIdentifier: ViperDishDetailConfig.storyBoardID) as? DishDetailViewController {
        
            //property
            let presenter = DishDetailPresenter()
            let interactor = DishDetailInteractor()
            let wireFrame = DishDetailWireFrame()
                        
            //setup presenter
            presenter.interactor = interactor
            presenter.wireFrame = wireFrame
            presenter.view = vc
            presenter.code = code
            presenter.avatar = avatar
            presenter.title = title
            presenter.shopName = shopName
            
            //setup interactor
            interactor.presenter = presenter
            //remotedatamanager
            
            vc.presenter = presenter
            
            //return
            return vc
        }
        
        return nil
        
    }
    
    
    

}
