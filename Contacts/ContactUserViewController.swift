//
//  ContactUserViewController.swift
//  Contacts
//
//  Created by Farid Qanbarov on 4/16/18.
//  Copyright © 2018 Farid Qanbarov. All rights reserved.
//

import UIKit

class ContactUserViewController: UIViewController {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userMobile: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userNote: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
