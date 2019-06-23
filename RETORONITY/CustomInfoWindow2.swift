//
//  CustomInfoWindow2.swift
//  RETORONITY
//
//  Created by Yushi Nakaya on 2019/06/23.
//  Copyright © 2019 Yushi Nakaya. All rights reserved.
//

import UIKit

class CustomInfoWindow2: UIView {
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
    func loadView() -> CustomInfoWindow2{
        let customInfoWindow = Bundle.main.loadNibNamed("CustomInfoWindow2", owner: self, options: nil)?[0] as! CustomInfoWindow2
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
