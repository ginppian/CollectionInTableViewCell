//
//  ViewController.swift
//  pruebaCollectionOnTable
//
//  Created by Gmo Ginppian on 1/21/19.
//  Copyright © 2019 gonet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //let vc = DGTableViewController(arr: ["Toño", "Victor", "Omar", "Mau", "David"])
        let vc = DGTableViewController()
        self.present(vc, animated: true, completion: nil)
    }


}

