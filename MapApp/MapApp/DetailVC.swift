//
//  DetailVC.swift
//  MapApp
//
//  Created by  Yeskendir Ayat on 22.03.2021.
//

import UIKit
import MapKit
class DetailVC: UIViewController {
    var annotation:MKAnnotation?
    var delegate:Changeble?
    var indexOfAnnotation:Int?
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        firstTextField.text=annotation?.title!
        secondTextField.text=annotation?.subtitle!
    }
    @IBAction func DoneButton(_ sender: Any) {
//        delegate?.Change(oldAnnotation: annotation!, newAnnotation: myAnnotation(title: firstTextField.text!, subtitle: secondTextField.text!, coordinate: annotation!.coordinate))
        delegate?.change(index: indexOfAnnotation!, title: firstTextField.text!, subtitle: secondTextField.text!)
        CancelButton(0)
    }
    @IBAction func CancelButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
