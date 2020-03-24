//
//  DishDetailViewController.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/19/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage


class DishDetailViewController: UIViewController {

    //mark property
    
    var presenter : DishDetailPresenterProtocol?
    
    var code : String? {
        get {
            return presenter?.code
        }
    
    }
    
    var avatar : String? {
        get {
            return presenter?.avatar
        }
    
    }
    var dishTitle : String? {
        get {
            return presenter?.title
        }
        
    }
    
    var shopName : String? {
        get {
        
            return presenter?.shopName
        }
    }
    
    @IBOutlet weak var avatarImageView: UIImageView!
        
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var shopNameLabel: UILabel!
    
    
    
    //mark func
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        initView()
        
        //gọi đến presenter
        if let presenter = presenter {
            presenter.viewDidLoad()
        }
        
    }
    
    func initView() {
    
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
//        self.navigationController?.title = ViperDishDetailConfig().getNavigationTitle()
        self.navigationItem.title = ViperDishDetailConfig.navigationTitle
        print ("GKDEBUG >> ViperDishDetailConfig().getNavigationTitle() \(ViperDishDetailConfig.navigationTitle)")
                
        
    }

    

}

extension DishDetailViewController : DishDetailViewControllerProtocol {
    
    
    
    func startReloading() {
        //do sth
    }
    
    func endLoading() {
        //do sth
    }
    
    func updateView() {
        //do sth
        
        titleLabel.text = self.dishTitle
        shopNameLabel.text = self.shopName
        //request
        Alamofire.request(self.avatar!).responseImage { response in
            debugPrint(response)

            if case .success(let image) = response.result {
                print("image downloaded: \(image)")
                self.avatarImageView.image = UIImage(data: response.data!, scale: 1)
            }
        }
        
        
    }
    
    func endLoadMore() {
        //do sth
    }
    

}
