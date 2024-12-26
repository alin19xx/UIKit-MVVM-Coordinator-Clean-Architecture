//
//  BaseViewController.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 24/12/24.
//

import UIKit

class BaseViewController<ViewModel: BaseViewModelProtocol>: UIViewController {
    
    var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let overlayView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.isHidden = true
        return view
    }()

    private let loadingSpinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        return spinner
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupSpinnerOverlay()
        bindViewModel()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.bringSubviewToFront(overlayView)
    }
    
    private func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self else { return }
            if isLoading {
                self.showLoadingSpinner()
            } else {
                self.hideLoadingSpinner()
            }
        }
    }

    // MARK: - Setup Methods
    private func setupView() {
        view.backgroundColor = traitCollection.userInterfaceStyle == .dark ? .black : .white
    }

    private func setupSpinnerOverlay() {
        view.addSubview(overlayView)
        overlayView.addSubview(loadingSpinner)

        NSLayoutConstraint.activate([
            overlayView.topAnchor.constraint(equalTo: view.topAnchor),
            overlayView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            overlayView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            loadingSpinner.centerXAnchor.constraint(equalTo: overlayView.centerXAnchor),
            loadingSpinner.centerYAnchor.constraint(equalTo: overlayView.centerYAnchor)
        ])
    }

    // MARK: - Spinner Control
    func showLoadingSpinner() {
        DispatchQueue.main.async {
            self.overlayView.isHidden = false
            self.loadingSpinner.startAnimating()
        }
    }

    func hideLoadingSpinner() {
        DispatchQueue.main.async {
            self.overlayView.isHidden = true
            self.loadingSpinner.stopAnimating()
        }
    }

    // MARK: - Dark/Light Mode Support
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        guard traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) else { return }
        updateAppearanceForCurrentMode()
    }

    private func updateAppearanceForCurrentMode() {
        view.backgroundColor = traitCollection.userInterfaceStyle == .dark ? .black : .white
    }

    // MARK: - Error or Toast (wip)
    func showErrorToast(message: String) {
        let toastLabel = UILabel()
        toastLabel.text = message
        toastLabel.textAlignment = .center
        toastLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        toastLabel.textColor = .white
        toastLabel.numberOfLines = 0
        toastLabel.layer.cornerRadius = 8
        toastLabel.clipsToBounds = true
        toastLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(toastLabel)
        NSLayoutConstraint.activate([
            toastLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            toastLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            toastLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            toastLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 40)
        ])

        UIView.animate(withDuration: 0.3, delay: 2, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0
        }, completion: { _ in
            toastLabel.removeFromSuperview()
        })
    }
}
