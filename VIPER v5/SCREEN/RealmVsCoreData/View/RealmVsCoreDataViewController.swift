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
//    var builder: RequestOrderBuilder? {
//        get {
//            return presenter?.builder
//        }
//    }
//
//    var losendBuilder: LosendOrderBuilder? {
//        get {
//            return presenter?.losendBuilder
//        }
//    }
//    var campaign: Campaign? {
//        get {
//            return presenter?.campaign
//        }
//    }
//
//    var promotion: Promotion? {
//        get {
//            return presenter?.promotion
//        }
//    }
//    var detailView: RealmVsCoreDataView!
//
    var presenter: RealmVsCoreDataPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        useBtn.addCornerRadius()
//        useBtn.textLayout(.title(ColorSystem.white))
//
//        useBtn.backgroundColor = ColorSystem.red
//        setNavigationTitle("promotiondetail.navigation.title".localized)
//        scrollView.addRefreshHeader {[weak self] in
//            if let weakSelf = self, let presenter = weakSelf.presenter {
//                presenter.reloadData()
//            }
//        }
//
//
        if let presenter = presenter {
            presenter.viewDidLoad()
        }
        
//
//        if state == .promotion {
//            useBtnWrapperViewHeightConstraint.constant = 74
//            useBtnSectionView.addShadowToOneSide(verticalDirection: .top)
//        }
//        else if state == .campaign {
//            useBtnWrapperViewHeightConstraint.constant = 0
//        }
        
    }
    /*
    @IBAction func useBtn_TouchUpInside(_ sender: Any) {
        if let presenter = presenter {
            presenter.usePromotion()
        }
    }
    
    func updateRealmVsCoreDataView() {
        if detailView == nil {
            let view = RealmVsCoreDataView.initWithNib() as! RealmVsCoreDataView
            detailView = view
            contentView.addSubviewForLayout(detailView)
            contentView.addConstraints([detailView.alignTop(to: contentView),
                                        detailView.alignLeading(to: contentView),
                                        contentView.alignTrailing(to: detailView),
                                        contentView.alignBottom(to: detailView, relation: .greaterThanOrEqual, space: 10)])
        }
        detailView.frame.size.width = ViewService.screenSize().width
        if state == .promotion {
            detailView.promotion = promotion
        }
        else if state == .campaign  {
            detailView.campaign = campaign
        }
        
    }
    */
    
    override class func storyBoardId() -> String {
        return "RealmVsCoreData"
    }
    
    override class func storyBoardName() -> String {
        return "RealmVsCoreData"
    }
    

}


extension RealmVsCoreDataViewController: RealmVsCoreDataViewProtocol {
    
//
//    func startReloading() {
//        scrollView.headerBeginRefreshing()
//    }
//
//    func endReloading() {
//        scrollView.headerEndRefreshing()
//    }
    
    func updateView() {
        /*
        updateRealmVsCoreDataView()
        if state == RealmVsCoreDataState.promotion {
            if let promotion = promotion, promotion.isValidated() {
                if let builder = builder, let selectedPromotion = builder.promotion, selectedPromotion.isValidated(), selectedPromotion.id == promotion.id {
                    useBtn.isUserInteractionEnabled = false
                    useBtn.backgroundColor = ColorSystem.green
                    useBtn.setTitle("promotionlist.applied".localized, for: .normal)
                    
                }
                else if let builder = losendBuilder, let selectedPromotion = builder.promotion, selectedPromotion.isValidated(), selectedPromotion.id == promotion.id {
                    useBtn.isUserInteractionEnabled = false
                    useBtn.backgroundColor = ColorSystem.green
                    useBtn.setTitle("promotionlist.applied".localized, for: .normal)
                }
                else {
                    useBtn.isUserInteractionEnabled = true
                    useBtn.backgroundColor = ColorSystem.red
                    useBtn.setTitle("promotionlist.use".localized, for: .normal)
                }
            }
            else {
                useBtn.backgroundColor = ColorSystem.gray
                useBtn.isUserInteractionEnabled = false
                useBtn.setTitle("promotionlist.use".localized, for: .normal)
            }
        }
        */
    }
    
    
}
