//
//  StarlinkMapViewController.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 26/12/24.
//

import Foundation
import MapKit

class StarlinkMapViewController: BaseViewController<DefaultStarlinkMapViewModel> {
    
    var mainCoordinator: MainCoordinator?
    
    private let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Starlink Satellites"
        
        setupView()
        bindViewModel()
        viewModel.fetchSatellites()
    }

    private func setupView() {
        view.addSubview(mapView)
        mapView.delegate = self
        
        let initialLocation = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        let camera = MKMapCamera(
            lookingAtCenter: initialLocation,
            fromDistance: 10000000,
            pitch: 60,
            heading: 0
        )
        mapView.setCamera(camera, animated: false)
        mapView.showsBuildings = true

        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func bindViewModel() {
        viewModel.model.bind { [weak self] satellites in
            DispatchQueue.main.async {
                self?.addSatellitesToMap(satellites)
            }
        }
    }

    private func addSatellitesToMap(_ satellites: [StarlinkEntity]) {
        mapView.removeAnnotations(mapView.annotations)
        var annotations: [MKPointAnnotation] = []
        
        satellites.forEach { satellite in
            guard let latitude = satellite.latitude, let longitude = satellite.longitude else { return }
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            annotation.title = satellite.name
            annotations.append(annotation)
        }
        
        mapView.addAnnotations(annotations)
        
        if !annotations.isEmpty {
            mapView.showAnnotations(annotations, animated: true)
            
            if let firstAnnotation = annotations.first {
                let camera = MKMapCamera(
                    lookingAtCenter: firstAnnotation.coordinate,
                    fromDistance: 2000000,
                    pitch: 70,
                    heading: 0
                )
                mapView.setCamera(camera, animated: true)
            }
        }
    }
}

extension StarlinkMapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else { return nil }

        let identifier = "SatelliteAnnotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            annotationView?.image = UIImage(named: "starlink_patch")?.resized(to: CGSize(width: 20, height: 20))
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if let annotation = view.annotation {
            print("Tapped on annotation: \(annotation.title ?? "")")
        }
    }
}

extension UIImage {
    func resized(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
