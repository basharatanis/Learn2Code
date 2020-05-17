//
//  QuizViewController.swift
//  Learn2Code
//
//  Created by Basharat Anis on 5/16/20.
//  Copyright © 2020 Basharat Anis. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    


    var models=[Question]()
    
    var currentQuestion: Question?
    
    @IBOutlet var label: UILabel!
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        setupQuestions()
        configureUI(question: models.first!)
        


        // Do any additional setup after loading the view.
    }

    
    private func configureUI(question: Question){
        label.text = question.text
        currentQuestion = question
        table.reloadData()

        
    }
    
    private func checkAns(answer: Answer, question: Question) -> Bool{
        return question.answers.contains(where:{$0.text == answer.text}) && answer.correct
    }
    private func setupQuestions(){
        models.append(Question(text:"Keyword to create variable?", answers: [
            Answer(text:"var", correct: true),
            Answer(text:"let", correct: false),
            Answer(text:"varr", correct: false),
            Answer(text:"assign", correct: false),
        ]))
        models.append(Question(text:"Keyword to create constant?", answers: [
            Answer(text:"int", correct: false),
            Answer(text:"const", correct: false),
            Answer(text:"var", correct: false),
            Answer(text:"let", correct: true),
        ]))
        models.append(Question(text:"var a=1, b=2", answers: [
            Answer(text:"a=b => a=1", correct: false),
            Answer(text:"a=b => a=2", correct: true),
            Answer(text:"a=b => a=3", correct: false),
            Answer(text:"a=b => a=4", correct: false),
        ]))
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int{
        return currentQuestion?.answers.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = currentQuestion?.answers[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let question = currentQuestion else{
            return
        }
        let answer = question.answers[indexPath.row]
        
        if checkAns(answer: answer, question: question){
            if let index = models.firstIndex(where: {$0.text == question.text}){
                if index < (models.count-1){
                    let nextQuestion =  models[index+1]
                    currentQuestion = nil
                    configureUI(question: nextQuestion)
            }
                else{
                    let alert = UIAlertController(title: "Done", message: "Good Job!!!", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel,handler:nil))
                    present(alert,animated: true)
                }
            }
            
        }
        else {
            let alert = UIAlertController(title: "Wrong", message: "Come On!!!", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel,handler:nil))
            present(alert,animated: true)
            
        }
    }
        

}



struct Question{
    let text: String
    let answers: [Answer]
    
}

struct Answer{
    let text: String
    let correct: Bool
}
