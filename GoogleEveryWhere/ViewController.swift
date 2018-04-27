//
//  ViewController.swift
//  GoogleEveryWhere
//
//  Created by Jasmee Sengupta on 14/03/18.
//  Copyright © 2018 Jasmee Sengupta. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet fileprivate weak var mapView: GMSMapView!
    let marker = GMSMarker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMapview(center: CLLocationCoordinate2D(latitude: 13.0, longitude: 77))
        enableCurrentLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpMapview(center: CLLocationCoordinate2D) {
        mapView.delegate = self
        let camera = GMSCameraPosition(target: center, zoom: 8.0, bearing: 0.0, viewingAngle: 0)//?
        mapView.camera = camera
        showMarker(position: center)
    }
    
    func showMarker(position: CLLocationCoordinate2D) {
        marker.position = position
        marker.title = "Bangalore"
        marker.snippet = "The city I live in"
        marker.map = mapView
        marker.isDraggable = true
    }
    
    func enableCurrentLocation() {
        mapView.settings.myLocationButton = true
    }
}

extension ViewController: GMSMapViewDelegate {
    // Do not forget to set the delegate to self :)
    
    // MARK: Info window delegates
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        let view = UIView(frame: CGRect.init(x: 0, y: 0, width: 200, height: 70))
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 6
        
        let lbl1 = UILabel(frame: CGRect.init(x: 8, y: 8, width: view.frame.size.width - 16, height: 15))
        lbl1.text = "Hi there!"
        view.addSubview(lbl1)
        
        let lbl2 = UILabel(frame: CGRect.init(x: lbl1.frame.origin.x, y: lbl1.frame.origin.y + lbl1.frame.size.height + 3, width: view.frame.size.width - 16, height: 15))
        lbl2.text = "I am a custom info window."
        lbl2.font = UIFont.systemFont(ofSize: 14, weight: .light)
        view.addSubview(lbl2)
        
        return view
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        print("didTapInfoWindowOf")
    }
    
    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
        print("didLongPressInfoWindowOf")
    }
    
    // MARK: Marker dragging delegates
    
    func mapView(_ mapView: GMSMapView, didBeginDragging marker: GMSMarker) {
        print("didBeginDragging")
    }
    
    func mapView(_ mapView: GMSMapView, didDrag marker: GMSMarker) {
        print("didDrag")
    }
    
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
        print("didEndDragging")
    }
    
    // MARK:
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {// not working
        print("didTapAt")
        marker.position = coordinate
    }
}
