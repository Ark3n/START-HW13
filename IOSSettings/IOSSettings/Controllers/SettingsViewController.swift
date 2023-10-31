
//  IOSSettings
//
//  Created by Arken Sarsenov on 31.10.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
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
    }
    
    // SetupUI
    private func setupUI() {
        title = "Settings"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    private func setupContstraints() {
    }
}

// MARK: - UITableView Delegate and Datasource methods
extension SettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}

extension SettingsViewController: UITableViewDelegate {
    
}


