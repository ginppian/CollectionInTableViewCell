//
//  SeraViewController.swift
//  MenuCollectionInTableViewCell
//
//  Created by Gmo Ginppian on 1/22/19.
//  Copyright © 2019 gonet. All rights reserved.
//

import UIKit

protocol seraDelegate {
    func seraCierra()
}

class SeraViewController: UIViewController {

    var delegate: seraDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func btnAction(_ sender: Any) {
        //self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
