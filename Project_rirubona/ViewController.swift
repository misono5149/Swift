//
//  ViewController.swift
//  Project_rirubona
//
//  Created by 김형철 on 2017. 10. 3..
//  Copyright © 2017년 misono. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var num:Double? = 0
    var new_num:Double? = 0
    var kigo_input:Bool?
    var result_num:Double? = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var entry_label: UILabel!
    @IBOutlet weak var s: UILabel!
    @IBAction func Reset(_ sender: UIButton) {
        num = Double(s.text!)
        self.s.text = String(num! * 0)
    }
   
    @IBAction func Numbers(_ sender: UIButton) {
        num = Double(s.text!)
        self.s.text = String(num! * 0)
    }
    
    
}


