//
//  RealmDishListWireFrame.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/19/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

class RealmDishListWireFrame: RealmDishListWireFrameProtocol {
    static func createRealmDishListViewController(code: String) -> RealmDishListViewController? {
        //stub
        //init here
        //chúng ta khởi tạo những biến đầu tiên ở đây
        
        let storyBoard = UIStoryboard(name: RealmDishListConfig.storyBoardName, bundle: nil)
        
        if let vc = storyBoard.instantiateViewController(withIdentifier: RealmDishListConfig.storyBoardID) as? RealmDishListViewController {
        //bắt đầu khởi tạo cả đống thứ ở đây
            
            let presenter = RealmDishListPresenter()
            let interactor = RealmDishListInteractor()
            let wireFrame = RealmDishListWireFrame ()
            let localDataManager = RealmDishListLocalDataManager()
            let remoteDataManager = RealmDishListRemoteDataManager()
            
            
            //setup presenter
            presenter.interactor = interactor
            presenter.wireFrame = wireFrame
            presenter.view = vc
            presenter.code = code
            
            //interactor
            interactor.presenter = presenter
            interactor.localDataManager = localDataManager
            interactor.remoteDataManager = remoteDataManager
            
            //remotedatamanager
            remoteDataManager.remoteRequestHandler = interactor
            
            vc.presenter = presenter
            
            return vc
        }
                
        
        return nil
        
    }
    

    

}
