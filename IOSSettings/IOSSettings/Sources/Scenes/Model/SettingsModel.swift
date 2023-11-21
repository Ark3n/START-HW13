//
//  SettingsModel.swift
//  IOSSettings
//
//  Created by Arken Sarsenov on 31.10.2023.
//

import UIKit

struct Setting {
    var icon: UIImage?
    var title: String
    var settingState: String?
    var switchElement: Bool
    var color: UIColor = .systemBlue
}

class SettingsGroup {
    var title: String
    var settings: [Setting]
    
    init(title: String, settings: [Setting]) {
        self.title = title
        self.settings = settings
    }
}

extension SettingsGroup {
    static func allGroup() -> [SettingsGroup]{
        return [getConnectionGroup(), getNotificationGroup(), getGeneralGroup()]
    }
    public static func getConnectionGroup() -> SettingsGroup {
        let settings = [
            Setting(icon: UIImage(systemName: "airplane"), title: "Airplane Mode", switchElement: true, color: .systemOrange),
            Setting(icon: UIImage(systemName: "wifi"), title: "Wi-Fi", settingState: "Not Connected", switchElement: false),
            Setting(icon: UIImage(systemName: "wifi"), title: "Bluetooth", settingState: "On", switchElement: false),
            Setting(icon: UIImage(systemName: "wifi"), title: "Cellular", switchElement: false, color: .systemGreen),
            Setting(icon: UIImage(systemName: "personalhotspot"), title: "Personal Hotspot", switchElement: false, color: .systemGreen)
        ]
        return SettingsGroup(title: "Connections", settings: settings)
    }
    
    public static func  getNotificationGroup() -> SettingsGroup {
        let settings = [
            Setting(icon: UIImage(systemName: "bell.badge.fill"), title: "Notifications", switchElement: false, color: .systemRed),
            Setting(icon: UIImage(systemName: "speaker.wave.3.fill"), title: "Sounds & Haptics", switchElement: false, color: .systemRed),
            Setting(icon: UIImage(systemName: "moon.fill"), title: "Focus", switchElement: false, color: .systemPurple),
            Setting(icon: UIImage(systemName: "switch.2"), title: "Screen Time", switchElement: false, color: .systemPurple)
        ]
        return SettingsGroup(title: "Notofications", settings: settings)
    }
    
    public static func  getGeneralGroup()-> SettingsGroup {
        let settings = [
            Setting(icon: UIImage(systemName: "gear"), title: "General", switchElement: false, color: .systemGray),
            Setting(icon: UIImage(systemName: "wifi"), title: "Control Center", switchElement: false, color: .systemGray),
            Setting(icon: UIImage(systemName: "textformat.size"), title: "Displat & Brightness", switchElement: false),
            Setting(icon: UIImage(systemName: "wifi"), title: "Home Screen", switchElement: false),
            Setting(icon: UIImage(systemName: "wifi"), title: "Accessibility", switchElement: false),
            Setting(icon: UIImage(systemName: "wifi"), title: "Wallpaper", switchElement: false),
            Setting(icon: UIImage(systemName: "wifi"), title: "Siri & Search", switchElement: false),
            Setting(icon: UIImage(systemName: "faceid"), title: "Face ID & Passcode", switchElement: false, color: .systemGreen),
            Setting(icon: UIImage(systemName: "sos"), title: "Emergency SOS", switchElement: false, color: .systemRed),
            Setting(icon: UIImage(systemName: "microbe.fill"), title: "Exposure Notifications", switchElement: false, color: .systemRed),
            Setting(icon: UIImage(systemName: "battery.100"), title: "Battery", switchElement: false, color: .systemGreen),
            Setting(icon: UIImage(systemName: "hand.raised.fill"), title: "Privacy & Security", switchElement: false)
        ]
        return SettingsGroup(title: "General", settings: settings)
    }
}



//// Connection
//var connections = [
//    [Setting(icon: UIImage(systemName: "airplane"), title: "Airplane Mode", switchElement: true, color: .systemOrange)],
//    [Setting(icon: UIImage(systemName: "wifi"), title: "Wi-Fi", settingState: "Not Connected", switchElement: false)],
//    [Setting(icon: UIImage(systemName: "wifi"), title: "Bluetooth", settingState: "On", switchElement: false)],
//    [Setting(icon: UIImage(systemName: "wifi"), title: "Cellular", switchElement: false, color: .systemGreen)],
//    [Setting(icon: UIImage(systemName: "personalhotspot"), title: "Personal Hotspot", switchElement: false, color: .systemGreen)]
//]
//// Notifications
//var notifications = [
//    [Setting(icon: UIImage(systemName: "bell.badge.fill"), title: "Notifications", switchElement: false, color: .systemRed)],
//    [Setting(icon: UIImage(systemName: "speaker.wave.3.fill"), title: "Sounds & Haptics", switchElement: false, color: .systemRed)],
//    [Setting(icon: UIImage(systemName: "moon.fill"), title: "Focus", switchElement: false, color: .systemPurple)],
//    [Setting(icon: UIImage(systemName: "switch.2"), title: "Screen Time", switchElement: false, color: .systemPurple)]
//]
//// General
//var general = [
//    [Setting(icon: UIImage(systemName: "wifi"), title: "General", switchElement: false, color: .systemGray)],
//    [Setting(icon: UIImage(systemName: "wifi"), title: "Control Center", switchElement: false, color: .systemGray)],
//    [Setting(icon: UIImage(systemName: "textformat.size"), title: "Displat & Brightness", switchElement: false)],
//    [Setting(icon: UIImage(systemName: "wifi"), title: "Home Screen", switchElement: false)],
//    [Setting(icon: UIImage(systemName: "wifi"), title: "Accessibility", switchElement: false)],
//    [Setting(icon: UIImage(systemName: "wifi"), title: "Wallpaper", switchElement: false)],
//    [Setting(icon: UIImage(systemName: "wifi"), title: "Siri & Search", switchElement: false)],
//    [Setting(icon: UIImage(systemName: "faceid"), title: "Face ID & Passcode", switchElement: false, color: .systemGreen)],
//    [Setting(icon: UIImage(systemName: "sos"), title: "Emergency SOS", switchElement: false, color: .systemRed)],
//    [Setting(icon: UIImage(systemName: "microbe.fill"), title: "Exposure Notifications", switchElement: false, color: .systemRed)],
//    [Setting(icon: UIImage(systemName: "battery.100"), title: "Battery", switchElement: false, color: .systemGreen)],
//    [Setting(icon: UIImage(systemName: "hand.raised.fill"), title: "Privacy & Security", switchElement: false)]
//]
