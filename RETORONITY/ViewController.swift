//
//  ViewController.swift
//  RETONITY
//
//  Created by Yushi Nakaya on 2019/06/22.
//  Copyright © 2019 Yushi Nakaya. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, GMSMapViewDelegate {

    @IBOutlet weak var mapView: GMSMapView!
    var tappedMarker : GMSMarker?
    var customInfoWindow : CustomInfoWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: 38.2787352, longitude: 140.82,zoom: 10)
        mapView.camera = camera
       
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude:  38.2187352, longitude: 140.5917818)
        
        marker.title = "焼鳥 美濃"
        marker.map = self.mapView
        
        
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude: 38.2787352, longitude: 140.82)
        
        marker2.title = "Var Taro"
        marker2.map = self.mapView
        
        
        let marker3 = GMSMarker()
        marker3.position = CLLocationCoordinate2D(latitude: 38.2887352, longitude: 140.82)
        
        marker3.title = "牛タン 阪田"
        marker3.map = self.mapView
        
        let marker4 = GMSMarker()
        marker4.position = CLLocationCoordinate2D(latitude: 38.1887352, longitude: 140.82)
        
        marker4.title = "牛タン 山田"
        marker4.map = self.mapView
        
        
        let marker5 = GMSMarker()
        marker5.position = CLLocationCoordinate2D(latitude: 38.2787352, longitude: 140.81)
        
        marker5.title = "喫茶 べんちゃん"
        marker5.map = self.mapView
        
        
        // Do any additional setup after loading the view.
        self.mapView.delegate = self
        self.tappedMarker = GMSMarker()
        self.customInfoWindow = CustomInfoWindow().loadView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        NSLog("ようこそ！")
        tappedMarker = marker
        
        let position = marker.position
        mapView.animate(toLocation: position)
        let point = mapView.projection.point(for: position)
        let newPoint = mapView.projection.coordinate(for: point)
        let camera = GMSCameraUpdate.setTarget(newPoint)
        mapView.animate(with: camera)
        
        let opaqueWhite = UIColor(white: 1, alpha: 0.85)
        customInfoWindow?.layer.backgroundColor = opaqueWhite.cgColor
        customInfoWindow?.layer.cornerRadius = 8
        customInfoWindow?.center = mapView.projection.point(for: position)
        self.mapView.addSubview(customInfoWindow!)
        
        return false
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        customInfoWindow?.removeFromSuperview()
    }
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        let position = tappedMarker?.position
        customInfoWindow?.center = mapView.projection.point(for: position!)
        customInfoWindow?.center.y -= 140
    }
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        //return self.customInfoWindow[
        return UIView()
    }
    
   

}

