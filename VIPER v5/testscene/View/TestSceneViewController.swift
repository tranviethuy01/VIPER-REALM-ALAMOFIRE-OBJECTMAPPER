//
//  ViewLifeCircleViewController.swift
//  VIPER v5
//
//  Created by Sole Lord on 4/8/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

class TestSceneViewController: UIViewController {

    
    
    @IBOutlet weak var viewLifeCircleLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSubView()
         print("ViewLifeCircle : chạy hàm viewDidLoad() ")
        // Do any additional setup after loading the view.
        checkViewStatusVariable()
    }
    
    func initSubView(){
        //back button
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        //title
        self.navigationItem.title = TestSceneConfig.navigationTitle
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         print("ViewLifeCircle : chạy hàm viewWillAppear ")
       checkViewStatusVariable()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //
        print("ViewLifeCircle : chạy hàm viewDidAppear() ")
        checkViewStatusVariable()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("ViewLifeCircle : chạy hàm viewWillDisappear() ")
        checkViewStatusVariable()
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewLifeCircle : chạy hàm viewDidDisappear() ")
        checkViewStatusVariable()
        
    }
    
    func checkViewStatusVariable() {
        print ("isBeingDismissed : \(isBeingDismissed)")
        print ("isBeingPresented : \(isBeingPresented)")
        print ("isMovingFromParent : \(isMovingFromParent)")
        print ("isMovingToParent : \(isMovingToParent)")
        
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
