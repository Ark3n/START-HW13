
//  IOSSettings
//
//  Created by Arken Sarsenov on 31.10.2023.
//

import UIKit

final class SettingsController: UIViewController {
    
    // MARK: - Properties
    var settingsGroup = SettingsGroup.allGroup()
    let settingsView = SettingsView()
    
    override func loadView() {
        view = settingsView
    }
    
    // MARK: - View lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: -  SetupUI
    private func setupUI() {
        settingsView.delegate = self
        settingsView.configureView(with: settingsGroup)
        title = "Settings"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension SettingsController: SettingsViewDelegateProtocol {
    func settingDidSelect(setting: Setting) {
        let vc = DetailController()
        vc.setting = setting
        navigationController?.pushViewController(vc, animated: true)
    }
}
