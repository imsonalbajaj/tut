//
//  2.passData.swift
//  tut
//
//  Created by Sonal on 29/04/25.
//


import UIKit


//MARK: - 0. using raw
/*
 
class VC1: UIViewController {
    var bgColor = UIColor.cyan
    
    let btn :UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 100, width: 250, height: 40))
        button.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        button.setTitle("Go to VC2", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.clear.cgColor
        return button
    }()
    
    let blueBtn :UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 200, width: 250, height: 40))
        button.backgroundColor = UIColor.systemBlue
        button.setTitle("Go to VC2 with blue bg", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.clear.cgColor
        return button
    }()
    
    override func viewDidLoad() {
        self.view.backgroundColor = bgColor
        self.view.addSubview(btn)
        self.view.addSubview(blueBtn)
        btn.addTarget(self, action:#selector(btnAction), for: .touchUpInside)
        blueBtn.addTarget(self, action:#selector(blueBtnAction), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @objc func btnAction() {
        let vc2 = VC2()
        vc2.vc1 = self
        self.navigationController?.pushViewController(vc2, animated: true)
    }
    
    @objc func blueBtnAction() {
        let vc2 = VC2()
        vc2.bgColor = UIColor.systemBlue
        vc2.vc1 = self
        self.navigationController?.pushViewController(vc2, animated: true)
    }
}

class VC2: UIViewController {
    var bgColor = UIColor.cyan
    var vc1: VC1?
    
    let btn :UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 100, width: 250, height: 40))
        button.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        button.setTitle("back to VC1", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.clear.cgColor
        return button
    }()
    
    let pinkBtn :UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 200, width: 250, height: 40))
        button.backgroundColor = UIColor.systemPink
        button.setTitle("back to VC1 with pink color", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.clear.cgColor
        return button
    }()
    
    override func viewDidLoad() {
        self.view.backgroundColor = bgColor
        self.view.addSubview(btn)
        self.view.addSubview(pinkBtn)
        btn.addTarget(self, action:#selector(btnAction), for: .touchUpInside)
        pinkBtn.addTarget(self, action:#selector(pinkBtnAction), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @objc func btnAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func pinkBtnAction() {
        if let vc1 {
            vc1.bgColor = UIColor.systemPink
            vc1.view.backgroundColor = UIColor.systemPink
        }
        self.navigationController?.popViewController(animated: true)
    }
}
 
*/


//MARK: - 1. using closure
/*
class VC1: UIViewController {
    var bgColor = UIColor.cyan
    
    let btn :UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 100, width: 250, height: 40))
        button.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        button.setTitle("Go to VC2", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.clear.cgColor
        return button
    }()
    
    let blueBtn :UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 200, width: 250, height: 40))
        button.backgroundColor = UIColor.systemBlue
        button.setTitle("Go to VC2 with blue bg", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.clear.cgColor
        return button
    }()
    
    override func viewDidLoad() {
        self.view.backgroundColor = bgColor
        self.view.addSubview(btn)
        self.view.addSubview(blueBtn)
        btn.addTarget(self, action:#selector(btnAction), for: .touchUpInside)
        blueBtn.addTarget(self, action:#selector(blueBtnAction), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @objc func btnAction() {
        let vc2 = VC2()
        vc2.changeBgToPinkOnBack = { [weak self]  in
            guard let strongSelf = self else {return}
            strongSelf.bgColor = .systemPink
            strongSelf.view.backgroundColor = strongSelf.bgColor
        }
        self.navigationController?.pushViewController(vc2, animated: true)
    }
    
    @objc func blueBtnAction() {
        let vc2 = VC2()
        vc2.bgColor = UIColor.systemBlue
        vc2.changeBgToPinkOnBack = { [weak self]  in
            guard let strongSelf = self else {return}
            strongSelf.bgColor = .systemPink
            strongSelf.view.backgroundColor = strongSelf.bgColor
        }
        self.navigationController?.pushViewController(vc2, animated: true)
    }
}

class VC2: UIViewController {
    var bgColor = UIColor.cyan
    var changeBgToPinkOnBack: (() -> Void)?
    
    let btn :UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 100, width: 250, height: 40))
        button.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        button.setTitle("back to VC1", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.clear.cgColor
        return button
    }()
    
    let pinkBtn :UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 200, width: 250, height: 40))
        button.backgroundColor = UIColor.systemPink
        button.setTitle("back to VC1 with pink color", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.clear.cgColor
        return button
    }()
    
    override func viewDidLoad() {
        self.view.backgroundColor = bgColor
        self.view.addSubview(btn)
        self.view.addSubview(pinkBtn)
        btn.addTarget(self, action:#selector(btnAction), for: .touchUpInside)
        pinkBtn.addTarget(self, action:#selector(pinkBtnAction), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @objc func btnAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func pinkBtnAction() {
        self.changeBgToPinkOnBack?()
        self.navigationController?.popViewController(animated: true)
    }
}
*/


