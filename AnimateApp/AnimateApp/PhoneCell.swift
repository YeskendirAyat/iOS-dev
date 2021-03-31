//
//  PhoneCell.swift
//  AnimateApp
//
//  Created by  Yeskendir Ayat on 26.03.2021.
//

import UIKit

class PhoneCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var subInfoView: UIView!
    @IBOutlet weak var hideButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cameraLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        hideButton.layer.masksToBounds = true
        hideButton.layer.cornerRadius = 4
        hideButton.layer.borderWidth = 1
        hideButton.layer.borderColor = UIColor.white.cgColor
        subInfoView.isHidden = !subInfoView.isHidden
    }
    @IBAction func moveToSubInfo(_ sender: Any) {
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromLeft, .showHideTransitionViews]
        self.subInfoView.alpha = 0.5
        UIView.transition(with: subInfoView , duration: 1, options: transitionOptions, animations: {
            self.subInfoView.alpha = 1
            self.subInfoView.isHidden = !self.subInfoView.isHidden
        })
    }
    @IBAction func hide(_ sender: Any) {
        UIView.animate(withDuration: 0.4, animations: {
            self.subInfoView.layer.transform=CATransform3DTranslate(CATransform3DIdentity, 500, 0, 0)
            self.subInfoView.alpha = 0.5
        }, completion: {_ in
            self.subInfoView.isHidden = !self.subInfoView.isHidden
            self.subInfoView.layer.transform=CATransform3DTranslate(CATransform3DIdentity,0, 0, 0)
            self.subInfoView.alpha = 1
        })
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
