//
//  ViewController.swift
//  LoshipMerchant
//
//  Created by admin on 3/14/20.
//  Copyright © 2020 com.gizku.viper5. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    // MARK: - Properties
    var isFirstTimesAppeared: Bool = true
    private var viewIsLoaded: Bool = false
    private var initNavigationTitle: String = ""
    var isHaveLDTitleView: Bool = false
    var backBarButton: UIBarButtonItem?
    var isLoSupplyTitleView: Bool = false
    private var customBarTitleView: UIView!
    private var isAppeared: Bool = false
    internal var canReload = true
    internal var reloadBtnIsRotating: Bool = false
    //internal var customReloadView: CustomReloadBtnView!
    var isHaveReloadBtn: Bool = false
    override func viewDidLoad() {
        hidesBottomBarWhenPushed = true
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = initNavigationTitle
        
        // setup custom title view
//        if let customTitleView = ViewService.viewFrom("LMCustomTitleView") as? LMCustomTitleView {
//            customTitleView.isLoSupply = isLoSupplyTitleView
//            customBarTitleView = customTitleView
//        }
        navigationItem.hidesBackButton = true
        // setup back bar button
        addBackBtn()
        
        
//        if isHaveReloadBtn == true {
//            addReloadBarButton()
//        }
        //trackChangeOfReadyForOrderStatus()
        UserDefaults.standard.addObserver(self, forKeyPath: Constant.kLanguage, options: NSKeyValueObservingOptions.new, context: nil)
//        registerToShowLoginMessage()
//        registerChangeEateryId()
        viewIsLoaded = true
        
    }
    
    deinit {
        print ("Deinit: \(self.classForCoder)")
        
        if viewIsLoaded == true {
            NotificationCenter.default.removeObserver(self)
            UserDefaults.standard.removeObserver(self, forKeyPath: Constant.kReadyForOrderStatus)
            UserDefaults.standard.removeObserver(self, forKeyPath: Constant.kLanguage)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // check to show custom title view
//        if let tabBarController = tabBarController as? MainTabBarController {
//            tabBarController.relayoutTabBar()
//            
//        }
        
        
        if isHaveLDTitleView == false {
            navigationItem.title = initNavigationTitle
        }
        else {
            navigationItem.titleView = customBarTitleView
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        isAppeared = true
        
        if isFirstTimesAppeared == true {
            isFirstTimesAppeared = false
            firstTimesAppeared()
            
        }
        
    }
    
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        isAppeared = false
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        
//        if keyPath == Constant.kReadyForOrderStatus {
//            if let status = UserDefaults.standard.object(forKey: Constant.kReadyForOrderStatus) as? Bool, status == true {
//                orderStatusChangeToReady()
//            }
//            else {
//                orderStatusChangeToNotReady()
//            }
//        }
//        else if keyPath == Constant.kLanguage {
//            configDidChange()
//        }
        
        
    }
    
    func orderStatusChangeToReady() {
        
    }
    
    func orderStatusChangeToNotReady() {
        
    }
    
    // MARK: - Methods
    func configDidChange() {
    
    }
//
//    func trackChangeOfReadyForOrderStatus() {
//        UserDefaults.standard.addObserver(self, forKeyPath: Constant.kReadyForOrderStatus, options: NSKeyValueObservingOptions.new, context: nil)
//    }
    func addBackBtn() {
        if let navigationController = navigationController {
            let viewControllers = navigationController.viewControllers
            
            if let index = viewControllers.firstIndex(of: self), index > 0 {
                // add back button here
                backBarButton = UIBarButtonItem.init(image: UIImage.init(named: "lm_back_icon"), style: .plain, target: self, action: #selector(backBtn_TouchUpInside))
                navigationItem.leftBarButtonItem = backBarButton
            }
            else if let index = viewControllers.firstIndex(of: self), index == 0, let _ = navigationController.presentingViewController {
                backBarButton = UIBarButtonItem.init(title: "Đóng", style: .done, target: self, action: #selector(closeBtn_TouchUpInside))
                navigationItem.leftBarButtonItem = backBarButton
            }
        }
    }
    /**
     This function is called when first times application call viewDidAppear, after that, this func is not called anymore. If you want to use, override this, please put super.viewDidAppear(animated) in your ViewController-inherited controller's viewDidAppear function
     */
    func firstTimesAppeared() {
        
    }
    
    
    func registerKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidHide(_:)), name: UIResponder.keyboardDidHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillChangeFrame(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidChangeFrame(_:)), name: UIResponder.keyboardDidChangeFrameNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        
    }
    
    @objc func keyboardDidShow (_ notification: Notification) {
        
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        
    }
    @objc func keyboardDidHide( _ notification: Notification) {
        
    }
    @objc func keyboardWillChangeFrame( _ notification: Notification) {
        
    }
    @objc func keyboardDidChangeFrame( _ notification: Notification) {
        
    }
    /**
     Use this function to setNavigationTitle, so you don't need to set it in viewDidLoad, make you code cleaner. However. if you want to change navigation title during runtime, please set it manually
     */
    final func setNavigationTitle(_ title: String) {
        initNavigationTitle = title
    }
    
    @objc func closeBtn_TouchUpInside() {
        if let tabBarController = tabBarController {
            tabBarController.dismiss(animated: true, completion: nil)
        }
        else if let navigationController = navigationController {
            navigationController.dismiss(animated: true, completion: nil)
        }
        else {
            dismiss(animated: true, completion: nil)
        }
    }
    @objc func backBtn_TouchUpInside() {
        if let navigationController = navigationController {
            if navigationController.viewControllers.count > 1 {
                navigationController.popViewController(animated: true)
            }
            else {
                navigationController.dismiss(animated: true, completion: nil)
            }
        }
    
    }
    
//    func registerChangeEateryId() {
//        let nc = NotificationCenter.default // Note that default is now a property, not a method call
//        nc.addObserver(forName:Notification.Name(rawValue: CustomNotificationName.didChangeEateryId),
//                       object:nil, queue:nil) {[weak self] notification in
//                        if let weakSelf = self {
//                            weakSelf.didReceiveChangeEateryId()
//                        }
//        }
//    }
//
//    func registerToShowLoginMessage() {
//        let nc = NotificationCenter.default // Note that default is now a property, not a method call
//        nc.addObserver(forName:Notification.Name(rawValue: CustomNotificationName.showLogin),
//                       object:nil, queue:nil) {[weak self] notification in
//                        if let weakSelf = self {
//                            weakSelf.didReceiveLogoutMessage(notification)
//                        }
//        }
//    }
    
    
    func didReceiveChangeEateryId() {
        
    }
    
    func didReceiveLogoutMessage(_ notification: Notification) {
        if viewIsLoaded == true {
            NotificationCenter.default.removeObserver(self)
        }
    }
    func getIsAppearedState() -> Bool {
        return isAppeared
    }
    class func storyBoardId() -> String {
        return ""
    }
    class func storyBoardName() -> String {
        return ""
    }
    class func initWithStoryBoard() -> ViewController?{
        return ViewService.viewController(storyBoardId(), storyboardName: storyBoardName()) as? ViewController
    }
    
//    final func addReloadBarButton() {
//        if let customReloadBtnView = ViewService.viewFrom("CustomReloadBtnView") as? CustomReloadBtnView {
//            customReloadBtnView.delegate = self
//            let barButton = UIBarButtonItem.init(customView: customReloadBtnView)
//            navigationItem.rightBarButtonItem = barButton
//            customReloadView = customReloadBtnView
//        }
//    }
    func reloadBtnDidTap() {
        
    }
    
    class func viewName() -> String {
        return storyBoardId()
    }
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesBegan(touches, with: event)
//        CheatingCounterService.shared.getMotionSensor()
//    }
//    
//    final func momoPaymentAdapterViewDidReceiveToken(notif: NSNotification) {
//        let response:NSMutableDictionary = notif.object! as! NSMutableDictionary
//        let _statusStr = "\(response["status"] as! String)"
//        
//        if (_statusStr == "0"), let data = response["data"] as? String, let customerNumber = response["phonenumber"] as? String {
//            let currentOrderInfo = getMomoOrderInfo()
//            if let currentOrderInfo = currentOrderInfo as? NormalMomoTransferOrderInfo {
//                if currentOrderInfo.eateryId >= 0 && currentOrderInfo.superCategoryId >= 0 {
//                    var orderInfo: [String:Any] = [:]
//                    orderInfo["amount"] = currentOrderInfo.amount
//                    orderInfo["data"] = data
//                    orderInfo["customerNumber"] = customerNumber
//                    MomoPaymentService.shared.submitOrderToServer(momoStatusCode: _statusStr, eateryId: currentOrderInfo.eateryId, requestOrder: currentOrderInfo.requestOrder!, momoInfo: orderInfo, completion: didFinishMomoPaymnent(completedPackage:))
//                }
//                else {
//                    print("Cannot get valid momo order info")
//                    DispatchQueue.main.async {[weak self] in
//                        if let weakSelf = self {
//                            let momoPaymentInfo = MomoFinishPayment.init(isSuccess: false, momoStatusCode: _statusStr, errorPackage: nil, responsePackage: nil)
//                            weakSelf.didFinishMomoPaymnent(completedPackage: momoPaymentInfo)
//                        }
//                    }
//                }
//            }
//            
//        }
//        else{
//            print("RequestToken response:\n \(notif.object!) | Fail token. Please check input params or no number data")
//            DispatchQueue.main.async {[weak self] in
//                if let weakSelf = self {
//                    let momoPaymentInfo = MomoFinishPayment.init(isSuccess: false, momoStatusCode: _statusStr, errorPackage: nil, responsePackage: nil)
//                    weakSelf.didFinishMomoPaymnent(completedPackage: momoPaymentInfo)
//                }
//            }
//        }
//    }
//    
//    func getMomoOrderInfo() -> MomoTransferOrderInfo {
//        return MomoTransferOrderInfo()
//    }
//    func didFinishMomoPaymnent(completedPackage: MomoFinishPayment) {
//        
//    }
}
// MARK: - <#CustomReloadBtnViewDelegate#>
//extension ViewController: CustomReloadBtnViewDelegate {
//    func customReloadBtnViewDidTap(_ view: CustomReloadBtnView) {
//        reloadBtnDidTap()
//    }
//}

// MARK: - <#CAAnimationDelegate#>
extension ViewController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
//        if canReload == false {
//            customReloadView.rotate360Degrees(completionDelegate: self)
//        }
//        else {
//            reloadBtnIsRotating = false
//        }
    }
}
