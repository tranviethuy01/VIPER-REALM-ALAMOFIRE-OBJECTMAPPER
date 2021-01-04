//
//  RealmVsCoreDataWireFrame.swift
//  VIPER v5
//
//  Created by Tran Viet Huy on 12/08/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import Foundation

class RealmVsCoreDataWireFrame: RealmVsCoreDataWireFrameProtocol {
    static func createRealmVsCoreDataViewController() -> RealmVsCoreDataViewController? {
        if let vc = RealmVsCoreDataViewController.initWithStoryBoard() as? RealmVsCoreDataViewController {
            let presenter = RealmVsCoreDataPresenter()
            let interactor = RealmVsCoreDataInteractor()
            let wireFrame = RealmVsCoreDataWireFrame()
            let localDataManager = RealmVsCoreDataLocalDataManager()
            //let remoteDataManager = RealmVsCoreDataRemoteDataManagerL()
            presenter.interactor = interactor
            presenter.wireFrame = wireFrame
            presenter.state = RealmVsCoreDataState.campaign
            presenter.view = vc
//            presenter.campaignId = campaignId
//            presenter.builder = builder
//            presenter.losendBuilder = losendBuilder
            interactor.presenter = presenter
            interactor.localDataManager = localDataManager
//            interactor.remoteDataManager = remoteDataManager
//            remoteDataManager.remoteRequestHandler = interactor
            vc.presenter = presenter
            
            return vc
        }
        return nil
    }
}
