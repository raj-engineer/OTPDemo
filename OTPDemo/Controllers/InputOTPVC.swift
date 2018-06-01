//
//  InputOTPVC.swift
//  OTPDemo
//
//  Created by Rajeshkumar on 01/06/18.
//  Copyright © 2018 Rajeshkumar. All rights reserved.
//

import UIKit

class InputOTPVC: UIViewController {

    //MARK:- IBOutlet Properties
    @IBOutlet weak var tf1: UITextField!
    @IBOutlet weak var tf2: UITextField!
    @IBOutlet weak var tf3: UITextField!
    @IBOutlet weak var tf4: UITextField!
    @IBOutlet weak var buttonContinue: UIButton!
    
    //MARK:- IBAction
    @IBAction func continueAction(_ sender: UIButton) {
        print("Continue ")
    }
    @IBAction func textEditDidBegin(_ sender: UITextField) {
        print("textEditDidBegin has been pressed")
        
        if !(sender.text?.isEmpty)!{
            sender.selectAll(self)
            //buttonUnSelected()
        }else{
            print("Empty")
            sender.text = " "
            
        }
        
    }
    @IBAction func textEditChanged(_ sender: UITextField) {
        print("textEditChanged has been pressed")
        let count = sender.text?.count
        //
        if count == 1{
            
            switch sender {
            case tf1:
                tf2.becomeFirstResponder()
            case tf2:
                tf3.becomeFirstResponder()
            case tf3:
                tf4.becomeFirstResponder()
            case tf4:
                tf4.resignFirstResponder()
            default:
                print("default")
            }
        }
        
    }
    
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setUpView()
        
    }
    
    //MARK:- Custom Action
    func setUpView(){
        tf1.setBorder()
        tf2.setBorder()
        tf3.setBorder()
        tf4.setBorder()
        
        tf1.delegate = self
        tf2.delegate = self
        tf3.delegate = self
        tf4.delegate = self
        tf1.becomeFirstResponder()
        
        buttonUnSelected()
    }
    
    func buttonUnSelected(){
        buttonContinue.layer.borderWidth = 1
        buttonContinue.backgroundColor = UIColor.white
        buttonContinue.layer.borderColor = Constants.Color.SavanColor.cgColor
        buttonContinue.setTitleColor(Constants.Color.SavanColor, for: .normal)
        buttonContinue.isUserInteractionEnabled = false
    }
    func checkAllFilled(){
        
        if (tf1.text?.isEmpty)! || (tf2.text?.isEmpty)! || (tf3.text?.isEmpty)! || (tf4.text?.isEmpty)!{
            buttonUnSelected()
        }else{
            buttonSelected()
        }
    }
    
    func buttonSelected(){
        buttonContinue.layer.borderWidth = 0
        buttonContinue.backgroundColor = Constants.Color.SavanColor
        buttonContinue.setTitleColor(UIColor.white, for: .normal)
        buttonContinue.isUserInteractionEnabled = true
    }
    
}





extension InputOTPVC : UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.text = ""
        if textField.text == "" {
            print("Backspace has been pressed")
        }
        
        if string == ""
        {
            print("Backspace was pressed")
            switch textField {
            case tf2:
                tf1.becomeFirstResponder()
            case tf3:
                tf2.becomeFirstResponder()
            case tf4:
                tf3.becomeFirstResponder()
            default:
                print("default")
            }
            textField.text = ""
            return false
        }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkAllFilled()
    }
    
    
}
