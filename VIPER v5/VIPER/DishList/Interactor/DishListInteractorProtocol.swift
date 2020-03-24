//
//  DishListInteractorProtocol.swift
//  VIPER v5
//
//  Created by admin on 3/14/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit
import RealmSwift

protocol DishListInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    
    //var presenter : DishListPresenterProtocol? {get set}
    var localDataManager: DishListLocalDataManagerProtocol? {get set}
    
    var presenter : DishListInteractorOutputProtocol? {get set}
    
    func getDishList()
    
    func initDishList(id: Int)
   

}

protocol DishListInteractorOutputProtocol : class {
    // INTERACTOR -> PRESENTER    
    func didInitDishList(dishList : [Dish])
    

}
