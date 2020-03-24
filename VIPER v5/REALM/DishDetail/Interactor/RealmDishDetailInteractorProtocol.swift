//
//  RealmDishDetailInteractorProtocol.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/20/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit
import RealmSwift
protocol RealmDishDetailInteractorInputProtocol: class {

    //
    var presenter : RealmDishDetailInteractorOutputProtocol? {get set}
    //func
    func initDishDetail(id: Int) //return nothing
    func reloadDishDetail(id: Int)
    func registerChange(dishDetail: RealmDishModel)
}

protocol RealmDishDetailInteractorOutputProtocol: class {
        func didInitDishDetail(detail: RealmDishModel?)
        func didReceiveChange(dishDetailChange: ObjectChange)
}
