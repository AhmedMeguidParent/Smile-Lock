//
//  PasswordLoginViewController.swift
//  SmileLock-Example
//
//  Created by rain on 4/22/16.
//  Copyright © 2016 RECRUIT LIFESTYLE CO., LTD. All rights reserved.
//

import UIKit
import SmileLock

class PasswordLoginViewController: UIViewController {

    @IBOutlet weak var passwordStackView: UIStackView!
    
    //MARK: Property
    var passwordUIValidation: MyPasswordUIValidation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create PasswordUIValidation subclass
        self.passwordUIValidation = MyPasswordUIValidation(in: passwordStackView)
        
        self.passwordUIValidation.success = { [weak self] _ in
            print("*️⃣ success!")
            self?.alertForRightPassword { _ in
                self?.passwordUIValidation.resetUI()
            }
        }
        
        self.passwordUIValidation.failure = { _ in
            //do not forget add [weak self] if the view controller become nil at some point during its lifetime
            print("*️⃣ failure!")
        }
        
        //customize password UI
        self.passwordUIValidation.view.tintColor = UIColor.color(.TextColor)
        self.passwordUIValidation.view.highlightedColor = UIColor.color(.Blue)
        
    }
}
