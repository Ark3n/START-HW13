//
//  DetailsView.swift
//  IOSSettings
//
//  Created by Arken Sarsenov on 22.11.2023.
//

import UIKit
import SnapKit

final class DetailsView: UIView {
    // MARK: - Properties
    lazy var imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 5
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstrailnts()
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetupLayout
    private func setupViews() {
        addSubview(imageView)
    }
    private func setupConstrailnts() {
        imageView.snp.makeConstraints { make in
            let width = 200
            make.center.equalToSuperview()
            make.height.equalTo(width)
            make.width.equalTo(width)
        }
    }
    
    public func configureView(image: UIImage?) {
        imageView.image = image
    }
}
