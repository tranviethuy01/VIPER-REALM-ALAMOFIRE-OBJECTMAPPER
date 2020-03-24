//
//  UIScrollView.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/23/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit
import MJRefresh

extension UIScrollView {
    func addRefreshHeader(_ refreshAction: @escaping ()->()) {
        
        //zzzz
        //hàm dùng để reload
        let headerForLoading = MJRefreshNormalHeader {
             refreshAction()
        }
        headerForLoading?.activityIndicatorViewStyle = .gray
        headerForLoading?.lastUpdatedTimeLabel.isHidden = true
        headerForLoading?.stateLabel.isHidden = true
        mj_header = headerForLoading
        
    }
    func addLoadMoreFooter(_ loadMoreAction: @escaping ()->()) {
        let footerForLoading = MJRefreshAutoNormalFooter {
            loadMoreAction()
        }
        footerForLoading!.isRefreshingTitleHidden = true
        footerForLoading!.activityIndicatorViewStyle = .gray
        footerForLoading!.stateLabel.isHidden = true
        mj_footer = footerForLoading
    }
    func headerBeginRefreshing() {
        mj_header.beginRefreshing()
    }
    func headerEndRefreshing() {
        mj_header.endRefreshing()
    }
    func footerBeginRefreshing() {
        mj_footer.beginRefreshing()
    }
    func footerEndRefreshing() {
        if let mj_footer = mj_footer {
            mj_footer.endRefreshingWithNoMoreData()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8, execute: {[weak self] in
                if let weakSelf = self, let mj_footer = weakSelf.mj_footer {
                    mj_footer.resetNoMoreData()
                }
            })
        }
    }
    func headerIsRefreshing() -> Bool{
        return mj_header.isRefreshing
    }
    func footerIsRefreshing() -> Bool {
        return mj_footer.isRefreshing
    }
}
