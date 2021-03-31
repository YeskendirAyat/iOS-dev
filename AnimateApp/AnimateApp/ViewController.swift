//
//  ViewController.swift
//  AnimateApp
//
//  Created by  Yeskendir Ayat on 26.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var NextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        NextButton.layer.masksToBounds = true
        NextButton.layer.cornerRadius = 16
        self.NextButton.layer.borderWidth = 2
        self.NextButton.layer.borderColor = UIColor.white.cgColor
    }
    @IBAction func moveToTable(_ sender: Any) {
    }
    override func viewWillAppear(_ animated: Bool) {
        self.NextButton.alpha = 0
        var rt=CATransform3DTranslate(CATransform3DIdentity, -200, 0, 0)
        self.emailTextField.layer.transform=rt
        UIView.animate(withDuration: 1, animations: {self.emailTextField.layer.transform=CATransform3DIdentity})
        rt=CATransform3DTranslate(CATransform3DIdentity, 200, 0, 0)
        self.passwordTextField.layer.transform=rt
        UIView.animate(withDuration: 1, animations: {self.passwordTextField.layer.transform=CATransform3DIdentity})
        UIView.animate(withDuration: 0.5, delay: 0.8, options: .curveEaseOut, animations: {
                self.NextButton.alpha = 1
            }, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var rt=CATransform3DTranslate(CATransform3DIdentity, 0, 0, 0)
        
        self.emailTextField.layer.transform=rt
        UIView.animate(withDuration: 0.4, animations: {self.emailTextField.layer.transform=CATransform3DTranslate(CATransform3DIdentity, 200, 0, 0)},completion: {_ in
                        self.emailTextField.layer.transform=CATransform3DTranslate(CATransform3DIdentity, 0, 0, 0)})
        rt=CATransform3DTranslate(CATransform3DIdentity,0, 0, 0)
        self.passwordTextField.layer.transform=rt
        UIView.animate(withDuration: 0.4, animations: {self.passwordTextField.layer.transform=CATransform3DTranslate(CATransform3DIdentity, -200, 0, 0)},completion: {_ in
            self.passwordTextField.layer.transform=CATransform3DTranslate(CATransform3DIdentity, 0, 0, 0)
        })
    }

}

