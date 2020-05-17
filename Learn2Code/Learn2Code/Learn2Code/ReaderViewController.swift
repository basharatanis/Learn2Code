//
//  ReaderViewController.swift
//  Learn2Code
//
//  Created by Basharat Anis on 5/17/20.
//  Copyright © 2020 Basharat Anis. All rights reserved.
//

import UIKit

class ReaderViewController: UIViewController {
    
    @IBOutlet var reader:UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        reader.text="In the coding language Swift, variables and constants can be declared using keywords 'var' and 'let' respectively.\nFor example:\n var a= 690,\n let pi=3.14159 \nBasic Operator: An operator is a special symbol or phrase used to check, change, or combine values. \nAssignment Operator: \n let a=1 \n var b=6 \n a=b // now a is equal to 6"

        // Do any additional setup after loading the view.
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
