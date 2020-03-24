//
//  RealmDishListViewController.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/18/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import AlamofireObjectMapper
import MJRefresh
import RealmSwift

class RealmDishListViewController: ViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    //mark property
    var presenter : RealmDishListPresenterProtocol?
    
    var dishs : Results<RealmDishModel>? {
        get {
            return presenter?.dishList
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //zzzz
        print ("GKDEBUG >> RealmDishListViewController >> viewDidLoad()")
        
        // Do any additional setup after loading the view.
        
        initView()
        
        //giao tiếp tiếp với presenter
        if let presenter = presenter {
        
            presenter.viewDidLoad()
        }
        
    }
    
    func initView(){
        //back button
        let backButton = UIBarButtonItem()
        backButton.title = ""
         self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        //title
         self.navigationItem.title = RealmDishListConfig.navigationTitle
    
        //tableview
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        //refresh header
        tableView.addRefreshHeader {
            [weak self] in
                //zzzz
            if let weakSelf = self, let presenter = weakSelf.presenter {
               //zzzz
                
                presenter.reloadData()
            }
            
        }
    }

    

}

extension RealmDishListViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 0
        return dishs!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? RealmDishListCell  else {
            fatalError("The dequeued cell is not an instance of DishCell.")
        }
        let dish = dishs![indexPath.row]
        //config cell
        cell.titleLabel.text = dish.title
        cell.shopNameLabel.text = dish.shopName
        
        Alamofire.request(dish.avatar!).responseImage { response in
            debugPrint(response)

            print(response.request)
            print(response.response)
            print(response.data)
            debugPrint(response.result)

            if case .success(let image) = response.result {
                print("image downloaded: \(image)")
                cell.avatarImage.image = UIImage(data: response.data!, scale: 1)
            }
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
         print("GKDEBUG >> thực hiện func tableView didSelectRowAt indexPath")
        let id : Int = dishs![indexPath.row].id
        if let vc = RealmDishDetailWireFrame.createRealmDishDetailViewController(id: id) {
            
             self.navigationController?.pushViewController(vc, animated: true)
        }
        
         //tiến hành chuyển sang view DishDetail
//         let code : String = "testonly"
//        let avatar : String = dishs![indexPath.row].avatar
//        let title : String = dishs![indexPath.row].title
//         let shopName : String = dishs[indexPath.row].shopName
           /*
         if let vc = DishDetailWireFrame.createDishDetailViewController(code: code, avatar: avatar, title: title, shopName: shopName) {
            
                //ssself.title  = "Back K"
                //self.navigationController?.pushViewController(vc, animated: true)
                self.navigationController?.pushViewController(vc, animated: true)
        }
            
        */
          
   }
    


}


extension RealmDishListViewController : RealmDishListViewControllerProtocol {
    func startReloading() {
        
        //zzzz
        print("GKDEBUG >> tableView.headerBeginRefreshing()")
        tableView.headerBeginRefreshing()
        
    }
     
    func endLoading() {
        //
        tableView.headerEndRefreshing()
    }
    
    func updateView() {
        //
        print ("GKDEBUG >> View >> updateView()")
        print ("GKDEBUG >> dish.count: \(dishs?.count)")
        tableView.reloadData()
        
        //
        endLoading()
    }
    
    func endLoadMore() {
        //
        
    }
    
        

}
