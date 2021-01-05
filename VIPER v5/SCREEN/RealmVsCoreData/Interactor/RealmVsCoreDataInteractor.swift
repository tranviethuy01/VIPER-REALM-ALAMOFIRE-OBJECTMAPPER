//
//  RealmVsCoreDataInteractor.swift
//  VIPER v5
//
//  Created by Tran Viet Huy on 12/08/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import Foundation
import RealmSwift

class RealmVsCoreDataInteractor: RealmVsCoreDataInteractorInputProtocol {
    weak var presenter: RealmVsCoreDataInteractorOutputProtocol?
    
    var localDataManager: RealmVsCoreDataLocalDataManagerProtocol?
    
    var notificationToken: NotificationToken?
    deinit {
        if let notificationToken = notificationToken {
            notificationToken.invalidate()
        }
    }
    
    
}
