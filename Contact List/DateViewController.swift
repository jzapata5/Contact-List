//
//  DateViewController.swift
//  Contact List
//
//  Created by Jiana Zapata on 4/14/21.
//

import UIKit

protocol DateControllerDelegate: class {
    func dateChanged(date: Date)
}

class DateViewController: UIViewController {

    //delegate may not always be set, so it's weak and the type is optional (?)
    //Optional types are set to nil by defau;t - no need to init methods
    weak var delegate: DateControllerDelegate?
    
    @IBOutlet weak var dtpDate: UIDatePicker!
    
    override func viewDidLoad() {
        
        let saveButton: UIBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save,
                            target: self,
                            action: #selector(saveDate))
        
        self.navigationItem.rightBarButtonItem = saveButton
        
        self.title = "Pick Birthdate"
        
       
        
        //super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @objc func saveDate(){
        self.delegate?.dateChanged(date: dtpDate.date)
        self.navigationController?.popViewController(animated: true)
    }

}
