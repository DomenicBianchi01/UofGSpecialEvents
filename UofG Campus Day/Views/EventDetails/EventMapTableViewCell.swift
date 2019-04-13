//
//  EventMapTableViewCell.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2018-11-18.
//  Copyright © 2018 Domenic Bianchi. All rights reserved.
//

import UIKit
import MapKit

class EventMapTableViewCell: UITableViewCell, EventViewModelable {
    // MARK: - IBOutlets
    @IBOutlet private var eventLocation: UILabel!
    @IBOutlet private var eventMap: MKMapView!
    
    // MARK: - Properties
    var viewModel: EventViewModel? {
        didSet {
            refreshCell()
        }
    }
    
    // MARK: - Lifecycle Functions
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Helper Functions
    private func refreshCell() {
        guard let viewModel = viewModel else {
            return
        }
        
        eventLocation.text = viewModel.event.location
        
        var annotations: [MKPointAnnotation] = []
        
        for (latitude, longitude) in zip(viewModel.event.latitude, viewModel.event.longitude) {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            annotations.append(annotation)
        }
        
        if annotations.count == 1 {
            let span = MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: annotations.first!.coordinate.latitude, longitude: annotations.first!.coordinate.longitude), span: span)
            
            eventMap.addAnnotations(annotations)
            eventMap.setRegion(region, animated: false)
        } else {
            eventMap.showAnnotations(annotations, animated: false)
        }
        
        eventMap.layer.cornerRadius = 5
    }
}
