//
//  HomeTableViewCell.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 17/12/24.
//

import UIKit

class HomeTableViewCell: UITableViewCell, ReusableCell {
    
    private(set) var sectionImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 8
        image.layer.masksToBounds = true
        
        return image
    }()
    
    private(set) var sectionName: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        
        return label
    }()
    
    private(set) var sectionDescription: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .light)
        
        return label
    }()
    
    func configureWith(model: HomeSection) {
        self.sectionName.text = model.title
        self.sectionDescription.text = model.subtitle
        self.sectionImage.image = UIImage(systemName: model.icon)
//        fetchRemoteImage(with: URL(string: model.image))
        
        setupView()
        contentView.layoutIfNeeded()
    }
    
    private func setupView() {
        contentView.addSubview(sectionImage)
        contentView.addSubview(sectionName)
        contentView.addSubview(sectionDescription)
        
        setupConstraints()
    }
    
    private func fetchRemoteImage(with url: URL?) {
        if let url = url {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async {
                    self.sectionImage.image = UIImage(data: data)
                }
            }
            
            task.resume()
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            sectionImage.widthAnchor.constraint(equalToConstant: 84),
            sectionImage.heightAnchor.constraint(equalToConstant: 84),
            sectionImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            sectionImage.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 8),
            sectionImage.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8),
            
            sectionName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            sectionName.leadingAnchor.constraint(equalTo: sectionImage.trailingAnchor, constant: 16),
            sectionName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            sectionDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            sectionDescription.leadingAnchor.constraint(equalTo: sectionImage.trailingAnchor, constant: 16),
            sectionDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
