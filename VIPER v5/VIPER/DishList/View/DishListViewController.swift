//
//  DishListViewController.swift
//  VIPER v5
//
//  Created by admin on 3/14/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit
import RealmSwift
import Alamofire
import AlamofireImage


class DishListViewController: ViewController {
    
    //mark property
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var presenter : DishListPresenterProtocol?
    
    var dishs : [Dish]! {
        get {
            return presenter?.dishList
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        initView()
        
        //tiến hành gọi presenter ra xử lý
        if let presenter = presenter {
            presenter.viewDidLoad()
        }
        
    }
    
    func initView(){
    
        //setup
        
        //back button
        let backButton = UIBarButtonItem()
        backButton.title = ""
    self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        //title
        self.navigationItem.title = DishListConfig.navigationTitle
      
        
        //delegate
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
        
        // một số thuộc tính khác
        
    }
    
    
    func getView () -> DishListViewController? {
    
        return self
    }
    

}

extension DishListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("GKDEBUG >> thực hiện func tableView UITableViewCell")
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DishCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        
        let dish = dishs[indexPath.row]
        
        
        //cell
        cell.titleLabel.text = dish.title
        cell.shopNameLabel.text = dish.shopName
        
        Alamofire.request(dish.avatar!).responseImage { response in
            debugPrint(response)


            if case .success(let image) = response.result {
                print("image downloaded: \(image)")
                cell.avatarImage.image = UIImage(data: response.data!, scale: 1)
            }
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         print("GKDEBUG >> thực hiện func tableView didSelectRowAt indexPath")
        
        //tiến hành chuyển sang view DishDetail
        let code : String = "testonly"
        let avatar : String = dishs[indexPath.row].avatar
        let title : String = dishs[indexPath.row].title
        let shopName : String = dishs[indexPath.row].shopName
        
        if let vc = DishDetailWireFrame.createDishDetailViewController(code: code, avatar: avatar, title: title, shopName: shopName) {
            
            //push
        self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
        
    }
    
    
    
}

extension DishListViewController : DishListViewControllerProtocol {
    func showDish(with dishs: [Dish]) {
        //do sth
    }
    
    func showDishs(with dishs: [Dish]) {
        //do sth
    }
    
    func endLoadMore() {
        //do sth
    }
    

    func startReloading() {
        //tableView.headerBeginRefreshing()
        //
        tableView.reloadData()
    }
    
    func endLoading() {
        //tableView.headerEndRefreshing()
    }
    
    func updateView() {
        //
        tableView.reloadData()
    }
}
