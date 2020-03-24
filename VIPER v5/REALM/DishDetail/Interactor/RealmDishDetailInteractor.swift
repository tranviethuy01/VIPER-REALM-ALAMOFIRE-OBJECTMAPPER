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
        //code
        print("GKDEBUG >> RealmDishDetailInteractor >> registerChange ")
                
            //register change
        dishDetailNotificationToken = dishDetail.observe({  [weak self] (change) in
                    
                    print("GKDEBUG >> registerChange >> dishList.observe >> changes")
                    if let weakSelf = self, let presenter = weakSelf.presenter {
        //                presenter.didReceiveChange(campaignListChange: changes)
                        print("GKDEBUG >> registerChange >> dishList.observe >> changes >> tiến hành gọi presenter thực hiện update view")
                        presenter.didReceiveChange(dishDetailChange: change)
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


