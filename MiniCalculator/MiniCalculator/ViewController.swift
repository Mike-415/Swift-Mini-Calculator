//
//  ViewController.swift
//  MiniCalculator
//
//  Created by Michael Gonzalez on 2/16/18.
//  Copyright © 2018 App. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    let defaultString:String = ""
    let defaultInt:Int = 0
    private var firstNum:Int!
    private var secondNum:Int!
    private var firstNumPressed:Bool!
    private var operatorPressed:Bool!
    private var secondNumPressed:Bool!
    private var isAddition:Bool!
    @IBOutlet var display: UITextField!
    
    
    private func initializeFields()
    {
        display.text = defaultString
        firstNum = defaultInt
        secondNum = defaultInt
        firstNumPressed = false
        operatorPressed = false
        secondNumPressed = false
        isAddition = false
    }

    private func numberPressed(buttonNumber:Int)
    {
        display.text = String(buttonNumber)
        if firstNumPressed
        {
            if !secondNumPressed
            {
                secondNum = secondNum + buttonNumber
                secondNumPressed = true
            }
        }
        else
        {
            firstNum = firstNum + buttonNumber
            firstNumPressed = true
        }
    }
    private func operatorPressed(isAdd:Bool)
    {
        if firstNumPressed && !secondNumPressed
        {
            if isAdd
            {
                isAddition = true
            }
        }
    }
    
    @IBAction func num1Button(_ sender: UIButton)
    {
        numberPressed(buttonNumber: 1)
    }
    
    
    @IBAction func num2Button(_ sender: UIButton)
    {
        numberPressed(buttonNumber: 2)
    }
    
    
    @IBAction func num3Button(_ sender: UIButton)
    {
        numberPressed(buttonNumber: 3)
    }
    
    @IBAction func plusButton(_ sender: UIButton)
    {
        operatorPressed(isAdd:true)
    }
    
    
    @IBAction func minusButton(_ sender: UIButton)
    {
        operatorPressed(isAdd:false)
    }
    
    
    @IBAction func resetButton(_ sender: UIButton)
    {
        initializeFields()
    }
    
    
    @IBAction func equalButton(_ sender: UIButton)
    {
        if firstNumPressed && secondNumPressed
        {
            if isAddition
            {
                display.text = String(firstNum + secondNum)
            }
            else
            {
                display.text = String(firstNum - secondNum)
            }
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        initializeFields()
    }
}

