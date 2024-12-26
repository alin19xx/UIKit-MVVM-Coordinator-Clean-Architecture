//
//  DragonDetailViewController.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 22/12/24.
//

import UIKit

final class DragonDetailViewController: BaseViewController<DefaultDragonListViewModel> {

    // MARK: - Properties
    var mainCoordinator: MainCoordinator?
    
    private let dragon: DragonModel
    private let tableView = UITableView(frame: .zero, style: .grouped)
    private let imageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 250)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    // MARK: - Initialization
    init(dragon: DragonModel) {
        self.dragon = dragon
        super.init(viewModel: DefaultDragonListViewModel())
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
        setupCollectionView()
    }

    // MARK: - Setup Methods
    private func setupView() {
        title = dragon.name
        
        view.addSubview(imageCollectionView)
        view.addSubview(tableView)
        
        setupConstraints()
    }

    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DetailCell")
        tableView.register(ThrusterCell.self, forCellReuseIdentifier: ThrusterCell.identifier)
    }

    private func setupCollectionView() {
        imageCollectionView.dataSource = self
        imageCollectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.identifier)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageCollectionView.heightAnchor.constraint(equalToConstant: 250),

            tableView.topAnchor.constraint(equalTo: imageCollectionView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension DragonDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6 // Number of sections for organized data
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1 // General Information
        case 1: return 1 // Heat Shield
        case 2: return 1 // Cargo
        case 3: return dragon.thrusters.count // Thrusters
        case 4: return 1 // Payload
        case 5: return 1 // External Links
        default: return 0
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "General Information"
        case 1: return "Heat Shield"
        case 2: return "Cargo"
        case 3: return "Thrusters"
        case 4: return "Payloads"
        case 5: return "External Links"
        default: return nil
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath)
        cell.selectionStyle = .none
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = """
            Type: \(dragon.type)
            First Flight: \(dragon.firstFlight)
            Active: \(dragon.activeStatus)
            Crew Capacity: \(dragon.crewCapacity)
            """
        case 1:
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = """
            Material: \(dragon.heatShield.material)
            Size: \(dragon.heatShield.size)
            Temperature: \(dragon.heatShield.tempDegrees)
            Developer Partner: \(dragon.heatShield.devPartner)
            """
        case 2:
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = """
            Solar Array: \(dragon.cargo.solarArray)
            Unpressurized Cargo: \(dragon.cargo.unpressurizedCargo)
            """
        case 3:
            let thruster = dragon.thrusters[indexPath.row]
            guard let thrusterCell = tableView.dequeueReusableCell(withIdentifier: ThrusterCell.identifier, for: indexPath) as? ThrusterCell else {
                return cell
            }
            thrusterCell.configure(with: thruster)
            return thrusterCell
        case 4:
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = """
            Launch Payload Mass: \(dragon.launchPayloadMass)
            Launch Payload Volume: \(dragon.launchPayloadVol)
            Return Payload Mass: \(dragon.returnPayloadMass)
            Return Payload Volume: \(dragon.returnPayloadVol)
            Pressurized Capsule Volume: \(dragon.pressurizedCapsuleVolume)
            Trunk Volume: \(dragon.trunkVolume)
            """
        case 5:
            cell.textLabel?.textColor = .systemBlue
            cell.textLabel?.text = "Wikipedia"
        default:
            break
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 5 {
            UIApplication.shared.open(dragon.wikipedia)
        }
    }
}

extension DragonDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dragon.flickrImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as? ImageCell else {
            return UICollectionViewCell()
        }
        let imageUrl = dragon.flickrImages[indexPath.row]
        cell.configure(with: imageUrl)
        return cell
    }
}


final class ImageCell: UICollectionViewCell {
    static let identifier = "ImageCell"
    
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
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with imageUrl: String) {
        if let url = URL(string: imageUrl) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: url),
                   let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.imageView.image = image
                    }
                }
            }
        }
    }
}

final class ThrusterCell: UITableViewCell {
    static let identifier = "ThrusterCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with thruster: ThrusterModel) {
        label.text = """
        Type: \(thruster.type)
        Amount: \(thruster.amount)
        Pods: \(thruster.pods)
        ISP: \(thruster.isp)
        Fuel 1: \(thruster.fuel1)
        Fuel 2: \(thruster.fuel2)
        Thrust: \(thruster.thrust)
        """
    }
}
