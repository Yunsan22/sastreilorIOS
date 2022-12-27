//
//  measurementsVC.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 12/10/22.
//

import UIKit

class measurementsVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var measurements = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        
    }
    

   

}
extension measurementsVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return measurements.count
    return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MeasurementCell") as? MeasurementCell else {return UITableViewCell()}
//        let measuremts = measurements[indexPath.row]
        
        return cell
    }
    
    
}
