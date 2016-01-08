//
//  ViewController.swift
//  High-Low
//
//  Created by John Gadbois on 12/2/15.
//  Copyright © 2015 John Gadbois. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var maxNumberTextField: UITextField!
  
    var max: Int = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        max = (maxNumberTextField.text! as NSString).integerValue
        let secondVC = segue.destinationViewController as! SecondViewController
        secondVC.max = max
    }
}

