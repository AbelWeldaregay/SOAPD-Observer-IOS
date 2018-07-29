//
//  ViewController.swift
//  soapdObserver
//
//  Created by Abel Weldareguy on 5/18/18.
//  Copyright © 2018 Abel Weldaregay. All rights reserved.
//

import UIKit
import Alamofire

var correctName: String = ""
var userRole: String = ""
var userDescription: String = ""

class ViewController: UIViewController {

    @IBOutlet weak var nameInput: UITextField!
  
    @IBOutlet weak var passwordInput: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var registerButton: UIButton!
    
    //var correctName: String = ""
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "SOAPD Observer"
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Log-Out", style: .plain, target: nil, action: nil)
        //UINavigationBar.appearance().titleTextAttributes
        // Do any additional setup after loading the view, typically from a nib.
        
        //setting the shape of the buttons
        loginButton.layer.cornerRadius = 8.0
        registerButton.layer.cornerRadius = 8.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        var LoggedIn = segue.destination as! LoggedIn
//
//        LoggedIn.LoggedInUser = self.correctName
//
//    }
    
    func displayAlertMessage(message: String) {
        let alertMsg = UIAlertController(title:"Alert", message: message,
                                         preferredStyle:UIAlertControllerStyle.alert);
        
        let confirmAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil );
        alertMsg.addAction(confirmAction)
        present(alertMsg, animated:true, completion: nil)
    }
    
    func redirecttoLoggedInView(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyBoard.instantiateViewController(withIdentifier: "LoggedIn") as! LoggedIn
         self.navigationController?.pushViewController(secondVC, animated: true)
    }
 
    @IBAction func LoginPressed(_ sender: UIButton) {
        
        let usernameField = nameInput.text!
        let passwordField = passwordInput.text!
        
        if((usernameField.isEmpty) || (passwordField.isEmpty))
        {
            self.displayAlertMessage(message: "All fields required.")
            
            return
            
        }
        
        Alamofire.request("http://qav2.cs.odu.edu/abel/SOPDobserverScripts/checkLogin/retriveUsers.php?username=\(usernameField)&password=\(passwordField)").responseJSON{ response in
            print (response)
            
            if let userJson = response.result.value {
                
                let userObject:Dictionary = userJson as! Dictionary<String, Any>
                
                correctName = userObject["name"] as! String
                userRole = userObject["role"] as! String
                userDescription = userObject["description"] as! String
                
                self.redirecttoLoggedInView()
                //self.performSegue(withIdentifier: "Segue", sender: self)
               
             
            }
            else {
                self.displayAlertMessage(message: "Wrong Credentials, Please try again.")
                return
            }
            
           
            
        }
       
                
        }
    
    

}

