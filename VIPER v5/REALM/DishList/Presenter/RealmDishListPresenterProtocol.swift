//
//  RealmDishListPresenterProtocol.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/19/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit
import RealmSwift

protocol RealmDishListPresenterProtocol: class {

    //mark property
    var view : RealmDishListViewControllerProtocol? {get set}
    var interactor : RealmDishListInteractorInputProtocol? {get set}
    var wireFrame : RealmDishListWireFrameProtocol? {get set}
    var code : String! {get set}
    var dishList : Results<RealmDishModel>! {get set}
    
    //mark func
    func viewDidLoad()
    func reloadData()
    

}
