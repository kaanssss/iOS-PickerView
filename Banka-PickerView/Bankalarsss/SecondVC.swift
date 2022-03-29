//
//  SecondVC.swift
//  Bankalarsss
//
//  Created by Kaan Yalçınkaya on 8.02.2022.
//

import UIKit

class SecondVC: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var label3: UILabel!
    var mesaj:String?
    var tarih: String?
    var banka : String?

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.text = tarih
        label2.text = banka
        label3.text = mesaj
        
    }
    

    

}
