//
//  RegisterViewController.swift
//  CoreDataExample
//
//  Created by Muhammad Noman on 25/04/2023.
//

import UIKit

class RegisterViewController: UIViewController {
    
  
    //MARK: - Outlets
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    private let manager = DataBaseManager()
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


extension RegisterViewController {
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        
        guard let firstName = firstNameField.text, !firstName.isEmpty else {
            openAlert(message: "Please enter first name")
            return
        }
        
        
        guard let lastName = lastNameField.text, !lastName.isEmpty else {
            openAlert(message: "Please enter last name")
            return
        }
        
        guard let email = emailField.text, !email.isEmpty else {
            openAlert(message: "Please enter email")
            return
        }
        
        guard let password = passwordField.text, !password.isEmpty else {
            openAlert(message: "Please enter password")
            return
        }
        
        let user = UserModel(firstName: firstName, lastName: lastName, email: email, passwrod: password)
        
        manager.addUser(_user: user)
        navigationController?.popViewController(animated: true)
        
        
        
        func showAlert() {
            let alertController = UIAlertController(title: nil, message: "User added", preferredStyle: .alert)
            let okay = UIAlertAction(title: "Okay", style: .default)
            alertController.addAction(okay)
            present(alertController, animated: true)
        }
        
        
    }
    
}


extension RegisterViewController {

    func openAlert(message: String){
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okay = UIAlertAction(title: "Okay", style: .default)
        alertController.addAction(okay)
        present(alertController, animated: true)
    }

}

