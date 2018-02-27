//
//  SAFollowButton.swift
//  CapstoneProject
//
//  Created by Eshita Mathur on 2/8/18.
//  Copyright © 2018 Eshita Mathur. All rights reserved.
//

import UIKit

class SAFollowButton: UIButton {

  var isOn = false
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    func initButton() {
        layer.borderWidth = 2.0
        layer.borderColor = Colors.backgroundRed.cgColor
        layer.cornerRadius = frame.size.height/2
        
        setTitleColor(Colors.backgroundRed, for: .normal)
        addTarget(self, action: #selector(SAFollowButton.buttonPressed), for: .touchUpInside)
        
        
    }
    
    @objc func buttonPressed() {
        activateButton(bool: !isOn)
        
    }
    
    func activateButton(bool: Bool) {
        isOn = bool
        
        let color = bool ? Colors.backgroundRed : .clear
        let title = bool ? "Following" : "Follow"
        let titleColor = bool ? . white : Colors.backgroundRed
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = color
    }

}
