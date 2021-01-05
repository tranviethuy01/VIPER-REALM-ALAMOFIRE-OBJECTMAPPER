//
//  RealmVsCoreDataViewController.swift
//  VIPER v5
//
//  Created by Tran Viet Huy on 12/08/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

class RealmVsCoreDataViewController: ViewController {
    
    @IBOutlet weak var useBtnWrapperViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var useBtnSectionView: UIView!
    @IBOutlet weak var useBtn: UIButton!
    
    var state: RealmVsCoreDataState! {
        return presenter!.state
    }
    var presenter: RealmVsCoreDataPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let presenter = presenter {
            presenter.viewDidLoad()
        }
        
    }
    
    @IBAction func useBtn_TouchUpInside(_ sender: Any) {
        
    }
    
    
    @IBAction func readRealmBtn_Tap(_ sender: Any) {
        if let presenter = presenter {
            presenter.readRealmData()
        }
    }
    
    
    @IBAction func writeRealmBtn_Tap(_ sender: Any) {
        if let presenter = presenter {
            presenter.writeRealmData()
        }
    }
    
    @IBAction func readCoreDataBtn_Tap(_ sender: Any) {
        if let presenter = presenter {
            presenter.readCoreData()
        }
    }
    
    @IBAction func writeCoreDataBtn_Tap(_ sender: Any) {
        if let presenter = presenter {
            presenter.writeCoreData()
        }
    }
    
    override class func storyBoardId() -> String {
        return "RealmVsCoreData"
    }
    
    override class func storyBoardName() -> String {
        return "RealmVsCoreData"
    }
    

}


extension RealmVsCoreDataViewController: RealmVsCoreDataViewProtocol {
    
    
    func updateView() {
        
    }
    
    
}
