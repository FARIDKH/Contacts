//
//  ContactsTableViewController.swift
//  Contacts
//
//  Created by Farid Qanbarov on 4/16/18.
//  Copyright © 2018 Farid Qanbarov. All rights reserved.
//

import UIKit


class ContactsTableViewController: UITableViewController, UINavigationControllerDelegate {

    var selectedUser : Dictionary<String,String>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return Data.recentContacts.count
        case 1:
            return Data.fullContacts.count
        default :
            return 1
        }
    }

    
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        switch section {
//        case 0:
//            return "Recent"
//        case 1 :
//            return "Friends"
//        default:
//            return "Friends"
//        }
//    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor(displayP3Red: 227/255, green: 227/255, blue: 227/255, alpha: 85)
        let label : UILabel = UILabel()
        label.textColor = UIColor(displayP3Red: 139/255, green: 87/255, blue: 42/255, alpha: 85)
        label.translatesAutoresizingMaskIntoConstraints = false
        switch section {
        case 0:
            label.text = "RECENT"
        case 1:
            label.text = "FRIENDS"
        default:
            label.text = "FRIENDS"
        }
        label.font = UIFont.systemFont(ofSize: 13)
        view.addSubview(label)
        NSLayoutConstraint.activate([
                label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
                label.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Contact Cell", for: indexPath) as! ContactTableViewCell
        cell.userImage.layer.cornerRadius = cell.userImage.frame.size.width / 2
        cell.userImage.clipsToBounds = true
        switch indexPath.section {
        case 0:
            if let image = Data.recentContacts[indexPath.row]["avatar"] {
                cell.userImage?.image = UIImage(named: image)
            }
            cell.userName?.text = Data.recentContacts[indexPath.row]["name"]
        case 1:
            if let image = Data.fullContacts[indexPath.row]["avatar"] {
                cell.userImage?.image = UIImage(named: image)
            }
            cell.userName?.text = Data.fullContacts[indexPath.row]["name"]
        default:
            print("---")
        }
        return cell
    }

    // MARK: - Navigation

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToSpecificUser", sender: self)
    }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSpecificUser" {
            var destionationVC = segue.destination
            if let navigationVC = destionationVC as? UINavigationController {
                destionationVC = navigationVC.visibleViewController ?? destionationVC
            }
            if let userContactVC = destionationVC as? ContactUserViewController,
                let section = tableView.indexPathForSelectedRow?.section,
                let row = tableView.indexPathForSelectedRow?.row {
                var user : [String : String]?
                switch section {
                case 0:
                    user = Data.recentContacts[row]
                case 1:
                    user = Data.fullContacts[row]
                default :
                    user = Data.fullContacts[row]
                }
//                "name" : "Keith Harsen",
//                "avatar" : "pic",
//                "mobile"  : "123-12312-3",
//                "email" : "keith@gmail.com",
//                "notes" : "keith ozun tanimir"
                if let userValue = user {
                    if let name = userValue["name"], let email = userValue["email"] {
                        
                        userContactVC.name = name
                        userContactVC.email = email
                        userContactVC.image = UIImage(named: userValue["avatar"] ?? "Default Profile Image")
                        userContactVC.mobile = userValue["mobile"] ?? "User didn't write his mobile"
                        userContactVC.note = userValue["notes"] ?? "User didn't write any note"
                    }
                    
                }
            }
        }
        
    }
    

}
