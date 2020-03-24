//
//  RealmDishListInteractorProtocol.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/19/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit
import RealmSwift

protocol RealmDishListInteractorInputProtocol: class {

    var presenter : RealmDishListInteractorOutputProtocol? {get set}
   
    func initDishList(id: Int) //return nothing
    func reloadDishList(id: Int)
    
    //
    func registerChange(dishList: Results<RealmDishModel>)
    

}

protocol RealmDishListInteractorOutputProtocol: class {

    func didInitDishList(list: Results<RealmDishModel>?)
    func didReceiveChange(dishListChange: RealmCollectionChange<Results<RealmDishModel>>)
    
    

}
