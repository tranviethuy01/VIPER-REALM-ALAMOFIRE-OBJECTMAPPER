//
//  RealmVsCoreDataLocalDataManagerProtocol.swift
//  VIPER v5
//
//  Created by Tran Viet Huy on 12/08/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import Foundation

protocol RealmVsCoreDataLocalDataManagerProtocol: class {
    func readRealmData()
    func writeRealmData()
    func readCoreData()
    func writeCoreData()
    
}
