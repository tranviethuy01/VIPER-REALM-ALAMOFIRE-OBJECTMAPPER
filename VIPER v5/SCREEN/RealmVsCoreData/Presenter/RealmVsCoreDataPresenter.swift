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
    
    var didRegisterObserver: Bool = false
    
    func viewDidLoad() {
        
    }
    
    func readRealmData() {
        //
    }
    
    func writeRealmData() {
        //
    }
    
    func readCoreData() {
        //
    }
    
    func writeCoreData() {
        //
    }
    
}

extension RealmVsCoreDataPresenter: RealmVsCoreDataInteractorOutputProtocol {
}
