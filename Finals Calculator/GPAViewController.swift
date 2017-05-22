//
//  GPAViewController.swift
//  Finals Calculator
//
//  Created by Amol on 5/6/17.
//  Copyright © 2017 Amol. All rights reserved.
//

import UIKit

class GPAViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //Arrays to keep track of fields for each cell
    var classList:[String] = ["Class 1", "Class 2", "Class 3"]
    
    var grades:[String] = ["A+", "B-", "A-"]
    var hours:[Int] = [3, 4, 3]
   
    
    var gradeConversion: [String: Double] = ["A+": 4.00, "A": 4.00, "A-": 3.67, "B+": 3.33, "B": 3.00, "B-": 2.67, "C+": 2.33, "C": 2.00, "C-": 1.67, "D+": 1.33, "D": 1.00, "D-": 0.67, "F": 0.00]
    
    
    
    var gradeOptions:[String] = ["A+", "A", "A-", "B+", "B", "B-", "C+", "C", "C-", "D+", "D", "D-", "F"]
    
    var gradePicker = UIPickerView()
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var gpaLabel: UILabel!
    
    
    @IBOutlet var nameField: UITextField!
   
    @IBOutlet var gradeField: UITextField!
    
    
    @IBOutlet var hoursField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        gradePicker.delegate = self
        gradePicker.dataSource = self
        gradeField.inputView = gradePicker


        // Do any additional setup after loading the view.
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1;
    }
    
     public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
     {
        return gradeOptions.count
     }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return gradeOptions[row]
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        gradeField.text = gradeOptions[row]
    }
    
    func createAlert(title: String, message: String) //function for generating specific alerts
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            
            self.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }

    
    
     

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! GPATableViewCell
        
         cell.classLabel.text = classList[indexPath.row]
         cell.gradeLabel.text = grades[indexPath.row]
         cell.hoursLabel.text = String(hours[indexPath.row])
        
        return cell
    }
    
    

    
    @IBAction func addClass(_ sender: Any) {
        
        if(nameField.text == "" || gradeField.text == "" || hoursField.text == "")
        {
            print("In this condition!")
            createAlert(title: "Missing fields!", message: "Please enter all fields for this class!")
            
        }
        else if(nameField.text != nil && gradeField.text != nil && hoursField != nil)
        {
            print("Not equal nil")
        
        classList.append(nameField.text!)
        grades.append(gradeField.text!)
        hours.append(Int(hoursField.text!)!)
        
        
        tableView.reloadData() //Reloads data in the table
        }
        
    }
    
    @IBAction func deleteClass(_ sender: Any) {
        
        classList.removeLast()
        grades.removeLast()
        hours.removeLast()
        
        tableView.reloadData()
    }
    
    
    
    @IBOutlet var resetClasses: UIButton!
    
    
    @IBAction func reset(_ sender: Any) {
        
        classList.removeAll()
        grades.removeAll()
        hours.removeAll()
        
        gpaLabel.text = "Cumulative GPA:"
        
        tableView.reloadData()
    }
    
    
    @IBAction func calcGPA(_ sender: Any) {
    
     if(classList.isEmpty)
     {
        createAlert(title: "No classes added!", message: "Please add a class first!")
     }
     else
     {
        
        var weightedSum = 0.0;
        var hoursSum = 0.0;
        var lastIndex = classList.count - 1
        
        for i in 0...lastIndex
        {
            if let grade = gradeConversion[grades[i]]
            {
                weightedSum = weightedSum + grade * Double(hours[i]);
            }
        }
        
        for hour in hours
        {
            hoursSum = hoursSum + Double(hour);
        }
        
        gpaLabel.text = "Cumulative GPA: \(weightedSum/hoursSum)"
      }
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return classList.count
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField:UITextField)->Bool
    {
        textField.resignFirstResponder()
        
        return true;
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
