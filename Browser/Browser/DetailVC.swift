//
//  DetailVC.swift
//  Browser
//
//  Created by  Yeskendir Ayat on 24.02.2021.
//

import UIKit
import WebKit
class DetailVC: UIViewController,WKUIDelegate {
    @IBOutlet weak var page: WKWebView!
    var index = 0
    var index2 = 0
    
    var thisPage:Website?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.page.uiDelegate = self
        if let li=thisPage?.link{
            let getURL=URL(string: li)
            page.load(URLRequest(url:getURL!))
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
        if(thisPage?.isFav==true){
            navigationController?.navigationBar.barTintColor = UIColor.yellow
        }else{
            navigationController?.navigationBar.barTintColor = UIColor.white
        }
        navigationItem.title=thisPage?.name
        let taps = UITapGestureRecognizer(target: self, action: #selector(tap))
        taps.numberOfTapsRequired = 3
        page.addGestureRecognizer(taps)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc func tap() {
        if thisPage?.isFav==false {
            allList[0][index].isFav=true
            allList[1].append(allList[0][index])
            navigationController?.navigationBar.barTintColor = UIColor.yellow
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
        }else{
            if index2==1{
                for item in allList[0] {
                    if item.name==thisPage?.link {
                        item.isFav=false
                        
                    }
                }
                
                allList[1].remove(at: index)
                navigationController?.navigationBar.barTintColor = UIColor.white
            }
            else if index2==0{
                allList[0][index].isFav=false
                allList[1].removeAll(where: {$0.link==thisPage?.link})
                navigationController?.navigationBar.barTintColor = UIColor.white
            }
            navigationController?.navigationBar.barTintColor = UIColor.white
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newDataNotif"), object: nil)
        }
    }
}
