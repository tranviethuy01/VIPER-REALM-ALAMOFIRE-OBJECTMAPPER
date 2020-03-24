//
//  DishDetailPresenterProtocol.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/19/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

protocol DishDetailPresenterProtocol: class {

    //basic
    var view : DishDetailViewControllerProtocol? {get set}
    var interactor : DishDetailInteractorInputProtocol? {get set}
    var wireFrame : DishDetailWireFrameProtocol? {get set}
    
    //more property
    var code : String! {get set}
    var avatar : String! {get set}
    var title : String! {get set}
    var shopName : String! {get set}
    
    func viewDidLoad()
}
