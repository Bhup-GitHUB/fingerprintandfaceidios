//
//  FingerPrintAuth.swift
//  DemoAuthFingerprintFaceID
//
//  Created by Akshay Kumar on 26/05/24.
//

import Foundation
import LocalAuthentication

class FingerprintAuth{
    
    static let share = FingerprintAuth()
    typealias FingerPrintCallBack = (( _ check: Bool, _ error: Error?)-> Void)
    
    func accessAuth(callback: @escaping FingerPrintCallBack){
        
        let manager = LAContext()
        
        let authMessage = "Authentication is needed to access App."
        
        var authError: NSError?
        
        if manager.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError){
            
            manager.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: authMessage) { (success, error) in
                
                if success{
                    
                    DispatchQueue.main.async {
                        
                        callback(true, nil)
                        
                        
                    }
                    
                }
                else if (error != nil){
                    
                    callback(false, error)
                    
                }
                else{
                    
                    callback(false, error)
                    
                }
            }
        }
    }
}
