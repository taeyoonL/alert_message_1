//
//  ViewController.swift
//  my_practice_4
//
//  Created by 이태윤 on 2023/07/06.
//

import UIKit

class ViewController: UIViewController{
    
    
    @IBOutlet var current_time: UILabel!
    @IBOutlet var chosen_time: UILabel!
    
    let interval = 1.0
    let selector : Selector = #selector(ViewController.updatetime)
    var n1 : String?
    var t : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: selector, userInfo: nil, repeats: true)
    }
    
    @IBAction func date_picker(_ sender: UIDatePicker) {
        let send = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd / HH:mm:ss / EEE"
        n1 = formatter.string(from: send.date)
        chosen_time.text = formatter.string(from: send.date)
    }
    
    @objc func updatetime () {
        let time = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd / HH:mm:ss / EEE"
        current_time.text = formatter.string(from: time as Date)
        if (formatter.string(from: time as Date) == n1) {
            let alert_message = UIAlertController(title: "알림", message: "설정된 시간입니다 !!!", preferredStyle: UIAlertController.Style.alert)
            let alert_action = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default)
            alert_message.addAction(alert_action)
            present(alert_message, animated: true, completion: nil)
        }
    }


}

