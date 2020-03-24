//
//  RealmDishListPresenter.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/19/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit
import Alamofire
import RealmSwift
import Foundation

class RealmDishListPresenter: NSObject, RealmDishListPresenterProtocol {
    
    //mark property
    weak var view: RealmDishListViewControllerProtocol?
    var interactor: RealmDishListInteractorInputProtocol?
    var wireFrame: RealmDishListWireFrameProtocol?
    var code: String!
    var dishList: Results<RealmDishModel>!
    var didRegisterObserver: Bool = false
    
    //mark function
    func viewDidLoad() {
        //tiến hành gọi xuống interactor
        print ("RealmDishListPresenter >> viewDidLoad()")
        /*
        1 lấy dữ liệu
        2 hiển thị
        */
        //1
        if let interactor = interactor {
        
            //init from local
            interactor.initDishList(id: 111)
            
//            addObserver(self, forKeyPath: #keyPath(requestBuilder.promotion), options: [.new], context: nil)
//            NotificationCenter.default.addObserver(self, forKeyPath: "", options: [], context: nil)
//            addObserver(self, forKeyPath: #keyPath(requestBuilder.promotion), options: [.new], context: nil)
//            addObserver(self, forKeyPath: #keyPath(dishList), options: [.new], context: nil)
            didRegisterObserver = true
        }
        
        //2
        if let view = view {
            
            
            //chủ động start Reloading
            view.startReloading()
        
        }
        
    }
    

    
    func reloadData() {
        //tiến hành reloadData
        if let interactor = interactor {
            
            print("GKDEBUG >> Gọi xuống interactor")
            interactor.reloadDishList(id: 111)
        }
    }
    

}

extension RealmDishListPresenter : RealmDishListInteractorOutputProtocol {
    func didReceiveChange(dishListChange: RealmCollectionChange<Results<RealmDishModel>>) {
        //
        print ("GKDEBUG >> RealmDishListPresenter >> didReceiveChange")
       if let view = view {
            print ("GKDEBUG >> RealmDishListPresenter >> didReceiveChange >> view.updateView")
                view.updateView()
       }
       
    }
    
    
    func didInitDishList(list: Results<RealmDishModel>?) {
        
        self.dishList = list
        
        if let interactor = interactor {
            
            print ("GKDEBUG >> Tiến hành interactor.registerChange ")
            
            interactor.registerChange(dishList: self.dishList)
        }
        
        if let view = view{
            view.updateView()
        }
        
//
        
        
        
    }
    

}
