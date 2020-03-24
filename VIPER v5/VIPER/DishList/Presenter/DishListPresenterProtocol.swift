//
//  DishListPresenterProtocol.swift
//  VIPER v5
//
//  Created by admin on 3/14/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit
import RealmSwift

protocol DishListPresenterProtocol: class {

    //property
    var view : DishListViewControllerProtocol? {get set}
    var interactor : DishListInteractorInputProtocol? {get set}
    var wireFrame : DishListWireFrameProtocol? {get set}
    var code : String! { get set }
    var dishList : [Dish]! {get set}
    
    //func
    // VIEW -> PRESENTER
    func viewDidLoad()
    
    

}
