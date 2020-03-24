//
//  DishListInteractor.swift
//  VIPER v5
//
//  Created by admin on 3/14/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

class DishListInteractor: DishListInteractorInputProtocol {
    
    
    
    //Mark Property
    var localDataManager: DishListLocalDataManagerProtocol?
    weak var presenter: DishListInteractorOutputProtocol?
    
    func initDishList(id : Int) {
        
        if let presenter = presenter, let localDataManager = localDataManager {
           //get data
            let localData = localDataManager.initDishList(id: id)
            //call presenter
            presenter.didInitDishList(dishList: localData)
            
        }
        
    }
    
    
    func getDishList() {
       
    }
    
    
    func getAllDishDetail() -> [Dish] {
        var dishList = [Dish]()
        //test only
        let allDishDetail = DishData.generateDataList()
        for item in allDishDetail {
            dishList.append(Dish(attribute: item))
        }
        return dishList
    }
    
    

}
