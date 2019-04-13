//
//  MapViewController.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2018-11-19.
//  Copyright © 2018 Domenic Bianchi. All rights reserved.
//

import UIKit
import GoogleMaps

final class MapViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private var mapView: GMSMapView!
    
    // MARK: - Properties
    private let viewModel = MapViewModel()
    private let locationManager = CLLocationManager()
    private var resultSearchController: UISearchController? = nil
    private var markers: [GMSMarker] = []
    
    // MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let styleURL = Bundle.main.url(forResource: "mapStyle", withExtension: "json") {
            mapView.mapStyle = try? GMSMapStyle(contentsOfFileURL: styleURL)
        }
        
        if let locationSearchController = storyboard?.instantiateViewController(withIdentifier: "searchViewController") as? LocationSearchViewController {
            locationSearchController.locations = viewModel.locations
            resultSearchController = UISearchController(searchResultsController: locationSearchController)
            resultSearchController?.searchResultsUpdater = locationSearchController
            locationSearchController.delegate = self
            
            let searchBar = resultSearchController?.searchBar
            searchBar?.placeholder = "Search for locations"
            searchBar?.sizeToFit()
            
            resultSearchController?.hidesNavigationBarDuringPresentation = false
            resultSearchController?.dimsBackgroundDuringPresentation = true
            definesPresentationContext = true
            
            navigationItem.searchController = resultSearchController
        }

        if CLLocationManager.locationServicesEnabled() && (CLLocationManager.authorizationStatus() == .authorizedAlways || CLLocationManager.authorizationStatus() == .authorizedWhenInUse) {
            mapView.isMyLocationEnabled = true
            mapView.settings.compassButton = true
            mapView.settings.myLocationButton = true
        }

        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        var bounds = GMSCoordinateBounds()

        for location in viewModel.locations {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
            marker.title = location.name
            marker.icon = GMSMarker.markerImage(with: location.tintColor)
            //marker.snippet = "Australia"
            marker.map = mapView
            marker.userData = location.id
            
            markers.append(marker)

            bounds = bounds.includingCoordinate(marker.position)
        }

        mapView.animate(with: GMSCameraUpdate.fit(bounds, withPadding: 50))
    }
}


// MARK: - CLLocationManagerDelegate
extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            mapView.isMyLocationEnabled = true
            mapView.settings.compassButton = true
            mapView.settings.myLocationButton = true
        } else {
            mapView.isMyLocationEnabled = true
            mapView.settings.compassButton = false
            mapView.settings.myLocationButton = false
        }
    }
}

// MARK: - LocationDelegate
extension MapViewController: LocationDelegate {
    func selected(locationId: Int) {
        guard let newSelectedMarker = markers.first(where: { $0.userData as? Int == locationId }) else {
            return
        }
        mapView.selectedMarker = newSelectedMarker
        mapView.camera = GMSCameraPosition.camera(withTarget: newSelectedMarker.position, zoom: 16.5)
    }
}
