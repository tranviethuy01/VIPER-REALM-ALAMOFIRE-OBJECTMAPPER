//
//  DishDetailInteractor.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/19/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

class DishDetailInteractor: DishDetailInteractorInputProtocol {
    
    //property
    var presenter: DishDetailInteractorOutputProtocol?
    
    //func
    func initDishDetail() {
        
        if let presenter = presenter {
            presenter.didInitDishDetail()
        }
    }
   
}
