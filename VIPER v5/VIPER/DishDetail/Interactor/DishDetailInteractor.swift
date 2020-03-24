//
//  DishDetailInteractor.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/19/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

class DishDetailInteractor: DishDetailInteractorInputProtocol {
    
    
    var presenter: DishDetailInteractorOutputProtocol?
    
    
    
    
    func initDishDetail() {
        //tiến hành lấy thông tin
        
        //gọi lại presenter lấy thông tin ??? sai mợ nó rồi
        if let presenter = presenter {
            
            presenter.didInitDishDetail()
        }
    }
    
    
   
}
