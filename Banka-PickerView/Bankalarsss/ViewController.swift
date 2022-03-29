//
//  ViewController.swift
//  Bankalarsss
//
//  Created by Kaan Yalçınkaya on 8.02.2022.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource{

    @IBOutlet weak var tarihText: UITextField!
    @IBOutlet weak var tutarText: UITextField!
    @IBOutlet weak var bankaText: UITextField!
    
    var pickerView:UIPickerView?
    var bankalar:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadInputViews()
        bankalar = ["Garanti Bankası","Kuveyt Türk","İş Bankası","Yapı Kredi","Halkbank","Akbank"]
        
        pickerView = UIPickerView()
        pickerView?.dataSource = self
        pickerView?.delegate = self
        bankaText?.inputView = pickerView
        let toolbar = UIToolbar()
        
        toolbar.tintColor = UIColor.red
        toolbar.sizeToFit()
        
        let buttonSec = UIBarButtonItem(title: "Seç", style: .plain, target: self, action: #selector(ViewController.secTikla))
        
        let buttonBosluk = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let buttonİptal = UIBarButtonItem(title: "İptal", style: .plain, target: self, action: #selector(self.iptalTikla))
        toolbar.setItems([buttonİptal,buttonBosluk,buttonSec], animated: true)
        bankaText.inputAccessoryView = toolbar
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component:Int) -> Int {
        return bankalar.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bankalar[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        bankaText.text = bankalar[row]
    }
    
    @objc func secTikla() {
        view.endEditing(true)
         
     }
    @objc func iptalTikla() {
        bankaText.text = ""
        bankaText.placeholder = "Banka seç."
        view.endEditing(true)
        
     }
    

    @IBAction func buttonClicked(_ sender: Any) {
        
        
        performSegue(withIdentifier: "showSecondVC", sender: nil)
        
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let gidilecelViewController = storyboard.instantiateViewController(withIdentifier: "ikincisayfa") as! SecondVC
//        let gonderilecekMesaj = tutarText.text
//        print("bankaText: \(bankaText.text!)")
//        print("tarihText: \(tarihText.text!)")
//        print("tutarText: \(tutarText.text!)")
//        gidilecelViewController.mesaj = gonderilecekMesaj!
//        let ikinciMesaj = tarihText.text
//        gidilecelViewController.tarih = ikinciMesaj!
//        let ucuncuMesaj = bankaText.text
//        gidilecelViewController.banka = ucuncuMesaj!
//
//
//
//
//        self.present(gidilecelViewController,animated: true,completion: nil)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let secondVC = segue.destination as? SecondVC {
            secondVC.banka = bankaText.text
            secondVC.tarih = tarihText.text
            secondVC.mesaj = tutarText.text
        }
    }
    
}

