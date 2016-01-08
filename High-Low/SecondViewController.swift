//
//  SecondViewController.swift
//  High-Low
//
//  Created by John Gadbois on 12/3/15.
//  Copyright © 2015 John Gadbois. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController
{

    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    var max = 0
    var points = 0
    var oldNumber = 0
    var newNumber = 0
    var guess = true
    var isRight = true
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        oldNumber = Int(arc4random_uniform(UInt32(max)))
        numberLabel.text = String(oldNumber)
        newNumber = oldNumber
    }

    @IBAction func tapLower(sender: UITapGestureRecognizer)
    {
        generateNewNumber()
        guess = false
        isCorrect()
        update()
    }

    @IBAction func tapHigher(sender: UITapGestureRecognizer)
    {
        generateNewNumber()
        guess = true
        isCorrect()
        update()
    }
    
    func isCorrect()
    {
        if(guess && newNumber > oldNumber)
        {
            isRight = true
        }
        else if(guess == false && newNumber < oldNumber)
        {
            isRight = true
        }
        else
        {
            isRight = false
        }
    }
    
    func generateNewNumber()
    {
        var number = Int(arc4random_uniform(UInt32(max)) + 1)
        while (number == newNumber)
        {
            number = Int(arc4random_uniform(UInt32(max)) + 1)
        }
        oldNumber = newNumber
        newNumber = number
        numberLabel.text = String(newNumber)
    }
    
    func update()
    {
        if(isRight)
        {
            ++points
            correctLabel.text = "Correct!"
            pointsLabel.text = String(points)
        }
        else
        {
            correctLabel.text = "You Lose"
            youLose()
        }

    }
    
    func youLose()
    {
        let alert = UIAlertController(title: "You Lose :(", message: "Your score was: " + String(points), preferredStyle: UIAlertControllerStyle.Alert)
        let resetButton = UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction((resetButton))
        self.presentViewController(alert, animated: true, completion: nil)
        points = 0
        pointsLabel.text = String(0)
        correctLabel.text = ""
    }
    
}
