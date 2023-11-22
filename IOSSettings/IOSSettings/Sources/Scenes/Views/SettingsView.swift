//
//  SettingsView.swift
//  IOSSettings
//
//  Created by Arken Sarsenov on 22.11.2023.
//

import UIKit
import SnapKit

// MARK: - SettingsView Delegate Protocol
protocol SettingsViewDelegateProtocol: AnyObject {
    func settingDidSelect(setting: Setting)
}

final class SettingsView: UIView {
    
    // MARK: - Properties
    var settingsGroup: [SettingsGroup] = []
    
    weak var delegate: SettingsViewDelegateProtocol?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(SettingCell.self, forCellReuseIdentifier: SettingCell.identifier)
        tableView.register(SettingCellWithSwitch.self, forCellReuseIdentifier: SettingCellWithSwitch.identifier)
        tableView.register(SettingCellWithState.self, forCellReuseIdentifier: SettingCellWithState.identifier)
        tableView.dataSource = self
        tableView.delegate  = self
        return tableView
    }()
    
    // MARK: - View Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupContstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: -  SetupUI
    private func setupUI() {
        addSubview(tableView)
    }
    private func setupContstraints() {
        tableView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
    public func configureView(with settings: [SettingsGroup]) {
        settingsGroup = settings
    }
}

// MARK: - UITableView Delegate and Datasource methods
extension SettingsView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        settingsGroup.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsGroup[section].settings.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let setting = settingsGroup[indexPath.section].settings[indexPath.row]
        if setting.switchElement == true {
            guard let cellWithSwitch = tableView.dequeueReusableCell(withIdentifier: SettingCellWithSwitch.identifier, for: indexPath) as? SettingCellWithSwitch else { return UITableViewCell() }
            cellWithSwitch.fillSeetings(image: setting.icon, title: setting.title, color: setting.color)
            return cellWithSwitch
        }
        if let settingState = setting.settingState {
            guard let cellWithState = tableView.dequeueReusableCell(withIdentifier: SettingCellWithState.identifier, for: indexPath) as? SettingCellWithState else { return UITableViewCell() }
            cellWithState.fillSeetings(image: setting.icon, title: setting.title, color: setting.color, state: settingState)
            cellWithState.accessoryType = .disclosureIndicator
            return cellWithState
        }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingCell.identifier, for: indexPath) as? SettingCell else { return UITableViewCell() }
        cell.fillSeetings(image: setting.icon, title: setting.title, color: setting.color)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
extension SettingsView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let setting = settingsGroup[indexPath.section].settings[indexPath.row]
        print("DEBUG: нажата ячейка \(setting.title)")
        if indexPath != [0, 0] {
            delegate?.settingDidSelect(setting: setting)
        }
    }
}

