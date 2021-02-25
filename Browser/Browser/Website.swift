//
//  Website.swift
//  Browser
//
//  Created by  Yeskendir Ayat on 24.02.2021.
//

import Foundation
import UIKit

class Website{
    var name: String
    var link: String
    var isFav:Bool
    init(name:String,link:String,isFav:Bool) {
        self.name=name
        self.link=link
        self.isFav=isFav
    }
//    mutating func setIsFav(isFav: Bool){
//        self.isFav=isFav
//    }
}
