//
//  RealmVsCoreDataInteractorProtocol.swift
//  VIPER v5
//
//  Created by Tran Viet Huy on 12/08/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmVsCoreDataInteractorInputProtocol: class {
    var presenter: RealmVsCoreDataInteractorOutputProtocol? {get set}
    var localDataManager: RealmVsCoreDataLocalDataManagerProtocol? {get set}
}


protocol RealmVsCoreDataInteractorOutputProtocol: class {
}
