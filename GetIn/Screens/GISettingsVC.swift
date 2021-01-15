//
//  GISettingsVC.swift
//  GetIn
//
//  Created by Sergei Krupenikov on 22.11.2020.
//

import UIKit
import UserNotifications

class GISettingsVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let tableView = UITableView()
    
    let wordsQtyCell = GISettingsCell(style: .subtitle, reuseIdentifier: "words")
    let notifCell = GISettingsCell(style: .subtitle, reuseIdentifier: "notif")
    let soundsCell = GISettingsCell(style: .subtitle, reuseIdentifier: "sounds")
    let emailCell = GISettingsCell(style: .subtitle, reuseIdentifier: "email")
    let scheduleCell = GISettingsCell(style: .default, reuseIdentifier: "schedule")
    
    let days = ["Everyday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    let hours = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"]
    let minutes = ["00", "05", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55"]
    
    var wordsQty = Int()
    var notifOn = Bool()
    var soundsOn = Bool()
    
    
    let email = "s.krupe@gmail.com"
    let center = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Settings"
        configureTableView()
        configureCells()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        wordsQty = wordsQtyCell.counter
        
        UserDefaults.standard.set(wordsQty, forKey: "wordsQty")
        UserDefaults.standard.set(notifOn, forKey: "notifOn")
        UserDefaults.standard.set(soundsOn, forKey: "soundsOn")
    }
    
    func configureCells() {
        
        wordsQtyCell.wordsNumberLabel.isHidden = false
        wordsQtyCell.stepper.isHidden = false
        wordsQtyCell.textLabel?.text = General.NumberOfWords.description
        wordsQtyCell.detailTextLabel?.text = "10 to 25"
        //add here
        let value = Double(UserDefaults.standard.integer(forKey: "wordsQty"))
        wordsQtyCell.stepper.value = value
        wordsQty = Int(wordsQtyCell.stepper.value)
        wordsQtyCell.wordsNumberLabel.text = "\(wordsQty)"
        
        notifCell.switchControlNotif.isHidden = false
        notifCell.switchControlNotif.isOn = UserDefaults.standard.bool(forKey: "notifOn")
        notifOn = notifCell.switchControlNotif.isOn
        notifCell.textLabel?.text = Notifications.Notifications.description
        notifCell.switchControlNotif.addTarget(self, action: #selector(settingsSwitched), for: .valueChanged)
        
        scheduleCell.textLabel?.text = "Schedule"
        scheduleCell.picker.isHidden = false
        scheduleCell.picker.dataSource = self
        scheduleCell.picker.delegate = self
        
        soundsCell.switchControlSounds.isHidden = false
        soundsCell.switchControlSounds.isOn = UserDefaults.standard.bool(forKey: "soundsOn")
        soundsOn = soundsCell.switchControlSounds.isOn
        soundsCell.textLabel?.text = Notifications.Sounds.description
        soundsCell.switchControlSounds.addTarget(self, action: #selector(settingsSwitched), for: .valueChanged)
        if notifOn {
            soundsCell.switchControlSounds.isEnabled = true
        } else {
            soundsCell.switchControlSounds.isEnabled = false
        }
        
        emailCell.textLabel?.text = Feedback.Email.description
        emailCell.selectionStyle = .default
    }
    
    func configureTableView() {
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.backgroundColor = .systemGroupedBackground
        tableView.rowHeight = 50
        //            UITableView.automaticDimension
        //        tableView.estimatedRowHeight = 50
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(GISettingsCell.self, forCellReuseIdentifier: "cell")
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 1))
        footerView.backgroundColor = .systemGroupedBackground
        tableView.tableFooterView = footerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else { return 0 }
        
        switch section {
        case .General: return General.allCases.count
        case .Notifications: return Notifications.allCases.count
        case .Feedback: return Feedback.allCases.count
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 40))
        view.backgroundColor = .systemGroupedBackground
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.bounds.width - 30, height: 40))
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor.black
        
        label.text = Section(rawValue: section)?.description
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 && indexPath.row == 1 {
            if notifCell.switchControlNotif.isOn {
                return 130
            } else {
                return 0
            }
        }
        
        return tableView.rowHeight
    }
    
    
    //    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    //
    //        if indexPath.section == 1 && indexPath.row == 1{
    //                cell.center.y = cell.center.y + cell.frame.height / 2
    //                cell.alpha = 0
    //                UIView.animate(withDuration: 0.5, delay: 0.05*Double(indexPath.row), options: [.curveEaseInOut], animations: {
    //                    cell.center.y = cell.center.y - cell.frame.height / 2
    //                    cell.alpha = 1
    //                }, completion: nil)
    //            }
    //    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let section = Section(rawValue: indexPath.section) else { return UITableViewCell() }
        
        switch section {
        case .General:
            return wordsQtyCell
        case .Notifications:
            switch indexPath.row {
            case 0:
                return notifCell
            case 1:
                return scheduleCell
            default:
                return soundsCell
            }
        case .Feedback:
            return emailCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 2 && indexPath.row == 0 {
            print("mail")
            if let url = URL(string: "mailto:\(email)") {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url)
                } else {
                    UIApplication.shared.openURL(url)
                }
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    @objc func settingsSwitched(sender: UISwitch) {
        if sender == notifCell.switchControlNotif {
            
            switch sender.isOn {
            case true:
                soundsCell.switchControlSounds.isEnabled = true
                center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
                    if granted {
                        print("Yay!")
                        self.scheduleNotification()
                        self.notifOn = true
                    } else {
                        print("D'oh")
                    }
                }
            case false:
                notifOn = false
                soundsOn = false
                soundsCell.switchControlSounds.setOn(false, animated: true)
                soundsCell.switchControlSounds.isEnabled = false
            }
            
        } else {
            
            switch sender.isOn {
            case true:
                soundsOn = true
            case false:
                soundsOn = false
            }
        }
        self.tableView.reloadData()
    }
    
    func scheduleNotification() {
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "Repetition Time!"
        content.body = "Hey! It's time to repeat something, don't you think?!"
        content.badge = NSNumber(value: 1)
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData": "fizzbuzz"]
        content.sound = UNNotificationSound.default
        
        var dateComponents = DateComponents()
        dateComponents.weekday = 1
        dateComponents.hour = 11
        dateComponents.minute = 26
        //        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return days.count
        case 1:
            return hours.count
        case 2:
            return minutes.count
        default:
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return days[row]
        case 1:
            return hours[row]
        case 2:
            return minutes[row]
        default:
            return "0"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        switch component {
        case 0:
            return 160
        case 1:
            return 50
        case 2:
            return 50
        default:
            return 0
        }
    }
}

