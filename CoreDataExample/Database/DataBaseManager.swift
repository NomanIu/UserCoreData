//
//  DataBaseManager.swift
//  CoreDataExample
//
//  Created by Muhammad Noman on 25/04/2023.
//

import UIKit
import CoreData




class DataBaseManager {
    
    private var context: NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    
    func addUser(_user: UserModel) {
        let userEntity = UserEntity(context: context)
        userEntity.firstName = _user.firstName
        userEntity.lastName =  _user.lastName
        userEntity.email =  _user.email
        userEntity.password =  _user.passwrod
        
        do {
            try context.save()
        }
        catch {
            print("User saving error: ",error)
        }
    }
    
    
    func fetchUsers() -> [UserEntity] {
        var users: [UserEntity] = []
        
        do {
           users = try context.fetch(UserEntity.fetchRequest())
        }
        
        catch {
            print("FetchUsers: ",error)
        }
        
        return users
        
    }
    
}
