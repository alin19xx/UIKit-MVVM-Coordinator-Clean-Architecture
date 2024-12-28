//
//  BaseDetailTableViewCell.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 27/12/24.
//

import Foundation
import UIKit

class BaseDetailTableViewCell: UITableViewCell, ReusableCell {
    
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
        view.backgroundColor = .black.withAlphaComponent(0.4)
        return view
    }()
    
    private let launchName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .white
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

extension BaseDetailTableViewCell {
    func configureWith(title: String, image: String) {
        self.launchName.text = title
        self.backgroundImageView.image = nil

        if let imageURL = URL(string: image) {
            fetchRemoteImage(with: imageURL)
        }
        
        setupView()
    }
}
    

// MARK: - Private Methods

extension BaseDetailTableViewCell {
    private func setupView() {
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(overlayView)
        contentView.addSubview(launchName)
        
        setupConstraints()
    }
    
    private func fetchRemoteImage(with url: URL) {
        currentImageURL = url
        
        if let cachedImage = ImageCache.shared.object(forKey: url.absoluteString as NSString) {
            self.backgroundImageView.image = cachedImage
            return
        }
        
        self.backgroundImageView.image = nil
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let self = self,
                  let data = data,
                  let image = UIImage(data: data),
                  self.currentImageURL == url,
                  error == nil else { return }
            
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

extension BaseDetailTableViewCell {
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
            
            launchName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            launchName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            launchName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            launchName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
}
