//
//  HistoryVC.swift
//  Browser
//
//  Created by  Yeskendir Ayat on 25.02.2021.
//

import UIKit

class HistoryVC: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title="History"
        tableView.reloadData()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "histCell")
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyBasic", for: indexPath)
        cell.textLabel?.text=historyList[indexPath.row].name
        cell.detailTextLabel?.text=historyList[indexPath.row].link
        return cell
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            historyList.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    @IBAction func clearHistory(_ sender: UIBarButtonItem) {
        historyList.removeAll()
        tableView.reloadData()
    }
    
}
