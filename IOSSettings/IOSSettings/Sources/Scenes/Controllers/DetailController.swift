//
//  DetailViewController.swift
//  IOSSettings
//
//  Created by Arken Sarsenov on 02.11.2023.
//

import UIKit
import SnapKit

final class DetailController: UIViewController {
    // MARK: - Properties
    var setting: Setting?
    private var detailsView: DetailsView? {
        guard isViewLoaded else { return nil}
        return view as? DetailsView
    }
    
    override func loadView() {
        view = DetailsView()
    }
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        setupViews()
    }
    
    private func configureNavigation() {
        navigationController?.navigationBar.tintColor = .black
        title = setting?.title
    }
    
    // MARK: - SetupLayout
    private func setupViews() {
        detailsView?.configureView(image: setting?.icon)
    }
}
