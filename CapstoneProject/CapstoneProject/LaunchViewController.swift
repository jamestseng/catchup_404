//
//  LaunchViewController.swift
//  CapstoneProject
//
//  Created by Nikkan Ghosh on 3/1/18.
//  Copyright © 2018 Eshita Mathur. All rights reserved.
//

import UIKit
import FacebookLogin

class LaunchViewController: UIViewController, LoginButtonDelegate {

    private weak var facebookLoginButton: LoginButton? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Add the Facebook login button
        let loginButton = LoginButton(readPermissions: [ .publicProfile, .email, .userFriends ])
        let newCenter = CGPoint(x:self.view.frame.size.width / 2, y:self.view.frame.size.height - 70);
        loginButton.center = newCenter
        // WARNING!: Facebook login button delegate property is defined currently as STRONG.
        // Therefore, it must be set to nil before leaving the view to avoid reference cycles
        loginButton.delegate = self
        view.addSubview(loginButton)
        // Store the login button as a weak reference, since it is holded by the main view with a
        // strong reference
        facebookLoginButton = loginButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func willMove(toParentViewController parent: UIViewController?) {
        super.willMove(toParentViewController:parent)
        if parent == nil {
            // The back button was pressed, interactive gesture used, or programatically pop view
            // was executed
            // Do not forget to set delegate in Facebook button to nil to break reference cycle.
            facebookLoginButton?.delegate = nil
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
        
        switch result {
            case .failed(let error):
            // Action on failed
                break
            case .cancelled:
            // Action on cancelled
                break
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                // Action on success
                performSegue(withIdentifier: "LoginSegue", sender: nil)
                break
            }
    }
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        
        // Action on logout
    }
    
}
