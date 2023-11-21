//
//  DetailViewController.swift
//  IOSSettings
//
//  Created by Arken Sarsenov on 02.11.2023.
//

import UIKit
import SnapKit

final class DetailViewController: UIViewController {
    // MARK: - Properties
    var setting: Setting?
    lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 5
        return imageView
    }()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstrailnts()
    }
    
    // MARK: - SetupLayout
    private func setupViews() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.tintColor = .black
        view.addSubview(imageView)
        let width = view.frame.width - 20
        imageView.layer.cornerRadius = width / 2
        imageView.image = setting?.icon
    }
    private func setupConstrailnts() {
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(view.frame.width - 20)
            make.width.equalTo(view.frame.width - 20)
        }
    }
}
