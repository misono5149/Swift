//
//  ViewController.swift
//  Project_rirubona
//
//  Created by 김형철 on 2017. 10. 3..
//  Copyright © 2017년 misono. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var entry_label: UILabel!
    var num:Int? = 0
    @IBOutlet weak var s: UILabel!
    @IBAction func reset(_ sender: UIButton) {
        num = Int(s.text!)
        self.s.text = String(num! * 0 + 1)
    }
    
    
}

