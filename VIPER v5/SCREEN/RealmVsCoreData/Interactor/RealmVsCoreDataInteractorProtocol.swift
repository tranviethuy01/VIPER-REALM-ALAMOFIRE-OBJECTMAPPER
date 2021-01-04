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
//    var remoteDataManager: RealmVsCoreDataRemoteDataManagerInputProtocol? {get set}
//    func initPromotion(_ code: String)
//    func registerChange(promotion: Promotion)
//    func reloadPromotion(_ code: String)
//    func initCampaign(_ campaignId: Int)
//    func registerChange(campaign: Campaign)
//    func reloadCampaign(_ id: Int)
}


protocol RealmVsCoreDataInteractorOutputProtocol: class {
//    func didInitPromotion(_ promotion: Promotion?)
//    func didInitCampaign(_ campaigm: Campaign?)
//    func didReceiveChange(_ change: ObjectChange)
//    func reloadSuccess()
//    func reloadFail()
}
