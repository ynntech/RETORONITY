//
//  CustomInfoWindow.swift
//  RETONITY
//
//  Created by Yushi Nakaya on 2019/06/23.
//  Copyright © 2019 Yushi Nakaya. All rights reserved.
//

import UIKit

class CustomInfoWindow: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    @IBOutlet weak var customWindowLabel: UILabel!
    @IBAction func press(_ sender: UIButton) {
        self.customWindowLabel.text = "ようこそ！"
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func loadView() -> CustomInfoWindow{
        let customInfoWindow = Bundle.main.loadNibNamed("CustomInfoWindow", owner: self, options: nil)?[0] as! CustomInfoWindow
        return customInfoWindow
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
