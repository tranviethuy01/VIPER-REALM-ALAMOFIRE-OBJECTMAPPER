//
//  RealmVsCoreDataPresenter.swift
//  VIPER v5
//
//  Created by Tran Viet Huy on 12/08/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import Foundation
import RealmSwift
class RealmVsCoreDataPresenter: NSObject, RealmVsCoreDataPresenterProtocol {
    var state: RealmVsCoreDataState!
    
    var campaignId: Int!
    
//    var campaign: Campaign?
//
//    var promotion: Promotion?
//
    weak var view: RealmVsCoreDataViewProtocol?
    
    var interactor: RealmVsCoreDataInteractorInputProtocol?
    
    var wireFrame: RealmVsCoreDataWireFrameProtocol?
    
    var code: String!
    
//    @objc dynamic var builder: RequestOrderBuilder?
//
//    @objc dynamic var losendBuilder: LosendOrderBuilder?
    var didRegisterObserver: Bool = false
    
    func viewDidLoad() {
        /*
        if let interactor = interactor {
            if state == RealmVsCoreDataState.promotion {
                interactor.initPromotion(code)
                if builder != nil {
                    addObserver(self, forKeyPath: #keyPath(builder.promotion), options: [.new], context: nil)
                    didRegisterObserver = true
                }
                else if losendBuilder != nil {
                    addObserver(self, forKeyPath: #keyPath(losendBuilder.promotion), options: [.new], context: nil)
                    didRegisterObserver = true
                }
                
            }
            else {
                interactor.initCampaign(campaignId)
            }
            
            if let view = view {
                view.startReloading()
            }
        }
        */
    }
    
    /*
    func reloadData() {
        if state == .promotion {
            if let interactor = interactor {
                interactor.reloadPromotion(code)
            }
        }
        else if state == .campaign {
            if let interactor = interactor {
                interactor.reloadCampaign(campaignId)
            }
        }
    }
    deinit {
        if didRegisterObserver == true {
            if builder != nil {
                removeObserver(self, forKeyPath: #keyPath(builder.promotion))
            }
            else if losendBuilder != nil {
                removeObserver(self, forKeyPath: #keyPath(losendBuilder.promotion))
            }
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let keyPath = keyPath {
            if builder != nil {
                if keyPath == #keyPath(builder.promotion) {
                    DispatchQueue.main.async {[weak self] in
                        if let weakSelf = self, let view = weakSelf.view {
                            view.updateView()
                        }
                    }
                }
            }
            else if losendBuilder != nil {
                if keyPath == #keyPath(losendBuilder.promotion) {
                    DispatchQueue.main.async {[weak self] in
                        if let weakSelf = self, let view = weakSelf.view {
                            view.updateView()
                        }
                    }
                }
            }
        }
    }
    
    func usePromotion() {
        var params: [String: Any] = [:]
        params["code"] = code
        params["cityId"] = getCityId()
        if let builder = builder {
            params["eateryId"] = builder.eateryId
            builder.applyPromotion(params: params) {[weak self] (isSuccess, errorDesc, promotion) in
                if isSuccess == true, let promotion = promotion {
                    let realm = try! Realm()
                    realm.safeWrite {
                        realm.add(promotion, update: .all)
                    }
                    if let weakSelf = self, let navigationController = weakSelf.view?.getNavigationController() {
                        navigationController.popViewController(animated: true)
                    }
                }
            }
        }
        else if let builder = losendBuilder {
            params["serviceName"] = SuperCategoryRequestAssociatedRequest.getServiceName(typeValue: builder.superCategory)
            builder.applyPromotion(params: params) { [weak self] (isSuccess, errorDesc, promotion) in
                if isSuccess == true, let promotion = promotion {
                    let realm = try! Realm()
                    realm.safeWrite {
                        realm.add(promotion, update: .all)
                    }
                    if let weakSelf = self, let navigationController = weakSelf.view?.getNavigationController() {
                        navigationController.popViewController(animated: true)
                    }
                }
            }
        }
        
    }
    
    func getCityId() -> Int {
        var cityId: Int = 0
        if let losendOrderBuilder = losendBuilder, let sender = losendOrderBuilder.sender, sender.cityId != 0 {
            cityId = sender.cityId
        }
        else if let orderBuilder = builder, let eatery = orderBuilder.eatery, eatery.isInvalidated == false, eatery.cityId != 0 {
            cityId = eatery.cityId
        }
        else if let currentCityId = Utils.getCurrentCityId() {
            cityId = currentCityId
        }
        return cityId
        
    }
    */
    
}

extension RealmVsCoreDataPresenter: RealmVsCoreDataInteractorOutputProtocol {
    /*
    func didInitCampaign(_ campaigm: Campaign?) {
        self.campaign = campaigm
        if let campaign = self.campaign, let interactor = interactor {
            interactor.registerChange(campaign: campaign)
        }
        if let view = view {
            view.updateView()
        }
    }
    
    func didInitPromotion(_ promotion: Promotion?) {
        self.promotion = promotion
        if let promotion = self.promotion, let interactor = interactor {
            interactor.registerChange(promotion: promotion)
        }
        if let view = view {
            view.updateView()
        }
    }
    
    func didReceiveChange(_ change: ObjectChange) {
        if let view = view {
            view.updateView()
        }
    }
    
    func reloadSuccess() {
        if let view = view {
            view.endReloading()
            if state == RealmVsCoreDataState.campaign {
                if self.campaign == nil, let interactor = interactor {
                    interactor.initCampaign(campaignId)
                }
            }
            else {
                if self.promotion == nil, let interactor = interactor {
                    interactor.initPromotion(code)
                }
            }
            
        }
    }
    
    func reloadFail() {
        if let view = view {
            view.endReloading()
        }
    }
    
    */
}
