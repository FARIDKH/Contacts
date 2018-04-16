//
//  ContactsTableViewController.swift
//  Contacts
//
//  Created by Farid Qanbarov on 4/16/18.
//  Copyright © 2018 Farid Qanbarov. All rights reserved.
//

import UIKit


class ContactsTableViewController: UITableViewController, UINavigationControllerDelegate {

    
    
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
 
 
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
