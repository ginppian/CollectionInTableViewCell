//
//  DGMenuTableViewController.swift
//  MenuCollectionInTableViewCell
//
//  Created by Gmo Ginppian on 1/22/19.
//  Copyright © 2019 gonet. All rights reserved.
//

import UIKit

extension UIColor {
    struct DG {
        static var bbva_core_blue: UIColor { return Utilities.hexStringToUIColor(hex: "004481") }
        static var bbva_medium_blue: UIColor  { return Utilities.hexStringToUIColor(hex: "1973B8") }
    }
}

// No se puede repetir
enum enumDGMenuTableViewCell_Height: Int {
    case Usuario = 144
}

enum enumDGMenuTableViewCell: Int {
    case Usuario = 0
    case Banner = 1
    case Items = 2
}


public class Utilities: NSObject {
    class func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

class DGMenuTableViewController: UITableViewController, ShowVCCollectionToTable {
    
    var storyboardBase = String()
    var storyboardId = String()
    var seraName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //let button1 = UIBarButtonItem(image: UIImage(named: "imagename"), style: .plain, target: mainView, action: Selector(("serafiaSoft")))
        let btn1 = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(DGMenuTableViewController.serafiaSoft))
        self.navigationItem.leftBarButtonItem = btn1
        
        loadUI()
        
        // Registra la celda: DGUsuarioMenuTableViewCell
        self.tableView.register(UINib.init(nibName: "DGUsuarioMenuTableViewCell", bundle: nil), forCellReuseIdentifier: "DGUsuarioMenuTableViewCell")
        
        // Registra la celda: DGBannerMenuTableViewCell
        self.tableView.register(UINib.init(nibName: "DGBannerMenuTableViewCell", bundle: nil), forCellReuseIdentifier: "DGBannerMenuTableViewCell")
    }

    convenience init(storyboard name: String, navigationcontroller identifier: String, sera: String) {
        self.init()
        self.storyboardBase = name
        self.storyboardId = identifier
        self.seraName = sera
    }
    
    func showvccollectiontotable() {
        print("estas en: DGMenuTableViewController")
        //self.delegateMain?.showvcMainToTable()
        self.navigationController?.pushViewController(SeraViewController(), animated: true)
    }
    
    func loadUI() {
        self.tableView.separatorStyle = .none
    }
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case enumDGMenuTableViewCell.Usuario.rawValue:
            
            guard let dgUsuarioMenuTableViewCell =
                tableView.dequeueReusableCell(withIdentifier: "DGUsuarioMenuTableViewCell", for: indexPath) as? DGUsuarioMenuTableViewCell else { return UITableViewCell() }
                
                dgUsuarioMenuTableViewCell.dglbl.text = "Buenos días, DAVID"
                dgUsuarioMenuTableViewCell.dgimg.image = UIImage(named: "brad")
                
                return dgUsuarioMenuTableViewCell
            
        case enumDGMenuTableViewCell.Banner.rawValue:
            
            guard let dgBannerMenuTableViewCell =
                tableView.dequeueReusableCell(withIdentifier: "DGBannerMenuTableViewCell", for: indexPath) as? DGBannerMenuTableViewCell else { return UITableViewCell() }
            
            dgBannerMenuTableViewCell.storyboardBase = self.storyboardBase
            dgBannerMenuTableViewCell.storyboardId = self.storyboardId
            
            
            dgBannerMenuTableViewCell.delegateCollection = self
            
            return dgBannerMenuTableViewCell
            
        case enumDGMenuTableViewCell.Items.rawValue:
            
            return UITableViewCell()
            
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case enumDGMenuTableViewCell.Usuario.rawValue:
            return CGFloat(enumDGMenuTableViewCell_Height.Usuario.rawValue)
        case enumDGMenuTableViewCell.Banner.rawValue:
            return CGFloat(enumDGMenuTableViewCell_Height.Usuario.rawValue)
        default:
            return 144
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case enumDGMenuTableViewCell.Usuario.rawValue:
            if let dgUsuarioMenuTableViewCell = cell as? DGUsuarioMenuTableViewCell {
                dgUsuarioMenuTableViewCell.backgroundColor = UIColor.DG.bbva_medium_blue
            }
        case enumDGMenuTableViewCell.Banner.rawValue:
            print("")
        case enumDGMenuTableViewCell.Items.rawValue:
            print("")
        default:
            cell.backgroundView?.backgroundColor = UIColor.DG.bbva_core_blue
        }
    }
    
    @objc public func serafiaSoft() {
        //self.present(SeraViewController(), animated: true, completion: nil)
        if let seravc = viewControllerFromString(viewControllerName: self.seraName) {
            //self.present(seravc, animated: true, completion: nil)
            self.navigationController?.pushViewController(seravc, animated: true)
        }
    }
}

extension NSObject {
    
    func viewControllerFromString(viewControllerName: String) -> UIViewController? {
        
        if let appName = Bundle.main.infoDictionary?["CFBundleName"] as? String {
            print("CFBundleName - \(appName)")
            if let viewControllerType = NSClassFromString("\(appName).\(viewControllerName)") as? UIViewController.Type {
                return viewControllerType.init()
            }
        }
        
        return nil
    }
    
}
