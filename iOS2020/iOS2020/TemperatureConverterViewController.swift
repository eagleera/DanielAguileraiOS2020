//
//  PrimerPracticaViewController.swift
//  iOS2020
//
//  Created by Noel Aguilera Terrazas on 28/01/20.
//  Copyright © 2020 Daniel Aguilera. All rights reserved.
//

import UIKit

class TemperatureConverterViewController: UIViewController {

    @IBOutlet weak var FarenheitInput: UITextField!
    @IBOutlet weak var CelsiusLbl: UILabel!
    @IBOutlet weak var imageTemp: UIImageView!
    @IBOutlet weak var CalcularBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Farenheit Converter"
        CelsiusLbl.isHidden = true
        imageTemp.isHidden = true
        CalcularBtn.layer.cornerRadius = 11
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func ConvertToFarenheit(_ sender: Any) {
        if(FarenheitInput.text != "") {
            let celsius = (Int(FarenheitInput.text!)! - 32) * 5/9
            imageTemp.isHidden = false
            if (celsius < 10) {
                imageTemp.image = UIImage(named: "snowman.png")
            } else {
                imageTemp.image = UIImage(named: "sun.png")
            }
            CelsiusLbl.isHidden = false
            CelsiusLbl.text = String(celsius) + "°C"
        } else {
            self.showToast(message: "No se armo, Ingresa un valor.")
            CelsiusLbl.isHidden = true
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func showToast(message : String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        self.present(alertController, animated: true, completion: nil)
    }
}
