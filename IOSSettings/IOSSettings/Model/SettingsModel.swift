//
//  SettingsModel.swift
//  IOSSettings
//
//  Created by Arken Sarsenov on 31.10.2023.
//

import UIKit
import SnapKit

struct Setting {
    var icon: UIImage?
    var title: String
    var settingState: String?
    var switchElement: Bool
}

extension Setting {
    static var settings: [[Setting]] = [
        // Connection
        [Setting(icon: UIImage(systemName: "airplane"), title: "Airplane Mode", switchElement: true)],
        [Setting(icon: UIImage(systemName: "wifi"), title: "Wi-Fi", settingState: "Not Connected", switchElement: false)],
        [Setting(icon: UIImage(systemName: "wifi"), title: "Bluetooth", settingState: "On", switchElement: false)],
        [Setting(icon: UIImage(systemName: "wifi"), title: "Cellular", switchElement: false)],
        [Setting(icon: UIImage(systemName: "personalhotspot"), title: "Personal Hotspot", switchElement: false)],
        
        // Notifications
        [Setting(icon: UIImage(systemName: "bell.badge.fill"), title: "Notifications", switchElement: false)],
        [Setting(icon: UIImage(systemName: "speaker.wave.3.fill"), title: "Sounds & Haptics", switchElement: false)],
        [Setting(icon: UIImage(systemName: "moon.fill"), title: "Focus", switchElement: false)],
        [Setting(icon: UIImage(systemName: "switch.2"), title: "Screen Time", switchElement: false)],
        
        // General
        [Setting(icon: UIImage(systemName: "wifi"), title: "General", switchElement: false)],
        [Setting(icon: UIImage(systemName: "wifi"), title: "Control Center", switchElement: false)],
        [Setting(icon: UIImage(systemName: "textformat.size"), title: "Displat & Brightness", switchElement: false)],
        [Setting(icon: UIImage(systemName: "wifi"), title: "Home Screen", switchElement: false)],
        [Setting(icon: UIImage(systemName: "wifi"), title: "Accessibility", switchElement: false)],
        [Setting(icon: UIImage(systemName: "wifi"), title: "Wallpaper", switchElement: false)],
        [Setting(icon: UIImage(systemName: "wifi"), title: "Siri & Search", switchElement: false)],
        [Setting(icon: UIImage(systemName: "faceid"), title: "Face ID & Passcode", switchElement: false)],
        [Setting(icon: UIImage(systemName: "sos"), title: "Emergency SOS", switchElement: false)],
        [Setting(icon: UIImage(systemName: "microbe.fill"), title: "Exposure Notifications", switchElement: false)],
        [Setting(icon: UIImage(systemName: "battery.100"), title: "Battery", switchElement: false)],
        [Setting(icon: UIImage(systemName: "hand.raised.fill"), title: "Privacy & Security", switchElement: false)]
        
    ]
}
