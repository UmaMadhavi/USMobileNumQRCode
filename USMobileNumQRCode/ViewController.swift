//
//  ViewController.swift
//  USMobileNumQRCode
//
//  Created by TELEKHA on 31/03/18.
//  Copyright © 2018 TELEKHA. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var mobileNumberTextfield: UITextField!
    @IBOutlet var nextButton: UIButton!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        mobileNumberTextfield.layer.cornerRadius = 10.0
        mobileNumberTextfield.layer.borderWidth = 1.0
        mobileNumberTextfield.layer.borderColor = UIColor.white.cgColor
        nextButton.clipsToBounds = true
        nextButton.layer.cornerRadius = 10.0
        // Do any additional setup after loading the view, typically from a nib.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func nextButtonAction(_ sender: Any)
    {
        self.mobileNumberTextfield.resignFirstResponder()
        if isValidPhone(phone: mobileNumberTextfield.text!)
        {
     
            let numericDigit:Int = Int(generateRandomDigits(5))!
            UserDefaults.standard.set(numericDigit, forKey: "NumericDigit")
            let alertview = UIAlertController(title:"Please remember this Unique Code",message:String(numericDigit),preferredStyle: .alert)
            alertview.addAction(UIAlertAction(title:"Ok",style: .default, handler: { (action: UIAlertAction!) in
            self.okAction()
            }))
            self.present(alertview,animated:true,completion: nil)
        }
        else
        {
            self.view.makeToast("Please enter valid US phone number")
           
        }
    }
    
    func okAction()
    {
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.present(secondVC, animated: false, completion: nil)
    }
    func isValidPhone(phone: String) -> Bool {
        
        let PHONE_REGEX = "^001[0-9'@s]{10,10}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: phone)
        return result
        
    }
    
    func generateRandomDigits(_ digitNumber: Int) -> String
    {
        var number = ""
        for i in 0..<digitNumber {
            var randomNumber = arc4random_uniform(10)
            while randomNumber == 0 && i == 0 {
                randomNumber = arc4random_uniform(10)
            }
            number += "\(randomNumber)"
        }
        return number
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

