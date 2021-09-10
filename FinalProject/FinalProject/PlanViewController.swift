//
//  PlanViewController.swift
//  FinalProject
//
//  Created by  Yeskendir Ayat on 26.03.2021.
//

import UIKit

class PlanViewController: UIViewController {
    @IBOutlet weak var viewPlan: UIView!
    @IBOutlet weak var viewBudget: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewPlan.layer.cornerRadius = 10
        viewPlan.layer.shadowColor = UIColor.black.cgColor
        viewPlan.layer.shadowOpacity = 0.7
        viewPlan.layer.shadowOffset = .zero
        
        viewBudget.layer.cornerRadius = 10
        viewBudget.layer.shadowColor = UIColor.black.cgColor
        viewBudget.layer.shadowOpacity = 0.7
        viewBudget.layer.shadowOffset = .zero
        // Do any additional setup after loading the view.
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
