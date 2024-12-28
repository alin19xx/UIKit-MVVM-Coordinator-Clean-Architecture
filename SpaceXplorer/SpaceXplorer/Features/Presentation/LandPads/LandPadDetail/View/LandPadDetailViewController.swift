//
//  LandPadDetailViewController.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 22/12/24.
//

import UIKit
import MapKit

class LandPadDetailViewController: UIViewController {
    private let landPad: LandPadModel
    var mainCoordinator: MainCoordinator?

    // MARK: - UI Elements
    private let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.mapType = .standard
        return mapView
    }()

    private let modalView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 16
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 0, height: -2)
        return view
    }()

    private let dragIndicator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 3
        return view
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            nameLabel,
            fullNameLabel,
            locationLabel,
            statusLabel,
            attemptsLabel,
            successRateLabel,
            detailsLabel,
            wikipediaButton
        ])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.numberOfLines = 0
        return label
    }()

    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .darkGray
        return label
    }()

    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 16)
        label.textColor = .lightGray
        return label
    }()

    private let statusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        return label
    }()

    private let attemptsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        return label
    }()

    private let successRateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .systemGreen
        return label
    }()

    private let detailsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .darkGray
        return label
    }()

    private let wikipediaButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("View on Wikipedia", for: .normal)
        button.addTarget(self, action: #selector(openWikipedia), for: .touchUpInside)
        return button
    }()

    // MARK: - Constraints
    private var modalHeightConstraint: NSLayoutConstraint!
    private let collapsedHeight: CGFloat = 300
    private let expandedHeight: CGFloat = UIScreen.main.bounds.height * 0.8

    // MARK: - Initialization
    init(landPad: LandPadModel) {
        self.landPad = landPad
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configureWithModel()
    }

    // MARK: - Setup UI
    private func setupUI() {
        view.addSubview(mapView)
        view.addSubview(modalView)
        
        modalView.addSubview(imageView)
        modalView.addSubview(dragIndicator)
        modalView.addSubview(infoStackView)
        
        setupConstraints()

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        modalView.addGestureRecognizer(panGesture)
        modalView.backgroundColor = traitCollection.userInterfaceStyle == .dark ? .black : .white
        
        updateModalContent(for: collapsedHeight)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            modalView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            modalView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            modalView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            dragIndicator.topAnchor.constraint(equalTo: modalView.topAnchor, constant: 8),
            dragIndicator.centerXAnchor.constraint(equalTo: modalView.centerXAnchor),
            dragIndicator.widthAnchor.constraint(equalToConstant: 40),
            dragIndicator.heightAnchor.constraint(equalToConstant: 6),

            imageView.topAnchor.constraint(equalTo: modalView.topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: 0),
            imageView.heightAnchor.constraint(equalToConstant: 200),

            infoStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            infoStackView.leadingAnchor.constraint(equalTo: modalView.leadingAnchor, constant: 16),
            infoStackView.trailingAnchor.constraint(equalTo: modalView.trailingAnchor, constant: -16),
            infoStackView.bottomAnchor.constraint(equalTo: modalView.bottomAnchor, constant: -48)
        ])

        modalHeightConstraint = modalView.heightAnchor.constraint(equalToConstant: collapsedHeight)
        modalHeightConstraint.isActive = true
    }

    // MARK: - Configure with Model
    private func configureWithModel() {
        nameLabel.text = landPad.name
        fullNameLabel.text = landPad.fullName
        locationLabel.text = landPad.location
        statusLabel.text = "Status: \(landPad.status) (\(landPad.type))"
        attemptsLabel.text = landPad.landingAttempts
        successRateLabel.text = landPad.successRate
        detailsLabel.text = landPad.details

        if let coordinate = parseCoordinates(from: landPad.coordinates) {
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = landPad.name
            annotation.subtitle = landPad.location
            mapView.addAnnotation(annotation)

            let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
            mapView.setRegion(region, animated: true)
        }

        if let imageUrl = landPad.images.first, let url = URL(string: imageUrl) {
            loadImage(from: url, into: imageView)
        }
    }
    
    private func parseCoordinates(from string: String) -> CLLocationCoordinate2D? {
        // Eliminar cualquier espacio adicional
        let cleanedString = string.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Separar en componentes por coma
        let components = cleanedString.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
        
        guard components.count == 2,
              let latComponent = components.first(where: { $0.contains("Lat:") }),
              let longComponent = components.first(where: { $0.contains("Long:") }),
              let latitude = Double(latComponent.replacingOccurrences(of: "Lat:", with: "").trimmingCharacters(in: .whitespaces)),
              let longitude = Double(longComponent.replacingOccurrences(of: "Long:", with: "").trimmingCharacters(in: .whitespaces)) else {
            return nil
        }
        
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    private func loadImage(from url: URL, into imageView: UIImageView) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    imageView.image = image
                }
            }
        }
    }

    // MARK: - Actions
    @objc private func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
            let translation = gesture.translation(in: modalView)
            let velocity = gesture.velocity(in: modalView)

            switch gesture.state {
            case .changed:
                let newHeight = modalHeightConstraint.constant - translation.y
                modalHeightConstraint.constant = max(collapsedHeight, min(expandedHeight, newHeight))
                updateModalContent(for: modalHeightConstraint.constant)
                gesture.setTranslation(.zero, in: modalView)
            case .ended:
                if velocity.y > 0 {
                    modalHeightConstraint.constant = collapsedHeight
                } else {
                    modalHeightConstraint.constant = expandedHeight
                }
                UIView.animate(withDuration: 0.3) {
                    self.view.layoutIfNeeded()
                    self.updateModalContent(for: self.modalHeightConstraint.constant)
                }
            default:
                break
            }
        }

        private func updateModalContent(for height: CGFloat) {
            let isCollapsed = height == collapsedHeight
            fullNameLabel.isHidden = isCollapsed
            locationLabel.isHidden = isCollapsed
            statusLabel.isHidden = isCollapsed
            attemptsLabel.isHidden = isCollapsed
            successRateLabel.isHidden = isCollapsed
            detailsLabel.isHidden = isCollapsed
            wikipediaButton.isHidden = isCollapsed
        }

    @objc private func openWikipedia() {
        UIApplication.shared.open(landPad.wikipedia, options: [:], completionHandler: nil)
    }
}
