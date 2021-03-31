//
//  CustomSegue.swift
//  AnimateApp
//
//  Created by  Yeskendir Ayat on 30.03.2021.
//

import UIKit

class CustomSegue: UIStoryboardSegue, UIViewControllerTransitioningDelegate {
    override func perform(){
        self.destination.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        self.destination.view.center = self.source.view.center
        self.destination.transitioningDelegate = self
        self.source.view.superview?.addSubview(self.destination.view)
        UIView.animate(withDuration: 0.8, animations: {
            self.destination.view.transform = CGAffineTransform.identity
        }, completion: {_ in
            self.source.navigationController?.pushViewController(self.destination, animated: false)
//            self.source.present(self.destination, animated: false, completion: nil)
        })
//        destination.transitioningDelegate = self
//        destination.modalPresentationStyle = UIModalPresentationStyle.currentContext
//        source.present(destination, animated: true, completion: nil)
    }
}
