//
//  ViewController.swift
//  MapApp
//
//  Created by  Yeskendir Ayat on 19.03.2021.
//

import UIKit
import MapKit
import CoreData
protocol Changeble {
    func change(index:Int,title:String,subtitle:String)
}
var allLocations:[NSManagedObject] = []
class ViewController: UIViewController , Changeble{
    @IBOutlet weak var Map: MKMapView!
    @IBOutlet weak var locationsTable: UITableView!
    @IBOutlet weak var emptyView: UIView!
    var currentSelect:Int=0
    var types:[Int:MKMapType]=[0:.standard,1:.hybrid,2:.satellite]
    override func viewDidLoad() {
        super.viewDidLoad()
        Map.delegate = self
        reloadData()
        if !allLocations.isEmpty{setMap(location: allLocations[0])}
    }
    func setMap(location: NSManagedObject){
        let loc = CLLocationCoordinate2D(latitude: (location.value(forKey: "latitude") as! Double), longitude: (location.value(forKey: "longitude") as! Double))
        self.Map.setRegion(MKCoordinateRegion(center: loc, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)), animated: true)
        changeNavTitle(sender: (location.value(forKey: "title") as? String)!)
    }
    @IBAction func ChangeType(_ sender: UISegmentedControl) {
        Map.mapType = types[sender.selectedSegmentIndex]!
    }
    func changeNavTitle(sender:String){
        navigationItem.title=sender
    }
    @IBAction func addPoint(_ sender: UILongPressGestureRecognizer) {
        let tuchPoint = sender.location(in: self.Map)
        let coordinate = self.Map.convert(tuchPoint, toCoordinateFrom: self.Map)
        let alertController = UIAlertController(title: "New location", message: "Fill the fields", preferredStyle: .alert)
        alertController.addTextField{(textfield) in textfield.placeholder = "Location"}
        alertController.addTextField{(textfield) in textfield.placeholder = "Description"}
        let save = UIAlertAction(title: "Add", style: .default){[weak self](alert) in
            let  firstTextField = alertController.textFields![0] as UITextField
            let  secondTextField = alertController.textFields![1] as UITextField
            self?.save(title: firstTextField.text!, subtitle: secondTextField.text!, latitude: coordinate.latitude, longitude: coordinate.longitude)
            let annotation = MKPointAnnotation()
            annotation.title = firstTextField.text!
            annotation.subtitle = secondTextField.text!
            annotation.coordinate = coordinate
            self?.Map.addAnnotation(annotation)
        }
        let cacencelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(save)
        alertController.addAction(cacencelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    func save(title:String,subtitle:String,latitude:Double,longitude:Double){
        guard let appDelegate=UIApplication.shared.delegate as? AppDelegate else {return}
        let manageContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Location", in:manageContext)!
        let location = NSManagedObject(entity: entity, insertInto: manageContext)
        location.setValue(title, forKey: "title")
        location.setValue(subtitle, forKey: "subtitle")
        location.setValue(latitude, forKey: "latitude")
        location.setValue(longitude, forKey: "longitude")
        do{
            try manageContext.save()
            allLocations.append(location)
            locationsTable.reloadData()
            changeNavTitle(sender: title)
            setMap(location: location)
        }catch let error as NSError{
            print(error)
            print(error.userInfo)
        }
    }
    func reloadData(){
        guard let appDelegate=UIApplication.shared.delegate as? AppDelegate else {return}
        let manageContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Location>(entityName: "Location")
        do{
            try allLocations = manageContext.fetch(fetchRequest)
            locationsTable.reloadData()
        }catch let error as NSError{
            print(error)
            print(error.userInfo)
        }
        Map.removeAnnotations(self.Map.annotations)
        for i in allLocations{
            let annotation = MKPointAnnotation()
            annotation.title = (i.value(forKey: "title") as! String)
            annotation.subtitle = i.value(forKey: "subtitle") as? String
            annotation.coordinate = CLLocationCoordinate2D(latitude:  i.value(forKey: "latitude") as! Double, longitude: i.value(forKey: "longitude") as! Double)
            Map.addAnnotation(annotation)
        }
    }
    @IBAction func Next(_ sender: Any) {
        if allLocations.isEmpty{return}
        if currentSelect == allLocations.count-1 {
            currentSelect = 0
            setMap(location: allLocations[currentSelect])
        }else{
            currentSelect+=1
            setMap(location: allLocations[currentSelect])
        }
    }
    @IBAction func previuos(_ sender: Any) {
        if allLocations.isEmpty{return}
        if currentSelect == 0 {
            currentSelect = allLocations.count-1
            setMap(location: allLocations[currentSelect])
        }else{
            currentSelect-=1
            setMap(location: allLocations[currentSelect])
        }
    }
    func change(index:Int,title:String,subtitle:String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        let manageContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Location")
        do{
            allLocations = try manageContext.fetch(fetchRequest)
            let tmp = allLocations[index] as NSManagedObject
            tmp.setValue(title, forKey: "title")
            tmp.setValue(subtitle, forKey: "subtitle")
            changeNavTitle(sender: title)
            try! manageContext.save()
            locationsTable.reloadData()
            reloadData()
        }catch let error as NSError{
            print(error)
            print(error.userInfo)
        }
    }
    @IBAction func changeView(_ sender: Any) {
        Map.isHidden = !Map.isHidden
        if !allLocations.isEmpty {
            emptyView.isHidden = !emptyView.isHidden
        }
    }
}
extension ViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "pin"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            annotationView?.animatesDrop = true
            annotationView?.pinTintColor = .blue
            let btn = UIButton(type: .detailDisclosure)
            annotationView?.rightCalloutAccessoryView = btn
        } else { annotationView?.annotation = annotation }
        return annotationView
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let secondViewController = (storyboard?.instantiateViewController(withIdentifier: "DetailStotyBoard"))! as? DetailVC
        secondViewController?.delegate=self
        secondViewController?.annotation = view.annotation
        for i in allLocations{
            if (i.value(forKey: "title") as! String) == view.annotation!.title && (i.value(forKey: "subtitle") as! String) == view.annotation!.subtitle{
                secondViewController?.indexOfAnnotation = allLocations.firstIndex(of:i)
            }
        }
        secondViewController?.annotation=view.annotation!
        navigationController?.pushViewController(secondViewController!, animated: true)
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        for i in allLocations{
            if (i.value(forKey: "title") as! String) == view.annotation!.title && (i.value(forKey: "subtitle") as! String) == view.annotation!.subtitle{
                currentSelect = allLocations.firstIndex(of: i)!
            }
        }
        setMap(location: allLocations[currentSelect])
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationView.DragState, fromOldState oldState: MKAnnotationView.DragState) {
        
    }
    
}


extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allLocations.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text!=allLocations[indexPath.row].value(forKey: "title") as! String
        cell.detailTextLabel?.text!=allLocations[indexPath.row].value(forKey: "subtitle") as! String
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        locationsTable.deselectRow(at: indexPath, animated: true)
        currentSelect = indexPath.row
        setMap(location: allLocations[indexPath.row])
        changeView(0)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
            let manageContext = appDelegate.persistentContainer.viewContext
            manageContext.delete(allLocations[indexPath.row])
            do{
                try manageContext.save()
                locationsTable.reloadData()
            }catch let error as NSError{
                print(error)
                print(error.userInfo)
            }
            allLocations.remove(at: indexPath.row)
            if currentSelect == indexPath.row{
                changeNavTitle(sender: "Map")
            }
            if allLocations.isEmpty{emptyView.isHidden = !emptyView.isHidden}
            tableView.deleteRows(at: [indexPath], with: .fade)
            reloadData()
        }
    }
}
