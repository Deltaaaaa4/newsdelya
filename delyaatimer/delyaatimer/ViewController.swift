//
//  ViewController.swift
//  delyaatimer
//
//  Created by 903-20i on 12.06.2023.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var textfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "timerVC"{
            let vc = segue.destination as! TimerViewController
            vc.time = Int(textfield.text!) ?? 0
            
        }
    }
    
    

}

