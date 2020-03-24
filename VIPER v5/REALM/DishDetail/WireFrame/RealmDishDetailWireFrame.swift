//
//  RealmDishDetailIWireFrame.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/20/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

class RealmDishDetailWireFrame: RealmDishDetailWireFrameProtocol {
    static func createRealmDishDetailViewController(id: Int) -> RealmDishDetailViewController? {
        //do sth here
        
        //chúng ta khởi tạo những biến đầu tiên ở đây
        
        let storyBoard = UIStoryboard(name: RealmDishDetailConfig.storyBoardName, bundle: nil)
        
        if let vc = storyBoard.instantiateViewController(withIdentifier: RealmDishDetailConfig.storyBoardID) as? RealmDishDetailViewController {
        //bắt đầu khởi tạo cả đống thứ ở đây
            
            let presenter = RealmDishDetailPresenter()
            let interactor = RealmDishDetailInteractor()
            let wireFrame = RealmDishDetailWireFrame ()
            let localDataManager = RealmDishDetailLocalDataManager()
            let remoteDataManager = RealmDishDetailRemoteDataManager()
            
            
            //setup presenter
            presenter.interactor = interactor
            presenter.wireFrame = wireFrame
            presenter.view = vc
            presenter.id = id
            
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
