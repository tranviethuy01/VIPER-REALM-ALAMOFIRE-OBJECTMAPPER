//
//  DishDetailWireFrame.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/19/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

class DishDetailWireFrame: DishDetailWireFrameProtocol {
    
    static func createDishDetailViewController(code: String, avatar: String, title: String, shopName: String) -> DishDetailViewController? {
        // do sth here
        print ("GKDEBUG >> DishDetailWireFrame >> createDishDetailViewController")
        print ("GKDEBUG >> Tại đây chúng ta bắt đầu khởi tạo các biến cơ bản để hiển thị")
        print ("GKDEBUG >> các giá trị được truyền vào code: \(code) avatar: \(avatar) title: \(title) shopName: \(shopName)")
        let storyBoard = UIStoryboard(name: "DishDetail", bundle: nil)
        print (storyBoard)
        if let vc = storyBoard.instantiateViewController(withIdentifier: "DishDetailID") as? DishDetailViewController {
        
            print ("GKDEBUG >> Vào bên trong VC, tiến hành setup")
            print ("GKDEBUG >> vc \(vc)")
            //property
            let presenter = DishDetailPresenter()
            let interactor = DishDetailInteractor()
            let wireFrame = DishDetailWireFrame()
            
            
            //setup presenter
            presenter.interactor = interactor
            presenter.wireFrame = wireFrame
            presenter.view = vc
            presenter.code = code
            presenter.avatar = avatar
            presenter.title = title
            presenter.shopName = shopName
            
            print ("GKDEBUG >> DishDetailWireFrame >> presenter: \(presenter)")
            
            //setup interactor
            interactor.presenter = presenter
            //remotedatamanager
            
            vc.presenter = presenter
            
            //setup
            
            return vc
        }
        
        
        return nil
        
    }
    
    
    

}
