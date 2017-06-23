//
//  DetailViewController.swift
//  Argentum
//
//  Created by Brian Ramirez on 6/22/17.
//  Copyright © 2017 Brian Ramirez. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedCurrency: Cryptocurrency?
    var test:String?
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(test?.isEmpty)
        
        nameLbl.text = selectedCurrency!.name
        priceLbl.text = "$\(selectedCurrency!.price)"
        if(selectedCurrency!.percentChange < 0){
            priceLbl.textColor = UIColor(red:0.91, green:0.30, blue:0.24, alpha:1.0)
        }else{
            priceLbl.textColor = UIColor(red:0.18, green:0.80, blue:0.44, alpha:1.0)
        }

        // Do any additional setup after loading the view.
    }

    
    @IBAction func backBtnPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    

}
