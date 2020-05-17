//
//  ViewController.swift
//  Learn2Code
//
//  Created by Basharat Anis on 5/16/20.
//  Copyright © 2020 Basharat Anis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet var reader:UILabel!
    @IBOutlet var readme:UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        readme.text="\nInstructions:\n\n1.Once the game will start, you will always have 'reader' on top right corner to read about swift and answer the quiz.\n\n2.You can always click on 'menu' to get back to the main screen."
        // Do any additional setup after loading the view.
    }

    @IBAction func start(){
        let vc = storyboard?.instantiateViewController(identifier: "quiz") as!QuizViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated:true)
    }
    

}

