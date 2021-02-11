//
//  DetailViewController.swift
//  ContactBook
//
//  Created by  Yeskendir Ayat on 11.02.2021.
//

import UIKit

class DetailViewController: UIViewController {
    var person:Person?=nil
    var removeContact:Int?
    
    @IBOutlet weak var nameSurenameLabel: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var CallButton: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="GoBack"{
            let mainVC = segue.destination as! ViewController
            mainVC.persons.remove(at: removeContact!)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        nameSurenameLabel.text=person?.name
        phoneNumber.text=person?.phoneNumber
        personImage.image=person?.image
        personImage.layer.cornerRadius=(personImage.frame.size.height/2)
        personImage.clipsToBounds=true
        personImage.layer.borderColor=UIColor.black.cgColor
        personImage.layer.borderWidth=2
    }

}
