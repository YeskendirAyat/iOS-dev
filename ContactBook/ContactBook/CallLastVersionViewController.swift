//
//  CallLastVersionViewController.swift
//  ContactBook
//
//  Created by  Yeskendir Ayat on 12.02.2021.
//

import UIKit

class CallLastVersionViewController: UIViewController {
    @IBOutlet var CallView: UIView!
    @IBOutlet weak var number: UILabel!
    var person:Person?
    override func viewDidLoad() {
        super.viewDidLoad()
        number.text=person?.phoneNumber
        // Do any additional setup after loading the view.
    }
    
    @IBAction func endCall(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
