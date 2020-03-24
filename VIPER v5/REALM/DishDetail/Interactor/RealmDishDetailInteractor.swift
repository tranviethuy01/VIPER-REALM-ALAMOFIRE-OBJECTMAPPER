//
//  RealmDishDetailInteractor.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/20/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit
import RealmSwift

class RealmDishDetailInteractor: RealmDishDetailInteractorInputProtocol {
    
    //mark property
    var presenter: RealmDishDetailInteractorOutputProtocol?
    var localDataManager: RealmDishDetailLocalDataManagerProtocol?
    var remoteDataManager: RealmDishDetailRemoteDataManagerInputProtocol?
    var dishDetailNotificationToken: NotificationToken?
    
    //func
    func initDishDetail(id: Int) {
        if let presenter = presenter, let localDataManager = localDataManager {
           
            let localData = localDataManager.initDishDetail(id: id)
            presenter.didInitDishDetail(detail: localData)
            
        }
    }
    
    func reloadDishDetail(id: Int) {
        //code
    }
    
    func registerChange(dishDetail: RealmDishModel) {
        
        //register change
        dishDetailNotificationToken = dishDetail.observe({  [weak self] (change) in
                    
            //
            if let weakSelf = self, let presenter = weakSelf.presenter { presenter.didReceiveChange(dishDetailChange: change)
            }
        })
        
        
    }

}


extension RealmDishDetailInteractor : RealmDishDetailRemoteDataManagerOutputProtocol {
    func reloadSuccess() {
        //
    }
    
    func reloadFail() {
        //
    }
    
    func reloadDishListSuccess() {
        //
    }
    
    func reloadDishListFail() {
        //
    }
    
    func loadMoreSuccess() {
        //
    }
    
    func loadMoreFail() {
        //
    }
    
    
    

}