//MARK: - 2. using delegate
/*
protocol VC1protocol: AnyObject {
    func changeBgToPinkOnBack()
}

class VC1: UIViewController, VC1protocol {
    var bgColor = UIColor.cyan
    
    let btn :UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 100, width: 250, height: 40))
        button.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        button.setTitle("Go to VC2", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.clear.cgColor
        return button
    }()
    
    let blueBtn :UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 200, width: 250, height: 40))
        button.backgroundColor = UIColor.systemBlue
        button.setTitle("Go to VC2 with blue bg", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.clear.cgColor
        return button
    }()
    
    override func viewDidLoad() {
        self.view.backgroundColor = bgColor
        self.view.addSubview(btn)
        self.view.addSubview(blueBtn)
        btn.addTarget(self, action:#selector(btnAction), for: .touchUpInside)
        blueBtn.addTarget(self, action:#selector(blueBtnAction), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @objc func btnAction() {
        let vc2 = VC2()
        vc2.delegate = self
        self.navigationController?.pushViewController(vc2, animated: true)
    }
    
    @objc func blueBtnAction() {
        let vc2 = VC2()
        vc2.bgColor = UIColor.systemBlue
        vc2.delegate = self
        self.navigationController?.pushViewController(vc2, animated: true)
    }
    
    func changeBgToPinkOnBack() {
        bgColor = .systemPink
        view.backgroundColor = bgColor
    }
}

class VC2: UIViewController {
    var bgColor = UIColor.cyan
    weak var delegate: VC1protocol?
    
    let btn :UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 100, width: 250, height: 40))
        button.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        button.setTitle("back to VC1", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.clear.cgColor
        return button
    }()
    
    let pinkBtn :UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 200, width: 250, height: 40))
        button.backgroundColor = UIColor.systemPink
        button.setTitle("back to VC1 with pink color", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.clear.cgColor
        return button
    }()
    
    override func viewDidLoad() {
        self.view.backgroundColor = bgColor
        self.view.addSubview(btn)
        self.view.addSubview(pinkBtn)
        btn.addTarget(self, action:#selector(btnAction), for: .touchUpInside)
        pinkBtn.addTarget(self, action:#selector(pinkBtnAction), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @objc func btnAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func pinkBtnAction() {
        self.delegate?.changeBgToPinkOnBack()
        self.navigationController?.popViewController(animated: true)
    }
}
*/


//MARK: - 3. using Notification Center
extension Notification.Name {
    static let MakeBgPink = Notification.Name("MakeBgPink")
}

class VC1: UIViewController {
    var bgColor = UIColor.cyan
    
    let btn :UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 100, width: 250, height: 40))
        button.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        button.setTitle("Go to VC2", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.clear.cgColor
        return button
    }()
    
    let blueBtn :UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 200, width: 250, height: 40))
        button.backgroundColor = UIColor.systemBlue
        button.setTitle("Go to VC2 with blue bg", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.clear.cgColor
        return button
    }()
    
    override func viewDidLoad() {
        self.view.backgroundColor = bgColor
        self.view.addSubview(btn)
        self.view.addSubview(blueBtn)
        btn.addTarget(self, action:#selector(btnAction), for: .touchUpInside)
        blueBtn.addTarget(self, action:#selector(blueBtnAction), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changeBgToPinkOnBack),
                                               name: Notification.Name.MakeBgPink,
                                               object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func btnAction() {
        let vc2 = VC2()
        self.navigationController?.pushViewController(vc2, animated: true)
    }
    
    @objc func blueBtnAction() {
        let vc2 = VC2()
        vc2.bgColor = UIColor.systemBlue
        self.navigationController?.pushViewController(vc2, animated: true)
    }
    
    @objc func changeBgToPinkOnBack() {
        bgColor = .systemPink
        view.backgroundColor = bgColor
    }
}

class VC2: UIViewController {
    var bgColor = UIColor.cyan
    
    let btn :UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 100, width: 250, height: 40))
        button.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        button.setTitle("back to VC1", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.clear.cgColor
        return button
    }()
    
    let pinkBtn :UIButton = {
        let button = UIButton(frame: CGRect(x: 10, y: 200, width: 250, height: 40))
        button.backgroundColor = UIColor.systemPink
        button.setTitle("back to VC1 with pink color", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.clear.cgColor
        return button
    }()
    
    override func viewDidLoad() {
        self.view.backgroundColor = bgColor
        self.view.addSubview(btn)
        self.view.addSubview(pinkBtn)
        btn.addTarget(self, action:#selector(btnAction), for: .touchUpInside)
        pinkBtn.addTarget(self, action:#selector(pinkBtnAction), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @objc func btnAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func pinkBtnAction() {
        NotificationCenter.default.post(name: .MakeBgPink, object: nil, userInfo: nil)
        self.navigationController?.popViewController(animated: true)
    }
}
