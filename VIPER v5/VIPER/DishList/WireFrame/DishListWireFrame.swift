//
//  DishListWireFrame.swift
//  VIPER v5
//
//  Created by admin on 3/14/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

class DishListWireFrame: DishListWireFrameProtocol {
    static func createDishListViewController(code: String) -> DishListViewController? {
        
        let storyboard = UIStoryboard (name: "ViperDishListStoryboard", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "ViperDishListStoryboardID") as? DishListViewController {
            
            let presenter = DishListPresenter()
            let interactor = DishListInteractor()
            let wireFrame = DishListWireFrame()
            let localDataManager = DishListLocalDataManager()
            
            //setup
            //presenter
            presenter.interactor = interactor
            presenter.wireFrame = wireFrame
            presenter.view = vc
            presenter.code = code
            //presenter.dishList = []
            //interactor
            interactor.presenter = presenter
            interactor.localDataManager = localDataManager
            //remotedatamanager
            
            vc.presenter = presenter
            
            //return
            return vc
        }
        
        return nil
        
    }
    

}
