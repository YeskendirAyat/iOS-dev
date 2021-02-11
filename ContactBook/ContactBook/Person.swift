//
//  Person.swift
//  ContactBook
//
//  Created by  Yeskendir Ayat on 10.02.2021.
//

import Foundation
import UIKit //for image

class Person {
    var name:String
    var phoneNumber:String
    var image:UIImage
    init(_ name:String,_ phoneNumber:String, _ image:UIImage) {
        self.name=name
        self.phoneNumber=phoneNumber
        self.image=image
    }
}
