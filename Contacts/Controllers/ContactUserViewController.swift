//
//  ContactUserViewController.swift
//  Contacts
//
//  Created by Farid Qanbarov on 4/16/18.
//  Copyright © 2018 Farid Qanbarov. All rights reserved.
//

import UIKit

class ContactUserViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userMobile: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userNote: UILabel!
    
    var image: UIImage?
    var name: String?
    var mobile: String?
    var email: String?
    var note: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Info Card"
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        userImage.layer.cornerRadius = userImage.frame.size.width / 2
        userImage.clipsToBounds = true
        
        
        userImage.image = image
        userName.text = name
        userMobile.text = mobile
        userEmail.text = email
        userNote.text = note
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
