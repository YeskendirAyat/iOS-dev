//
//  AddPersonViewController.swift
//  ContactBook
//
//  Created by  Yeskendir Ayat on 11.02.2021.
//

import UIKit

class AddPersonViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var picker: UIPickerView!
//    var newPersonName:String?
//    var newPersonPhoneNumber:String?
    var newPersonImage:UIImage?
//    var newPersonImage:String?
    var gender:String?
    let genders=["male","female"]
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource=self
        picker.delegate=self
//        self.newPersonName=nameTextField.text!
//        self.newPersonPhoneNumber=numberTextField.text!
//        self.newPersonImage=UIImage.init(named:self.!)!
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genders.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        self.gender=genders[row]
        return genders[row]
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="SaveContact"{
            let mainVC = segue.destination as! ViewController
            mainVC.persons.append(Person.init(nameTextField.text!,numberTextField.text!, UIImage.init(named:gender!)!))
            
            
//            mainVC.persons.append(Person.init(self.newPersonName!, self.newPersonPhoneNumber!,UIImage.init(named: "male")!))
        }
    }

}
