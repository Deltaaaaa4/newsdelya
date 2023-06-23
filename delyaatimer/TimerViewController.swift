//
//  TimerViewController.swift
//  delyaatimer
//
//  Created by 903-20i on 12.06.2023.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var timerlabel: UILabel!
     var time = 0
    var startTime = 0
    
    var timer = Timer()
    var isTimerRunning = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        timerlabel.text = timetoString(intTime: time)
        startTime = time
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc func countTime(){
        time -= 1
        timerlabel.text = timetoString(intTime: time)
        if time == 0{
            timer.invalidate()
            isTimerRunning = false

        }
        
    }
    
    @IBAction func startTimer(_ sender: Any) {
        if isTimerRunning {
            return
        }
        isTimerRunning = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseTimer(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false

    }
    
    
    @IBAction func restartTimer(_ sender: Any) {
        time = startTime
        timerlabel.text = timetoString(intTime: time)
        timer.invalidate()
        isTimerRunning = false


    }
    
    func timetoString(intTime: Int) -> String {
            let hour = intTime / 3600
            let minute = intTime / 60 % 60
            let second = intTime % 60

            // return formated string
            return String(format: "%02i:%02i:%02i", hour, minute, second)
        }
    
    
    

}
