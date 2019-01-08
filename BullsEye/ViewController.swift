//
//  ViewController.swift
//  BullsEye
//
//  Created by vikas kumar on 05/01/19.
//  Copyright © 2019 vikas kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet
    private weak var sliderUI : UISlider!
    
    @IBOutlet
    private weak var targetValueUI : UILabel!
    
    @IBOutlet
    private weak var totalScore : UILabel!
    
    @IBOutlet
    private weak var currentRoundUI : UILabel!
    
    private var targetValue  = 0
    private var currentValue = 0
    private var score = 0
    private var currentRound = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewGame()
        
        let thumbnail = #imageLiteral(resourceName: "SliderThumb-Normal")
        sliderUI.setThumbImage(thumbnail, for: .normal)
        
        let thumbnailHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        sliderUI.setThumbImage(thumbnailHighlighted, for: .highlighted)
        
        let insets  = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        sliderUI.setMinimumTrackImage(trackResizable, for: .normal)
        
    
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackResizableRight = trackRightImage.resizableImage(withCapInsets: insets)
        sliderUI.setMaximumTrackImage(trackResizableRight, for: .normal)
    }

    @IBAction
    func showAlert(){
        let difference = abs(targetValue-currentValue)
        var points = 100-difference
        var title = ""
        if difference == 0 {
            title = "You are just awesome"
            points+=100
        }else if difference <= 5 {
            title = "Perfect"
            if difference == 1 {
                points+=50
            }
        }else if difference <= 10{
            title = "You are good"
        }else{
            title = "Try harder! next time"
        }
    
        score+=points
        let message = "You scored \(points) points."
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default){(action) in
             self.startNewGame()
        }
        controller.addAction(action)
        present(controller,animated: true,completion: nil)
    }

    @IBAction
    private func sliderMove(_ sliderUI:UISlider){
        currentValue = Int(sliderUI.value)
    }
    
    @IBAction
    private func resetGame(_ resetButton:UIButton){
        currentRound=0
        score = 0
        startNewGame()
    }
    
    private func startNewGame(){
        targetValue = Int.random(in:1...100)
        sliderUI.value = Float(50)
        currentRound+=1
        updateLabels()
    }
    
    private func updateLabels(){
        targetValueUI.text = String(targetValue)
        totalScore.text = String(score)
        currentRoundUI.text = String(currentRound)
    }
}


