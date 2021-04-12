//
//  SettingsViewController.swift
//  Contact List
//
//  Created by Jiana Zapata on 4/7/21.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewAccessibilityDelegate {

    @IBOutlet weak var swAscending: UISwitch!
    @IBOutlet weak var pckSortField: UIPickerView!
    

    //adds an array to picker view
    let sortOrderItems: Array<String> = ["Contact Name", "City", "Birthday"]
    
    //settings view as the data source
    //settings view as the delegate as well
    override func viewDidLoad() {
        super.viewDidLoad()

        pckSortField.dataSource = self;
        pckSortField.delegate = self;
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //set the UI based on values in UserDefaults
        let settings = UserDefaults.standard
        
        //sets value of switch based on value in the sortDirection key
        swAscending.setOn(settings.bool(forKey: Constants.kSortDirectionAscending), animated:true)
        
        //sortfield to a constant, goes through array, if match is found, pickerview slects the row
        let sortField = settings.string(forKey: Constants.kSortField)
        var i = 0
        for field in sortOrderItems {
            if field == sortField {
                pckSortField.selectRow(i, inComponent: 0, animated: false)
            }
            i += 1
        }
        
        //have the pickerview changed
        pckSortField.reloadComponent(0)
    }
    
    @IBAction func sortDirectionChanged(_ sender: Any) {
        let settings = UserDefaults.standard
        settings.set(swAscending.isOn, forKey: Constants.kSortDirectionAscending)
        settings.synchronize()
    }
    
   
    //MARK: UIPickerViewDelegate Methods
    
    //returns the number of 'columns' to display
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //returns rows
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sortOrderItems.count
    }
    
    //sets the value that is shown for each row in the picker
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sortOrderItems[row]
    }
    //and makes data show up
     func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let sortField = sortOrderItems[row]
        let settings = UserDefaults.standard
        settings.set(sortField, forKey: Constants.kSortField)
        settings.synchronize()
        
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
