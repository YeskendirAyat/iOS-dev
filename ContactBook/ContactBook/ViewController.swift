//
//  ViewController.swift
//  ContactBook
//
//  Created by  Yeskendir Ayat on 10.02.2021.
//

import UIKit
// Navigation View Controller это контейнер для View Contreoller
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var mainViewTable: UITableView!
    var persons = [Person.init("AAA","111",UIImage.init(named: "male")!),
                   Person.init("BBB", "222", UIImage.init(named: "female")!),
                   Person.init("CCC", "333", UIImage.init(named: "male")!),
                   Person.init("DDD", "444", UIImage.init(named: "female")!),
                   Person.init("EEE", "555", UIImage.init(named: "male")!),
                   Person.init("FFF", "666", UIImage.init(named: "female")!),
                    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewTable.reloadData()
//        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    // удаление
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            persons.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell") as? CustomCell //convergen from another data type to this
        cell?.personName.text=persons[indexPath.row].name
        cell?.personPhoneNumber.text=persons[indexPath.row].phoneNumber
        cell?.personImageView.image=persons[indexPath.row].image
        return cell!
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="AddContactSegue" {
            _=segue.destination as! AddPersonViewController
        }
        else if segue.identifier=="MoveToContact"{
            let distination=segue.destination as! DetailViewController
            let person = persons[mainViewTable.indexPathForSelectedRow!.row]
            distination.person=person
            distination.removeContact=mainViewTable.indexPathForSelectedRow!.row
        }
    }
    @IBAction func unwindToPage(_ unwindSegue: UIStoryboardSegue) {
        mainViewTable.reloadData()
//        let vc=unwindSegue.source as? AddPersonViewController
//        persons.append(Person.init(vc?.newPersonName, vc?.newPersonPhoneNumber, UI))
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mainViewTable.deselectRow(at: indexPath, animated: true)
    }

}
