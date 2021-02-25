//
//  SitesVC.swift
//  Browser
//
//  Created by  Yeskendir Ayat on 24.02.2021.
//

import UIKit
//var test="succes"
var historyList:[Website]=[]
var websiteList:[Website]=[
    Website(name:"Apple",link:"https://www.apple.com",isFav:false),
    Website(name:"Google",link:"https://www.google.com",isFav:false)
    ]

var favoritesList:[Website]=[]
var allList=[websiteList,favoritesList]
class SitesVC: UITableViewController {
    var thisTable:Int=0

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title="Websites"
        NotificationCenter.default.addObserver(self, selector: #selector(reload), name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
    }

    
    
    @objc func reload(){
        tableView.reloadData()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allList[thisTable].count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as? CustomCell
        cell?.title.text=allList[thisTable][indexPath.row].name
        return cell!
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            allList[thisTable].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    @IBAction func changeList(_ sender: UISegmentedControl) {
        thisTable=sender.selectedSegmentIndex
        reload()
    }
    @IBAction func addWebsite(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add website", message: "Fill all the fields", preferredStyle: UIAlertController.Style.alert)
        alert.addTextField()
        alert.addTextField()
        let submitAction = UIAlertAction(title: "Add", style: .default) { [self, unowned alert] _ in
            if alert.textFields![0].text!=="" || alert.textFields![1].text!==""{ return }
            allList[0].append(Website(name: alert.textFields![0].text!.capitalizingFirstLetter(),link: "https://"+alert.textFields![1].text!,isFav: false))
            tableView.reloadData()
        }
        tableView.reloadData()
        alert.addAction(submitAction)
        self.present(alert, animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            if let navcon = segue.destination as? UINavigationController{
                if let destination = navcon.visibleViewController as? DetailVC{
                    if let index = tableView.indexPathForSelectedRow?.row{
                        historyList.insert(Website(name: allList[thisTable][index].name, link: allList[thisTable][index].link,isFav: false), at: 0)
                        
                        destination.thisPage=allList[thisTable][index]
                        destination.index2=thisTable
                        destination.index=index
                    }
                }
            }
        }
    }
}
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
