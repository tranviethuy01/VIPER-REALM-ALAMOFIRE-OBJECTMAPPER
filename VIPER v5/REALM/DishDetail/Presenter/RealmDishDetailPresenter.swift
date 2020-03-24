//
//  RealmDishDetailPresenter.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/20/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit
import RealmSwift

class RealmDishDetailPresenter: NSObject,RealmDishDetailPresenterProtocol {
    //property
    var interactor: RealmDishDetailInteractorInputProtocol?
    var dish: RealmDishModel!
    var wireFrame: RealmDishDetailWireFrameProtocol?
    var view: RealmDishDetailViewControllerProtocol?
    var id: Int!
    var didRegisterObserver  = false
    //func
    func viewDidLoad() {
        if let interactor = interactor {
                
            //init from local
            interactor.initDishDetail(id: id)
             didRegisterObserver = true
         }
                
                //2
          if let view = view {
                    
              //start Reloading
              view.startReloading()
                
          }
    }
    
    func reloadData() {
        //do func here
    }
    
    
    
}


extension RealmDishDetailPresenter : RealmDishDetailInteractorOutputProtocol {
    func didReceiveChange(dishDetailChange: ObjectChange) {
        if let view = view {
             print ("GKDEBUG >> RealmDishDetailPresenter >> didReceiveChange >> view.updateView")
                 view.updateView()
        }
    }
    
    
    
    func didInitDishDetail(detail: RealmDishModel?) {
        //code
        self.dish = detail
        
        if let interactor = interactor {
            
           //
            interactor.registerChange(dishDetail: self.dish)
        }
        
        if let view = view{
            view.updateView()
        }
        
    }
    
        
    func didReceiveChange(dishDetailChange: RealmDishModel) {
        //do sth
    }
    
    

}

