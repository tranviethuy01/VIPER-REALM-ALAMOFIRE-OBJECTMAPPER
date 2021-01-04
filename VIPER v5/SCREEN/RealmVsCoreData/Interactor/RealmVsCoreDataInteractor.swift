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
//    func initCampaign(_ campaignId: Int) {
//        if let presenter = presenter, let localDataManager = localDataManager {
//            presenter.didInitCampaign(localDataManager.initCampaign(campaignId))
//        }
//    }
//
//    func registerChange(campaign: Campaign) {
//        notificationToken = campaign.observe({[weak self] (change) in
//            if let weakSelf = self, let presenter = weakSelf.presenter {
//                presenter.didReceiveChange(change)
//            }
//        })
//    }
//
//    func reloadCampaign(_ id: Int) {
//        if let remoteDataManager = remoteDataManager {
//            remoteDataManager.reloadCampaign(id: id)
//        }
//    }
    
    weak var presenter: RealmVsCoreDataInteractorOutputProtocol?
    
    var localDataManager: RealmVsCoreDataLocalDataManagerProtocol?
    
    //var remoteDataManager: RealmVsCoreDataRemoteDataManagerInputProtocol?
    
    var notificationToken: NotificationToken?
    deinit {
        if let notificationToken = notificationToken {
            notificationToken.invalidate()
        }
    }
    /*
    func initPromotion(_ code: String) {
        if let localDataManager = localDataManager, let presenter = presenter {
            presenter.didInitPromotion(localDataManager.initPromotion(code))
        }
    }
    
    func registerChange(promotion: Promotion) {
        notificationToken = promotion.observe({ [weak self] (change) in
            if let weakSelf = self, let presenter = weakSelf.presenter {
                presenter.didReceiveChange(change)
            }
        })
    }
    
    func reloadPromotion(_ code: String) {
        if let remoteDataManager = remoteDataManager {
            remoteDataManager.reloadPromotion(code)
        }
    }
    */
    
}
//
//extension RealmVsCoreDataInteractor: RealmVsCoreDataRemoteDataManagerOutputProtocol {
////    func reloadSuccess() {
////        if let presenter = presenter {
////            presenter.reloadSuccess()
////        }
////    }
////
////    func reloadFail() {
////        if let presenter = presenter {
////            presenter.reloadFail()
////        }
////    }
////
//    
//}
