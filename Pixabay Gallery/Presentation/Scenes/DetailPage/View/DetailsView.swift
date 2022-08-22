//
//  DetailsView.swift
//  Pixabay Gallery
//
//  Created by CodergirlTM on 19.08.22.
//

import UIKit
import SnapKit

class DetailsView: UIView {
    
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let firstSectionStackView = UIStackView()
    private let imageView = UIImageView()
    private let imageSize = UILabel()
    private let imageType = UILabel()
    private let imageTag = UILabel()
    
    private let secondSectionStackView = UIStackView()
    private let imageAuth = UILabel()
    private let numberOfViews = UILabel()
    private let numberOfLikes = UILabel()
    private let numberOfComments = UILabel()
    private let numberOfDownloads = UILabel()
    
    
    private let loginTitleLabel = UILabel()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private let datePicker: UIDatePicker = UIDatePicker()
    private let signUpButton = UIButton()
    private let errorLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        
        self.setup()
        self.style()
        self.setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.addSubview(self.scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(firstSectionStackView)
        contentView.addSubview(secondSectionStackView)
        contentView.addSubview(imageView)
        firstSectionStackView.addArrangedSubview(imageSize)
        firstSectionStackView.addArrangedSubview(imageTag)
        firstSectionStackView.addArrangedSubview(imageType)
        secondSectionStackView.addArrangedSubview(imageAuth)
        secondSectionStackView.addArrangedSubview(numberOfViews)
        secondSectionStackView.addArrangedSubview(numberOfLikes)
        secondSectionStackView.addArrangedSubview(numberOfComments)
        secondSectionStackView.addArrangedSubview(numberOfDownloads)
    }
    
    func style() {
        [firstSectionStackView, secondSectionStackView].forEach {
            $0.axis = .vertical
            $0.distribution = .fillEqually
            $0.alignment = .fill
            $0.spacing = 10.0
        }
    }
    
    func setupConstraints() {
        [scrollView, contentView, firstSectionStackView, secondSectionStackView, imageView, imageSize, imageType, imageTag, imageAuth, numberOfLikes, numberOfViews, numberOfComments, numberOfDownloads].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.centerX.equalTo(self)
            make.width.equalTo(self.snp.width)
            make.bottom.equalTo(self)
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top)
            make.width.equalTo(scrollView.snp.width)
            make.bottom.equalTo(scrollView.snp.bottom)
            make.centerX.equalTo(scrollView.snp.centerX)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(20 * Constraints.yCoeff)
            make.leading.equalTo(contentView).offset(24 * Constraints.xCoeff)
            make.trailing.equalTo(contentView).offset(-24 * Constraints.xCoeff)
            make.height.equalTo(200 * Constraints.yCoeff)
        }
        
        firstSectionStackView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10 * Constraints.yCoeff)
            make.leading.equalTo(contentView).offset(24 * Constraints.xCoeff)
            make.trailing.equalTo(contentView).offset(-24 * Constraints.xCoeff)
        }
        
        secondSectionStackView.snp.makeConstraints { make in
            make.top.equalTo(firstSectionStackView.snp.bottom).offset(40 * Constraints.yCoeff)
            make.leading.equalTo(contentView).offset(24 * Constraints.xCoeff)
            make.trailing.equalTo(contentView).offset(-24 * Constraints.xCoeff)
        }

        
    }
    
    func showData(pixabayData: PixabayImage) {
        imageView.kf.setImage(with: URL(string: pixabayData.previewURL ?? ""))
        imageSize.text = "Image size: \(pixabayData.imageSize ?? 0)"
        imageTag.text = "Image tags: \(pixabayData.tags ?? "")"
        imageAuth.text = "Image Author: \(pixabayData.user ?? "")"
        imageType.text = "Image type: \(pixabayData.type ?? "")"
        numberOfViews.text = "Number of views: \(pixabayData.views ?? 0)"
        numberOfComments.text = "Number of comments: \(pixabayData.comments ?? 0)"
        numberOfDownloads.text = "Number of downloads: \(pixabayData.downloads ?? 0)"
    }
}


