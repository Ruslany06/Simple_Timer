//
//  SecondViewController.swift
//  Timer
//
//  Created by Ruslan Yelguldinov on 29.05.2024.
//

import UIKit

class SecondViewController: UIViewController {

    var time = 0
    var startTime = 0
    var timer = Timer()
    var isTimerRunning = false
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var restartBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.text = timeFormat(intTime: time)
        label.layer.borderWidth = 0.5
        
        startTime = time
    }
    
    @objc func countTimer() {
        time -= 1
        
        label.text = timeFormat(intTime: time)
        
        if time == 0 {
            timer.invalidate()
        }
        
    }
    
    @IBAction func startTimer(_ sender: Any) {
        
        if isTimerRunning {
            return
        }
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countTimer), userInfo: nil, repeats: true)
        isTimerRunning = true
    }

    @IBAction func pauseTimer(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
    }
    
    @IBAction func restartTimer(_ sender: Any) {
        timer.invalidate()
        time = startTime
        isTimerRunning = false
        label.text = timeFormat(intTime: time)
    }
    
    func timeFormat(intTime: Int) -> String {
        let seconds = intTime % 60
        let minutes = (intTime / 60) % 60
        let hours = intTime / 3600
        return String(format: "%0.2d:%0.2d:%0.2d", hours, minutes, seconds)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
