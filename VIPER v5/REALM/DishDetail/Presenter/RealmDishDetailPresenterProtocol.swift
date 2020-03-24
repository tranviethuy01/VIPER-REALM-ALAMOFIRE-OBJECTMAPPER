//
//  RealmDishDetailPresenterProtocol.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/20/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

protocol RealmDishDetailPresenterProtocol: class {

    //mark property
    var view : RealmDishDetailViewControllerProtocol? {get set}
    var interactor : RealmDishDetailInteractorInputProtocol? {get set}
    var wireFrame : RealmDishDetailWireFrameProtocol? {get set}
    var id : Int! {get set}
    var dish : RealmDishModel! {get set}
    
    //mark func
    func viewDidLoad()
    func reloadData()

}
