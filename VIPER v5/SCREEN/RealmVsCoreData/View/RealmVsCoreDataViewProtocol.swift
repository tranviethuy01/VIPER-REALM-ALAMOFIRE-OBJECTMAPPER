//
//  RealmVsCoreDataViewProtocol.swift
//  VIPER v5
//
//  Created by Tran Viet Huy on 12/08/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import Foundation


protocol RealmVsCoreDataViewProtocol: class {
    var presenter: RealmVsCoreDataPresenterProtocol? {get set}
//    func startReloading()
//    func endReloading()
    func updateView()
}
