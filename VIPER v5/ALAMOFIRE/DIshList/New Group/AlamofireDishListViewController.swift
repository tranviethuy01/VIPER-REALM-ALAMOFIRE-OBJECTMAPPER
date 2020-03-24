//
//  AlamofireDishListViewController.swift
//  VIPER v5
//
//  Created by Sole Lord on 3/18/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

class AlamofireDishListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        initSubView()
    }
    func initSubView(){
    //back button
    let backButton = UIBarButtonItem()
    backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    //title
        self.navigationItem.title = AlarmofireDishListConfig.navigationTitle
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
