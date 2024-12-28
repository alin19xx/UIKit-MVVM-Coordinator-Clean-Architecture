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
    
    private lazy var dataSource: RocketDetailDataSource = {
        RocketDetailDataSource(
            collectionView: imagesCollectionView,
            model: rocket
        )
    }()
    
    private lazy var delegate: RocketDetailDelegate = {
        RocketDetailDelegate(pageControl: pageControl)
    }()

    private lazy var imagesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height * 0.4)
        layout.minimumLineSpacing = 0

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    private let pageControl: UIPageControl = {
        let control = UIPageControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.currentPageIndicatorTintColor = .systemBlue
        control.pageIndicatorTintColor = .lightGray
        return control
    }()

    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 16

        let descriptionLabel = createLabel(title: "Description", value: rocket.description)
        stackView.addArrangedSubview(descriptionLabel)

        let statsView = createStatsView()
        stackView.addArrangedSubview(statsView)

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
        view.backgroundColor = .systemBackground

        setupNavigationBar()
        setupView()
    }

    // MARK: - Setup Methods
    private func setupNavigationBar() {
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = rocket.name
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .action,
            target: self,
            action: #selector(shareRocketInfo)
        )
    }

    private func setupView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imagesCollectionView)
        contentView.addSubview(pageControl)
        contentView.addSubview(infoStackView)

        setupConstraints()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        imagesCollectionView.delegate = delegate
        imagesCollectionView.dataSource = dataSource
        dataSource.registerCells()
        
        pageControl.numberOfPages = rocket.images.count
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // ScrollView
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            // ContentView
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            // CollectionView
            imagesCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imagesCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imagesCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imagesCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),

            // PageControl
            pageControl.topAnchor.constraint(equalTo: imagesCollectionView.bottomAnchor, constant: 8),
            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            // InfoStackView
            infoStackView.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 16),
            infoStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            infoStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            infoStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }

    // MARK: - Helpers
    private func createLabel(title: String, value: String) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "\(title): \(value)"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .label
        return label
    }

    private func createStatsView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        let successRateLabel = createLabel(title: "Success Rate", value: "\(rocket.successRate)")
        let costPerLaunchLabel = createLabel(title: "Cost Per Launch", value: "\(rocket.costPerLaunch)")

        let stack = UIStackView(arrangedSubviews: [successRateLabel, costPerLaunchLabel])
        stack.axis = .horizontal
        stack.spacing = 16
        stack.distribution = .fillEqually

        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.topAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        return view
    }

    @objc private func shareRocketInfo() {
        let shareText = "\(rocket.name): \(rocket.description)"
        let activityVC = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
}


// MARK: - RocketImageCell (TODO: Move to another file)
class RocketImageCell: UICollectionViewCell, ReusableCell {
    
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
