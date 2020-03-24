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
    
    
    
    
    /* viết các hàm tiến hành hiển thị view */
    func pushViperDemoScene(){
        
        
        //chúng ta bắt đầu khởi tạo từ WireFrame
        if let vc = DishListWireFrame.createDishListViewController(code: "caigido") {
        
            //ssself.title  = "Back K"
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    /*
    let storyboard = UIStoryboard(name: "ViperDishListStoryboard", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "ViperDishListStoryboardID")
    //self.present(controller, animated: true, completion:        nil)
   
        
        
    let nav = self.navigationController
    
    nav?.pushViewController(vc, animated: true)
        //self.navigationController?.pushViewController(vc, animated: true)
    */
        
        
    }
    func pushViperDemoScene_2() {
        print("Bắt đầu khởi tạo ViperDemoScene")
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let resultViewController = storyBoard.instantiateViewController(withIdentifier: "ViperDishListStoryboard") as! DishListViewController
        //self.navigationController?.pushViewController(resultViewController, animated: true)
        
    
    }
    func pushViperDemoScene_old(){
        
        print("Bắt đầu khởi tạo ViperDemoScene")
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "ViperDishListStoryboard", bundle: nil)
        let vc = DishListViewController()
        //tại đây vẫn chưa có chuyện gì xảy ra nhé
        //chúng ta chỉ tạo thôi xem sao nhé
        
        //tiến hành pushView
    self.navigationController?.pushViewController(vc, animated: false)
        
        //tại đây chúng ta tiến hành khởi tạo
        
       // let navigationController = view.naviganationController
        
        //let objVC : SecondViewController? = storyboard?.instantiateViewController(withIdentifier: <#T##String#>)
        //let objVC : SecondViewController? = SecondViewController()
        //print (objVC)
        //add to rootView
        /*
        let objectNavi = UINavigationController(rootViewController: objVC!)
        print(objectNavi)
        */
        
        
        
        //present
        //self.present(objectNavi, animated: true)
        
        
        
        
        
        //tiến hành hiển thị scene ViperDemo
        /*
        if let vc = ViewController , let navigationController =  {
        
         navigationController?.pushViewController(vc, animated: true)
        }
         */
    
    }
    
    func pushRealmDemoScene() {
    //tiến hành hiển thị scene RealmDemo
    print("Bắt đầu khởi tạo RealmDemoScene")
        
    if let vc = RealmDishListWireFrame.createRealmDishListViewController(code: "caigido") {
    
        //ssself.title  = "Back K"
    self.navigationController?.pushViewController(vc, animated: true)
    }
        
    /*
        let storyboard = UIStoryboard(name: "RealmDishListStoryboard", bundle: nil)
         let vc = storyboard.instantiateViewController(withIdentifier: "RealmDishListStoryboardID")
         //self.present(controller, animated: true, completion:        nil)
        self.navigationController?.pushViewController(vc, animated: true)
 
    */
        /*
         let nav = self.navigationController
         
         nav?.pushViewController(vc, animated: true)
        */
       /*
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        print ("GKDEBUG >> storyBoard: \(storyBoard)")
        
        print ("GKDEBUG >> self \(self.navigationController)")
        let realmView = RealmDishListViewController()
        
        print ("GKDEBUG >> realmView \(realmView)")
        
        //tiến hành navigate
        self.navigationController?.pushViewController(realmView, animated: true)
        
        */
        /*
         
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "RealmDishListStoryboard", bundle: nil)
        
        print ("GKDEBUG >> storyBoard: \(storyBoard)")
        
        let vc = storyBoard.instantiateViewController(withIdentifier: "RealmDishListViewController") as! RealmDishListViewController
        
       print ("GKDEBUG >> vc: \(vc)")
        self.navigationController?.pushViewController(vc, animated: true )
        /*
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "RealmDishListStoryboard") as! NewViewController
       
    self.navigationController?.pushViewController
 (newViewController, animated: true)
        
        */
 

 */
        
    }
    
    func pushAlamofireDemoScene(){
    //tiến hành hiển thị scene AlamofireDemo
    print("Bắt đầu khởi tạo AlamofireDemoScene")
    
        let storyboard = UIStoryboard(name: "AlamofireDishListStoryboard", bundle: nil)
         let vc = storyboard.instantiateViewController(withIdentifier: "AlamofireDishListStoryboardID")
         //self.present(controller, animated: true, completion:        nil)
        self.navigationController?.pushViewController(vc, animated: true)
        
        /*
        let storyBoard : UIStoryboard = UIStoryboard(name: "AlamofireDishListStoryboard", bundle: nil)
        let vc = AlamofireDishListViewController()
        //tiến hành push
        self.navigationController?.pushViewController(vc, animated: true)
        */
    }
    
    func pushObjectMapperScene(){
    //tiến hành hiển thị Scene Object Mapper
    print("Bắt đầu khởi tạo ObjectMapperDemoScene")
        
        let storyboard = UIStoryboard(name: "ObjectMapperDishListStoryboard", bundle: nil)
         let vc = storyboard.instantiateViewController(withIdentifier: "ObjectMapperDishListStoryboardID")
         //self.present(controller, animated: true, completion:        nil)
        self.navigationController?.pushViewController(vc, animated: true)
        
        
        /*
        let storyBoard : UIStoryboard = UIStoryboard(name: "ObjectMapperDishListViewController", bundle: nil)
        let vc = ObjectMapperDishListViewController()
        
        //push
        self.navigationController?.pushViewController(vc, animated: true)
        */
        
    }
    
    
    func pushAutoLayoutScene(){
        //tiến hành hiển thị Scene Auto Layout
    print("Bắt đầu khởi tạo AutoLayoutDemoScene")
        let storyboard = UIStoryboard(name: "AutoLayoutDishListStoryboard", bundle: nil)
         let vc = storyboard.instantiateViewController(withIdentifier: "AutoLayoutDishListStoryboardID")
         //self.present(controller, animated: true, completion:        nil)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    class func initWithStoryBoard() ->ViewController? {
    
        //checkmates
        return nil
    }
    
    /*
    class func initWithStoryBoard() -> ViewController?{
        return ViewService.viewController(storyBoardId(), storyboardName: storyBoardName()) as? ViewController
    }
    */

}

/* CHÚ Ý PHẦN CODE SAU DÙNG ĐỂ TIẾN HÀNH KHỞI TẠO VIEW CHO CHÚNG TA
 func pushPromotionDetail(code: String, builder: RequestOrderBuilder, from view: EateryDetailViewProtocol) {
 if let vc = PromotionDetailWireFrame.createPromotionDetailViewController(code: code, builder: builder, losendBuilder: nil), let view = view as? EateryDetailViewController, let navigationController = view.navigationController {
 navigationController.pushViewController(vc, animated: true)
 }
 }
 */


class SecondViewController : UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
    }


}
