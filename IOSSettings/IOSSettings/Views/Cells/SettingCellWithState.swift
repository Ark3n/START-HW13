//
//  SeetingCellWithState.swift
//  IOSSettings
//
//  Created by Arken Sarsenov on 31.10.2023.
//

import UIKit
import SnapKit

final class SettingCellWithState: UITableViewCell {

    // MARK: - Properties
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemBlue
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        imageView.tintColor = .white
        imageView.image = UIImage(systemName: "personalhotspot")
        imageView.contentMode = .center
        return imageView
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.text = "Airplane Mode"
        return label
    }()
    private lazy var stateLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .body)
        label.textColor = .systemGray
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
        addSubview(stateLabel)
    }
    private func setupConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(contentView).offset(10)
            make.height.equalTo(35)
            make.width.equalTo(30)
        }
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(16)
            make.centerY.equalTo(iconImageView.snp.centerY)
        }
        
        stateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(iconImageView.snp.centerY)
            make.right.equalTo(contentView.snp.right).offset(-20)
        }
    }
   // MARK: - Assign data from Model
    public func fillSeetings(image: UIImage?, title: String, color: UIColor, state: String) {
        iconImageView.image = image
        iconImageView.backgroundColor = color
        titleLabel.text = title
        stateLabel.text = state
    }
}
