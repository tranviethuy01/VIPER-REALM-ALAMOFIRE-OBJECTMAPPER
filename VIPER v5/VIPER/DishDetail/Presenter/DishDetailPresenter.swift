//
//  DishDetailPresenter.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/19/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

class DishDetailPresenter: DishDetailPresenterProtocol {
    var view: DishDetailViewControllerProtocol?
    
    var interactor: DishDetailInteractorInputProtocol?
    
    var wireFrame: DishDetailWireFrameProtocol?
    
    var code: String!
    
    var avatar: String!
    
    var title: String!
    
    var shopName: String!
    
    func viewDidLoad() {
        //do sth here
        print ("GKDEBUG >> DishDetailPresenter >> viewDidLoad()")
//        1. Gọi interactor để lấy dữ liệu
//        2. Gọi lại view để hiển thị
        
        //(1)
        
        if let interactor = interactor {
            interactor.initDishDetail()
        
        }
        
        //(2)
        
        if let view = view {
            DispatchQueue.main.async {[weak self] in
                if let weakSelf = self, let view = weakSelf.view {
                    view.updateView()
                }
            }
        
        }
    }
    

}

extension DishDetailPresenter : DishDetailInteractorOutputProtocol {
    func didInitDishDetail() {
        //do sth
    }
    

}
