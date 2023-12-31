//
//  SettingCell.swift
//  IOSSettings
//
//  Created by Arken Sarsenov on 31.10.2023.
//

import UIKit
import SnapKit

final class SettingCell: UITableViewCell {

    // MARK: - Properties
    static let identifier = "cell"
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemBlue
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 7
        imageView.tintColor = .white
        imageView.contentMode = .center
        return imageView
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.text = "Airplane Mode"
        return label
    }()

    //MARK: - Cell Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupUI() {
        addSubview(iconImageView)
        addSubview(titleLabel)
    }
    private func setupConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(contentView).offset(10)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(16)
            make.centerY.equalTo(iconImageView.snp.centerY)
        }
    }
   // MARK: - Assign data from Model
    public func fillSeetings(image: UIImage?, title: String, color: UIColor) {
        let imgView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imgView.image = image
        imgView.clipsToBounds = true
        imgView.contentMode = .center
        iconImageView.addSubview(imgView)
        iconImageView.backgroundColor = color
        titleLabel.text = title
    }
}
