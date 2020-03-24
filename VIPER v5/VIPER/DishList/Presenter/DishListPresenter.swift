//
//  DishListPresenter.swift
//  VIPER v5
//
//  Created by admin on 3/14/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit
import RealmSwift

class DishListPresenter: DishListPresenterProtocol {
    
    //property
    var dishList: [Dish]!
    var code: String!
    //var dishs : String!
    weak var view: DishListViewControllerProtocol?
    var interactor: DishListInteractorInputProtocol?
    var wireFrame: DishListWireFrameProtocol?
    
    func viewDidLoad() {
        
        //do sth here
        if let interactor = interactor {
            interactor.initDishList(id:1111)
        }
        
        if let view = view {
            //
            DispatchQueue.main.async {[weak self] in
                if let weakSelf = self, let view = weakSelf.view {
                    view.updateView()
                }
            }
            //view.updateView()
        }
    }

}

extension DishListPresenter : DishListInteractorOutputProtocol{
    func didInitDishList(dishList: [Dish]) {
        //
        self.dishList = dishList
        //
        if let view = view{
            //call update view
            view.updateView()
        }
                
    }
    
}
