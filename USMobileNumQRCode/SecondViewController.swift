//
//  SecondViewController.swift
//  USMobileNumQRCode
//
//  Created by TELEKHA on 31/03/18.
//  Copyright © 2018 TELEKHA. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var numericCodeTextField: UITextField!
    @IBOutlet var nextButton: UIButton!
    var UniqueCode:Int = UserDefaults.standard.object(forKey: "NumericDigit") as! Int
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        numericCodeTextField.layer.cornerRadius = 10.0
        numericCodeTextField.layer.borderWidth = 1.0
        numericCodeTextField.layer.borderColor = UIColor.white.cgColor
        nextButton.clipsToBounds = true
        nextButton.layer.cornerRadius = 10.0
        
        // Do any additional setup after loading the view.
    }

   
    @IBAction func nextButtonAction(_ sender: Any)
    {
        self.numericCodeTextField.resignFirstResponder()
        if(numericCodeTextField.hasText)
        {
        if numericCodeTextField.text == String(UniqueCode)
        {
        let thirdVC = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        self.present(thirdVC, animated: false, completion: nil)
        }
        else
        {
        self.view.makeToast("Please enter the numeric text correctly")
        }
        }
        else
        {
           self.view.makeToast("Please enter numeric text which you have seen in the earlier screen")
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
