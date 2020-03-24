//
//  DishListViewControllerProtocol.swift
//  VIPER v5
//
//  Created by admin on 3/14/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

protocol DishListViewControllerProtocol: class {

    //mark property
    var presenter : DishListPresenterProtocol? {get set}
    //mark func
    func showDish(with dishs : [Dish])
    func showDishs(with dishs: [Dish])    
    func startReloading()
    func endLoading()
    func updateView()
    func endLoadMore()
    

}
