//
//  RealmRemoteDataManagerProtocol.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/20/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

protocol RealmDishDetailRemoteDataManagerInputProtocol: class {

    
    var remoteRequestHandler : RealmDishDetailRemoteDataManagerOutputProtocol? {get set}
        //func reloadDishList(code: String)
        func reloadDishDetail(id: Int)
        
}

protocol RealmDishDetailRemoteDataManagerOutputProtocol: class {
        func reloadSuccess()
        func reloadFail()
        
        //
        func reloadDishListSuccess()
        func reloadDishListFail()
        //func reloadSuccess()
        //func reloadFail()
        func loadMoreSuccess()
        func loadMoreFail()
        
}
