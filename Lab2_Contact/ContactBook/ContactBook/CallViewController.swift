//
//  CallViewController.swift
//  ContactBook
//
//  Created by  Yeskendir Ayat on 12.02.2021.
//

import UIKit

class CallViewController: UIViewController {
    @IBOutlet var CallViewCOntroller: UIView!
    @IBOutlet weak var NumberLabel: UILabel!
    var number:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NumberLabel.text=number
        // Do any additional setup after loading the view.
    }
    
    @IBAction func endCall(_ sender: Any) {
        navigationController?.popViewController(animated: false)
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
