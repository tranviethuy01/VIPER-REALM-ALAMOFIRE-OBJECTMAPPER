//
//  DishListPresenter.swift
//  VIPER v5
//
//  Created by admin on 3/14/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit
import RealmSwift

class DishListPresenter: DishListPresenterProtocol {
    
    var dishList: [Dish]!
    
    
    var code: String!
    
    
    //var dishList = [Dish]()
    var dishs : String!
    
    weak var view: DishListViewControllerProtocol?
    
    var interactor: DishListInteractorInputProtocol?
    
    var wireFrame: DishListWireFrameProtocol?
    
    func viewDidLoad() {
        //do sth here
       
        if let interactor = interactor {
            interactor.initDishList(id:1111)
        }
        
        if let view = view {
            
            print("GKDEBUG >> Vào bên trong view = view")
            view.startReloading()
            //
            DispatchQueue.main.async {[weak self] in
                if let weakSelf = self, let view = weakSelf.view {
                    view.updateView()
                }
            }
            //view.updateView()
        }
    }
    
    

}

extension DishListPresenter : DishListInteractorOutputProtocol{
    
    
    func didInitDishList(dishList: [Dish]) {
        
        //let dishList = [Dish]()
        self.dishList = dishList
//        //test only
//        let allDishDetail = DishData.generateDataList()
//        for item in allDishDetail {
//            dishList.append(Dish(attribute: item))
//        }
        
        
        
        if let view = view{
            //call update view
            view.updateView()
        }
        
        
    }
    

}
