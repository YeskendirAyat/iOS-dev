//
//  HomeVC.swift
//  FinalProject
//
//  Created by  Yeskendir Ayat on 25.03.2021.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var cashView: UIView!
    @IBOutlet weak var TableView: UIView!
    
    @IBOutlet weak var costTable: UITableView!
    var costs:[Cost] = [Cost(name: "Phone", total: "400.000,00"),Cost(name: "Pen", total: "50,00"),Cost(name: "Phone", total: "400.00"),Cost(name: "Phone", total: "400.00,00")]
    override func viewDidLoad() {
        super.viewDidLoad()
        cashView.layer.cornerRadius = 10
        cashView.layer.shadowColor = UIColor.black.cgColor
        cashView.layer.shadowOpacity = 0.7
        cashView.layer.shadowOffset = .zero
        TableView.layer.cornerRadius = 4
        TableView.layer.shadowColor = UIColor.black.cgColor
        TableView.layer.shadowOpacity = 0.7
        TableView.layer.shadowOffset = .zero
        TableView.layer.shadowRadius = 4
        
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
extension HomeVC: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        costs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = costTable.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text=costs[indexPath.row].name
        cell.detailTextLabel?.text = costs[indexPath.row].total+" tg"
        return cell    }
}
class Cost{
    var name:String
    var total:String
    init(name:String,total:String) {
        self.name = name
        self.total = total
    }
}
