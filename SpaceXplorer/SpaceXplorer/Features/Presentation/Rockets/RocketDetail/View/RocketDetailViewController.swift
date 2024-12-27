//
//  RocketDetailViewController.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 21/12/24.
//

import UIKit

class RocketDetailViewController: UIViewController {
    
    // MARK: - Properties
    let rocket: RocketModel
    var mainCoordinator: MainCoordinator?
    
    private lazy var imagesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height * 0.4)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.register(RocketImageCell.self, forCellWithReuseIdentifier: RocketImageCell.reuseIdentifier)
        return collectionView
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .leading
        
        let labels = createInfoLabels()
        labels.forEach { stackView.addArrangedSubview($0) }
        return stackView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Initializer
    init(rocket: RocketModel) {
        self.rocket = rocket
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = traitCollection.userInterfaceStyle == .dark ? .black : .white
        
        setupNavigationBar()
        setupView()
    }
    
    // MARK: - Setup Methods
    private func setupNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = rocket.name
    }
    
    private func setupView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imagesCollectionView)
        contentView.addSubview(infoStackView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // ScrollView
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // ContentView dentro del ScrollView
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // CollectionView para las imágenes
            imagesCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imagesCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imagesCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imagesCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
            // InfoStackView
            infoStackView.topAnchor.constraint(equalTo: imagesCollectionView.bottomAnchor, constant: 16),
            infoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            infoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            infoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    private func createInfoLabels() -> [UILabel] {
        return [
            createLabel(title: "Description", value: rocket.description),
            createLabel(title: "Height", value: rocket.height),
            createLabel(title: "Diameter", value: rocket.diameter),
            createLabel(title: "Mass", value: rocket.mass),
            createLabel(title: "First Flight", value: rocket.firstFlight),
            createLabel(title: "Country", value: rocket.country),
            createLabel(title: "Company", value: rocket.company),
            createLabel(title: "Cost Per Launch", value: rocket.costPerLaunch),
            createLabel(title: "Success Rate", value: rocket.successRate),
            createLabel(title: "Active Status", value: rocket.activeStatus)
        ]
    }
    
    private func createLabel(title: String, value: String) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "\(title): \(value)"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }
}

// MARK: - UICollectionView DataSource & Delegate
extension RocketDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rocket.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RocketImageCell.reuseIdentifier, for: indexPath) as? RocketImageCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: rocket.images[indexPath.row])
        return cell
    }
}

// MARK: - RocketImageCell
class RocketImageCell: UICollectionViewCell {
    static let reuseIdentifier = "RocketImageCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard let data = data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self?.imageView.image = image
            }
        }.resume()
    }
}
