//
//  SettingModel.swift
//  IOSSettings
//
//  Created by Arken Sarsenov on 22.11.2023.
//

import UIKit

struct Setting {
    var icon: UIImage?
    var title: String
    var settingState: String?
    var switchElement: Bool
    var color: UIColor = .systemBlue
}
