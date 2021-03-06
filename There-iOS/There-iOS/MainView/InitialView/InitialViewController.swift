//
//  LoginViewController.swift
//  There-iOS
//
//  Created by 양채연 on 2022/07/26.
//

import UIKit
import Then
import SnapKit

class InitialViewController: UIViewController {

    // MARK: - Init
    convenience init(bgColor: UIColor) {
        self.init()
        self.view.backgroundColor = bgColor
    title = "push & pop"
    }
    
    
    private let loginBtn = CustomButton(text: "로그인", bgColor: UIColor.rgb(red: 0, green: 0, blue: 0), titleColor: UIColor.rgb(red: 255, green: 255, blue: 255))
    private let signUpBtn = CustomButton(text: "회원가입", bgColor: UIColor.rgb(red: 255, green: 255, blue: 255), titleColor: UIColor.black)
    
    
    // MARK: - Function
    
    @objc
    private func pushVC() {
        let login = LoginViewController(bgColor: UIColor.white)
        
        navigationController?.pushViewController(login, animated: false)
    }
    
//
//    @objc
//    func buttonClicked(_ sender: CustomButton?) {
//        if sender == loginBtn {
//            let loginView = LoginViewController(bgColor: UIColor.yellow)
////            loginView.modalPresentationStyle = .fullScreen
//            self.navigationController?.pushViewController(loginView, animated: true)
//        }else {
//            let signUpView = SignUpViewController(bgColor: UIColor.white)
//            signUpView.modalPresentationStyle = .fullScreen
//            self.present(signUpView, animated: false, completion: nil)
//        }
//    }

    //          이전 화면 돌아가는 버튼 클릭시 실행
//    func popViewController(animated: Bool) -> UIViewController?{}
            
    func setLayout() {
//        loginBtn.then {
//            $0.translatesAutoresizingMaskIntoConstraints = false
//        }
        loginBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loginBtn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 100).isActive = true
        
        signUpBtn.snp.makeConstraints {
            $0.top.equalTo(loginBtn.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(loginBtn)
        self.view.addSubview(signUpBtn)
        setLayout()
        
        loginBtn.addTarget(self, action: #selector(pushVC), for: .touchUpInside)
        signUpBtn.addTarget(self, action: #selector(pushVC), for: .touchUpInside)
        
    }

}

