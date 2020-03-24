//
//  RealmDishListRemoteDataManagerProtocol.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/20/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit
import RealmSwift
protocol RealmDishListRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler : RealmDishListRemoteDataManagerOutputProtocol? {get set}
    //func 
    func reloadDishList(id: Int)
    
}


protocol RealmDishListRemoteDataManagerOutputProtocol: class {
    func reloadSuccess()
    func reloadFail()
    func reloadDishListSuccess()
    func reloadDishListFail()
    func loadMoreSuccess()
    func loadMoreFail()
    
}
