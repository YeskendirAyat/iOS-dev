//
//  PhonesTVC.swift
//  AnimateApp
//
//  Created by  Yeskendir Ayat on 26.03.2021.
//

import UIKit

class Phone{
    let name:String
    let price:String
    var description:String
    var camera:String
    init(name:String,price:String,description:String,camera:String) {
        self.name=name
        self.price=price
        self.description=description
        self.camera=camera
    }
}

class PhonesTVC: UITableViewController {
    var phones:[Phone] = [
        Phone(name: "iPhone 12", price: "1000$", description: "Snapdragon 888", camera: "12MPX"),
        Phone(name: "iPhone 12 pro", price: "1200$", description: "Snapdragon 888", camera: "12MPX"),
        Phone(name: "iPhone 12 pro Max", price: "1500$", description: "Snapdragon 888", camera: "12MPX"),
        Phone(name: "iPhone 12 mini", price: "900$", description: "Snapdragon 888", camera: "12MPX"),
        Phone(name: "iPhone 11", price: "800$", description: "Snapdragon 888", camera: "12MPX"),
        Phone(name: "iPhone XR", price: "700$", description: "Snapdragon 888", camera: "12MPX"),
        Phone(name: "iPhone  X", price: "650$", description: "Snapdragon 888", camera: "12MPX")]
    override func viewDidLoad() {
        super.viewDidLoad()
        animateTable()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phones.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? PhoneCell
        cell?.nameLabel.text = phones[indexPath.row].name
        cell?.subtitleLabel.text = phones[indexPath.row].price
        cell?.descriptionLabel.text = phones[indexPath.row].description
        cell?.cameraLabel.text = phones[indexPath.row].camera

        return cell!
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
//        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTable()
    }
    func animateTable() {
        tableView.reloadData()
        let cells = tableView.visibleCells
        let tableViewHeight = tableView.bounds.size.height
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: -tableViewHeight, y:0 )
        }
        var delayCounter = 0
        for cell in cells {
            UIView.animate(withDuration: 1.8, delay: Double(delayCounter) * 0.2, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
                }, completion: nil)
            delayCounter += 1
        }
    }
}
