//
//  BaseTableViewCell.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 27/12/24.
//

import Foundation
import UIKit

class BaseTableViewCell: UITableViewCell, ReusableCell {
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let overlayView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private var currentImageURL: URL?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        backgroundImageView.image = nil
        currentImageURL = nil
    }
}


// MARK: - Public Methods

extension BaseTableViewCell {
    func configureWith(title: String, description: String? = nil, imageURL: String? = nil) {
        self.titleLabel.text = title
        self.descriptionLabel.text = description
        
        if let imageURLString = imageURL, let imageURL = URL(string: imageURLString) {
            fetchRemoteImage(with: imageURL)
        } else {
            self.imageView?.image = nil
        }
        
        setupView()
    }
}


// MARK: - Private Methods

extension BaseTableViewCell {
    private func setupView() {
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(overlayView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        setupConstraints()
    }
    
    private func fetchRemoteImage(with url: URL) {
        currentImageURL = url
        
        if let cachedImage = ImageCache.shared.object(forKey: url.absoluteString as NSString) {
            self.backgroundImageView.image = cachedImage
            return
        }
        
        backgroundImageView.image = nil
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let self = self, let data = data, let image = UIImage(data: data), self.currentImageURL == url, error == nil else {
                return
            }
            
            ImageCache.shared.setObject(image, forKey: url.absoluteString as NSString)
            
            DispatchQueue.main.async {
                self.applyImageWithAnimation(image: image)
            }
        }
        task.resume()
    }
    
    private func applyImageWithAnimation(image: UIImage) {
        UIView.transition(with: self.backgroundImageView, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.backgroundImageView.image = image
        }, completion: nil)
    }
}


// MARK: - Constraints
extension BaseTableViewCell {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            overlayView.topAnchor.constraint(equalTo: contentView.topAnchor),
            overlayView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            overlayView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
