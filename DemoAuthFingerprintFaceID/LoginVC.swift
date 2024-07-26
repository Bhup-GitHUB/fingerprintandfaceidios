//
//  LoginVC.swift
//  DemoAuthFingerprintFaceID
//
//  Created by Akshay Kumar on 26/05/24.
//

import UIKit

class LoginVC: UIViewController {

    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnFingerPrintTappedAction(_ sender: UIButton) {
        FingerprintAuth.share.accessAuth { (success, error) in
            if success {
                guard let vc = self.storyboard?.instantiateViewController(identifier: "SucessVC") as? SucessVC else {
                    return
                }
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
