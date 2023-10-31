
//  IOSSettings
//
//  Created by Arken Sarsenov on 31.10.2023.
//

import UIKit

final class SettingsViewController: UIViewController {

    // MARK: - Properties
    var settingsGroup: [SettingsGroup]?
    let cell = "cell"
    let cellWithSwitch = "cellWithSwitch"
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SettingCell.self, forCellReuseIdentifier: cell)
        tableView.register(SettingCellWithSwitch.self, forCellReuseIdentifier: cellWithSwitch)
        tableView.dataSource = self
        tableView.delegate  = self
       return tableView
    }()
    
    // MARK: - View lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupContstraints()
        settingsGroup = SettingsGroup.allGroup()
    }
    
    // MARK: -  SetupUI
    private func setupUI() {
        title = "Settings"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(tableView)
    }
    private func setupContstraints() {
        tableView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
    }
}

// MARK: - UITableView Delegate and Datasource methods
extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        settingsGroup?.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsGroup?[section].settings.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let isCellWithSwitch = settingsGroup?[indexPath.section].settings[indexPath.row].switchElement {
            if isCellWithSwitch {
                guard let cellWithSwitch = tableView.dequeueReusableCell(withIdentifier: cellWithSwitch, for: indexPath) as? SettingCellWithSwitch,
                      let title = settingsGroup?[indexPath.section].settings[indexPath.row].title,
                      let icon = settingsGroup?[indexPath.section].settings[indexPath.row].icon,
                      let color = settingsGroup?[indexPath.section].settings[indexPath.row].color
                else { return UITableViewCell() }
                cellWithSwitch.fillSeetings(image: icon, title: title, color: color)
                cellWithSwitch.accessoryType = .disclosureIndicator
                return cellWithSwitch
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath) as? SettingCell,
                      let title = settingsGroup?[indexPath.section].settings[indexPath.row].title,
                      let icon = settingsGroup?[indexPath.section].settings[indexPath.row].icon,
                      let color = settingsGroup?[indexPath.section].settings[indexPath.row].color,
                      let state = settingsGroup?[indexPath.section].settings[indexPath.row].settingState
                else { return UITableViewCell() }
                cell.fillSeetings(image: icon, title: title, color: color, state: state)
                cell.accessoryType = .disclosureIndicator
                return cell
            }
        }
        return UITableViewCell()
    }
}
extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
