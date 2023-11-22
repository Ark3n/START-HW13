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
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: - SetupLayout
    private func setupViews() {
        view = DetailsView()
        navigationController?.navigationBar.tintColor = .black
        title = setting?.title
        detailsView?.configureView(image: setting?.icon)
    }
}
