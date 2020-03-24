//
//  DistDetailViewControllerProtocol.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/19/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

protocol DishDetailViewControllerProtocol: class {

    var presenter : DishDetailPresenterProtocol? {get set}
   
    func startReloading()
    func endLoading()
    func updateView()
    func endLoadMore()    

}
