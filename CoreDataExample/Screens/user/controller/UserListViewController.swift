//
//  UserListViewController.swift
//  CoreDataExample
//
//  Created by Muhammad Noman on 25/04/2023.
//

import UIKit

class UserListViewController: UIViewController {
    
    private var users: [UserEntity] = []
    private let manager = DataBaseManager()
    
    //MARK - Outlets
    @IBOutlet weak var userTableView: UITableView!
    
    
    
    @IBAction func addUserButtonTapped(_ sender: UIBarButtonItem) {
        
        guard let registerVC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController else { return }
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    
    
    
    
    //MARK - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        users = manager.fetchUsers()
        userTableView.reloadData()
    }
    
}


extension UserListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            return UITableViewCell()
        }
        
        let user = users[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = (user.firstName ?? "") + "" + (user.lastName ?? "")
        content.secondaryText = "Email \(user.email ?? "")"
        cell.contentConfiguration = content
        return cell
    }
    
    
    
}
