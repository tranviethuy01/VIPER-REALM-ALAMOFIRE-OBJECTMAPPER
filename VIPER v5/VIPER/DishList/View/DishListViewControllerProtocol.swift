//
//  DishListViewControllerProtocol.swift
//  VIPER v5
//
//  Created by admin on 3/14/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

protocol DishListViewControllerProtocol: class {

    var presenter : DishListPresenterProtocol? {get set}
    //
    func showDish(with dishs : [Dish])
    func showDishs(with dishs: [Dish])
    
    func startReloading()
    func endLoading()
    func updateView()
    func endLoadMore()
    

}
