//
//  RealmDishListViewControllerProtocol.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/19/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

protocol RealmDishListViewControllerProtocol: class {

    var presenter : RealmDishListPresenterProtocol? {get set}
    //
//    func showDish(with dishs : [Dish])
//    func showDishs(with dishs: [Dish])
    
    func startReloading()
    func endLoading()
    func updateView()
    func endLoadMore()
    

    

}
