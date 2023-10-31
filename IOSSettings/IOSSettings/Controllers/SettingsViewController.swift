
//  IOSSettings
//
//  Created by Arken Sarsenov on 31.10.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
    var settingsGroup: [SettingsGroup]?
    let cell = "cell"
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SettingCell.self, forCellReuseIdentifier: cell)
        tableView.dataSource = self
        tableView.delegate  = self
       return tableView
    }()
    
    // MARK: - Properties
    
    // MARK: - View lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupContstraints()
        settingsGroup = SettingsGroup.allGroup()
    }
    
    // SetupUI
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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath) as? SettingCell,
              let title = settingsGroup?[indexPath.section].settings[indexPath.row].title,
              let icon = settingsGroup?[indexPath.section].settings[indexPath.row].icon
        else {
            return UITableViewCell()
        }
        cell.fillSeetings(image: icon, title: title)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        45
    }
}


