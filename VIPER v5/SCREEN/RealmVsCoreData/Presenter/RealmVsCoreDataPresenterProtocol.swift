//
//  RealmVsCoreDataPresenterProtocol.swift
//  VIPER v5
//
//  Created by Tran Viet Huy on 12/08/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import Foundation
enum RealmVsCoreDataState {
    case promotion
    case campaign
}
protocol RealmVsCoreDataPresenterProtocol: class {
    var view: RealmVsCoreDataViewProtocol? {get set}
    var interactor: RealmVsCoreDataInteractorInputProtocol? {get set}
    var wireFrame: RealmVsCoreDataWireFrameProtocol? {get set}
    var code: String! {get set}
    var state: RealmVsCoreDataState! {get set}
    func viewDidLoad()
    func readRealmData()
    func writeRealmData()
    func readCoreData()
    func writeCoreData()
}
