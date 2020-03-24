//
//  RealmDishListInteractor.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/19/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit
import RealmSwift


class RealmDishListInteractor: RealmDishListInteractorInputProtocol {
    
    //mark property
    weak var presenter: RealmDishListInteractorOutputProtocol?
    var localDataManager: RealmDishListLocalDataManagerProtocol?
    var remoteDataManager: RealmDishListRemoteDataManagerInputProtocol?
    var dishListNotificationToken: NotificationToken?
    
    //mark func
    func registerChange(dishList: Results<RealmDishModel>) {
        
        //register change
        dishListNotificationToken = dishList.observe({[weak self] (changes) in
            
            print("GKDEBUG >> registerChange >> dishList.observe >> changes")
            if let weakSelf = self, let presenter = weakSelf.presenter {
                //
                presenter.didReceiveChange(dishListChange: changes)
            }
        })
        
    }
    
    func initDishList(id : Int) {
        //do sth here
        if let presenter = presenter, let localDataManager = localDataManager {
           
            let localData = localDataManager.initDishList(id: id)
            presenter.didInitDishList(list: localData)
            
        }
        
        
    }
    
    
    func reloadDishList(id: Int) {
        //tiến hành gọi xuống datamanager và lấy dữ liệu
        if let remoteDataManager = remoteDataManager {
            //lấy dữ liệu remote
            remoteDataManager.reloadDishList(id: 111)
        }
    }
    
    

}

extension RealmDishListInteractor : RealmDishListRemoteDataManagerOutputProtocol {
    func reloadDishListSuccess() {
        //do sth
    }
    
    func reloadDishListFail() {
        //do sth
    }
    
    func loadMoreSuccess() {
        //do sth
    }
    
    func loadMoreFail() {
        //do sth
    }
    
    func reloadSuccess() {
        //do sth
    }
    
    func reloadFail() {
        //do sth
    }
    

}
