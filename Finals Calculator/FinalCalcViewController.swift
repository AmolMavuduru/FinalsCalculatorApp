//
//  FinalCalcViewController.swift
//  Finals Calculator
//
//  Created by Amol on 5/1/17.
//  Copyright © 2017 Amol. All rights reserved.
//

import UIKit

class FinalCalcViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var gradeBeforeField: UITextField!
    
    @IBOutlet var finalPercentField: UITextField!
    
    @IBOutlet var desiredGradeField: UITextField!
    
    
    @IBOutlet var messageLabel: UILabel!
    
    @IBOutlet var commentLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func calcFinalGoal(_ sender: Any) {
        
        if let beforeFinalGrade = Double(gradeBeforeField.text!)
        {
            if let finalPercent = Double(finalPercentField.text!)
            {
                if let gradeGoal = Double(desiredGradeField.text!)
                {
                    var finalGoal = 100*(gradeGoal - (beforeFinalGrade*((100 - finalPercent)/100)))/finalPercent;
                    
                    messageLabel.text = "You need at least a \(finalGoal) on the final."
                    
                    if(finalGoal < 40)
                    {
                        commentLabel.text = "Don't even bother studying!"
                    }
                    else if(finalGoal < 65)
                    {
                        commentLabel.text = "Should be easy to get that grade."
                    }
                    else if(finalGoal < 80)
                    {
                        commentLabel.text = "You should be fine."
                    }
                    else if(finalGoal < 90)
                    {
                        commentLabel.text = "You'll need to study a bit."
                    }
                    else if(finalGoal < 96)
                    {
                        commentLabel.text = "You need at least an A on the final"
                    }
                    else if(finalGoal < 100)
                    {
                        commentLabel.text = "You need an A+ on the final, no pressure!"
                    }
                    else
                    {
                        commentLabel.text = "You better hope there is extra credit!"
                    }
                    
                }
            }
        }
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
