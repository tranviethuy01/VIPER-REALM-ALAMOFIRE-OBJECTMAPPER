//
//  RealmDishDetailViewController.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/20/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class RealmDishDetailViewController: UIViewController {
    
    //property
    var presenter: RealmDishDetailPresenterProtocol?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var shopNameLabel: UILabel!
    var dish : RealmDishModel? {
        get {
            return presenter?.dish
        }
    }
    //func
    override func viewDidLoad() {
        super.viewDidLoad()

        //init
        initView()
            
            //giao tiếp tiếp với presenter
        if let presenter = presenter {
                presenter.viewDidLoad()
                
                //reloaddata
                presenter.reloadData()
            }
        }
        
    func initView(){
            //back button
            let backButton = UIBarButtonItem()
            backButton.title = ""
           self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
            //title
             self.navigationItem.title = RealmDishDetailConfig.navigationTitle
        
        }

}

extension RealmDishDetailViewController:  RealmDishDetailViewControllerProtocol{
    
    
    func startReloading() {
        //code
    }
    
    func endLoading() {
        //code
    }
    
    func updateView() {
        //code
        
        self.titleLabel.text = self.dish?.title
        self.shopNameLabel.text = self.dish?.shopName
        
        Alamofire.request(self.dish!.avatar!).responseImage { response in
            debugPrint(response)

            if case .success(let image) = response.result {
                
                self.imageView.image = UIImage(data:response.data!, scale: 1)
            }
        }
        
        
        
        
    }
    
    func endLoadMore() {
        //code
    }
    

}
