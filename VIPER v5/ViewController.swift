//
//  ViewController.swift
//  VIPER v5
//
//  Created by admin on 3/14/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK PROPERTY
    
    @IBOutlet weak var btnViperDemo: UIButton!
    @IBOutlet weak var btnRealmDemo: UIButton!
    @IBOutlet weak var btnAlamofireDemo: UIButton!
    @IBOutlet weak var btnObjectMapper: UIButton!
    @IBOutlet weak var btnAutoLayout: UIButton!
    @IBOutlet weak var btnMQTTClient: UIButton!
    
    
    @IBOutlet weak var viewLifeCircleButton: UIButton!
    
    
    //MARK FUNCTION
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //
        initSubView()
        
    }

    
    func initSubView(){
        //init view here
        self.title = " iOS Practice"
        
        
        
       
        
    }
    
    func returnNil() -> [String]? {
        return nil
    }
    
    @IBAction func btnDoViperDemo(_ sender: Any) {
        //
        pushViperDemoScene()
        
    }
    
    
    @IBAction func btnDoRealmDemo(_ sender: Any) {
        pushRealmDemoScene()
    }
    
    @IBAction func btnDoAlamofireDemo(_ sender: Any) {
        pushAlamofireDemoScene()
        
    }
    
    
    @IBAction func btnDoObjectMapper(_ sender: Any) {
        
        pushObjectMapperScene()
        
    }
    
    
    @IBAction func bbtnDoAutoLayout(_ sender: Any) {
        
        pushAutoLayoutScene()
        
    }
    
    @IBAction func btnDoMQTTClient(_ sender: Any) {
        //
        pushMQTTClientScene()
    }
    
    @IBAction func viewLifeCircleButton(_ sender: Any) {
        
        pushViewLifeCircleScene()
        
    }
    
    
    /* viết các hàm tiến hành hiển thị view */
    func pushViperDemoScene(){
        //
        if let vc = DishListWireFrame.createDishListViewController(code: "caigido") {
        //push
            self.navigationController?.pushViewController(vc, animated: true)
        }
      
        
    }
    
    
    func pushRealmDemoScene() {
        
        //tiến hành hiển thị scene RealmDemo
        if let vc = RealmDishListWireFrame.createRealmDishListViewController(code: "caigido") {
        
            //ssself.title  = "Back K"
            self.navigationController?.pushViewController(vc, animated: true)
        }
     
    }
    
    func pushAlamofireDemoScene(){
        //show AlamofireDemo
        let storyboard = UIStoryboard(name: "AlamofireDishListStoryboard", bundle: nil)
         let vc = storyboard.instantiateViewController(withIdentifier: "AlamofireDishListStoryboardID")
         //self.present(controller, animated: true, completion:        nil)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func pushObjectMapperScene(){
        //
        let storyboard = UIStoryboard(name: "ObjectMapperDishListStoryboard", bundle: nil)
         let vc = storyboard.instantiateViewController(withIdentifier: "ObjectMapperDishListStoryboardID")
        self.navigationController?.pushViewController(vc, animated: true)
       
        
    }
    
    
    func pushAutoLayoutScene(){
        //
        let storyboard = UIStoryboard(name: "AutoLayoutDishListStoryboard", bundle: nil)
         let vc = storyboard.instantiateViewController(withIdentifier: "AutoLayoutDishListStoryboardID")
         //self.present(controller, animated: true, completion:        nil)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func pushMQTTClientScene() {
    
    
    }
    
    func pushViewLifeCircleScene(){
        //
        let storyboard = UIStoryboard(name: "ViewLifeCircle", bundle: nil)
         let vc = storyboard.instantiateViewController(withIdentifier: "ViewLifeCircleID")
         //self.present(controller, animated: true, completion:        nil)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    class func initWithStoryBoard() ->ViewController? {
    
        //checkmates
        return nil
    }
    

}

/* CHÚ Ý PHẦN CODE SAU DÙNG ĐỂ TIẾN HÀNH KHỞI TẠO VIEW CHO CHÚNG TA
 func pushPromotionDetail(code: String, builder: RequestOrderBuilder, from view: EateryDetailViewProtocol) {
 if let vc = PromotionDetailWireFrame.createPromotionDetailViewController(code: code, builder: builder, losendBuilder: nil), let view = view as? EateryDetailViewController, let navigationController = view.navigationController {
 navigationController.pushViewController(vc, animated: true)
 }
 }
 */

//
//class SecondViewController : UINavigationController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = .yellow
//    }
//
//}
