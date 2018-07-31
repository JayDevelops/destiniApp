//
//  ViewController.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Our strings
    let story1 = "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: \"Need a ride, boy?\"."
    let answer1a = "I\'ll hop in. Thanks for the help!"
    let answer1b = "Better ask him if he\'s a murderer first."
    
    
    let story2 = "He nods slowly, unphased by the question."
    let answer2a = "At least he\'s honest. I\'ll climb in."
    let answer2b = "Wait, I know how to change a tire."
    
    let story3 = "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box."
    let answer3a = "I love Elton John! Hand him the cassette tape."
    let answer3b = "It\'s him or me! You take the knife and stab him."
    
    let story4 = "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?"
    let story5 = "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in."
    let story6 = "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier.\""
    
    let endOfStoryGameButton = "End of the story"
    
    var storyIndex = 1
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has Sender.tag = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has Sender.tag = 2
    @IBOutlet weak var storyTextView: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // TODO Step 3: Set the text for the storyTextView, topButton, bottomButton, and to T1_Story, T1_Ans1, and T1_Ans2
        restartGame()
        
        //Hide the restart button until the user gets there
        restartButton.isHidden = true
        
    }

    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        /* TODO Step 4: Write an IF-Statement to update the views
            Update the views from the button and text when user clicks on topButton
             Updates the UI Elements such as the topButton, bottomButton, and storyText
              From a function called changeUIElements with less code as it calls to the function   */
        
        /*When the story index meaning it starts from 1, so it will continue the game wherever the choose
          Let's say that when the user is on story 1 then their story index would advance to the corresponding story they chose
          So for the first 'if' statement would advance them to story 3 so we add 2. From there our logical flow of 'if, else if'
          statements would go on with the logical operators  */
        
        //From the first story logical flow for the top button decision!
        if  sender.tag == 1  && storyIndex == 1   {
            changeUIElements(storyTextChange: story3, topButtonAnswerChange: answer3a, bottomButtonAnswerChange: answer3b)
            storyIndex += 2
            
          //From the first story logical flow for the bottom button decision!
        } else if sender.tag == 2 && storyIndex == 1    {
            changeUIElements(storyTextChange: story2, topButtonAnswerChange: answer2a, bottomButtonAnswerChange: answer2b)
            storyIndex += 1
    //End of the first story decisions...
            
        //From the third story logical flow for the top button decision!
        } else if sender.tag == 1 && storyIndex == 3    {
            changeUIElements(storyTextChange: story6, topButtonAnswerChange: endOfStoryGameButton, bottomButtonAnswerChange: endOfStoryGameButton)
            storyIndex += 3
            
          //From the third story logical flow for the top button decision!
        } else if sender.tag == 2 && storyIndex == 3    {
            changeUIElements(storyTextChange: story5, topButtonAnswerChange: endOfStoryGameButton, bottomButtonAnswerChange: endOfStoryGameButton)
            storyIndex += 2
    //End of the third story decisions...
            
          //From the second story logical flow for the top button decision!
        } else if sender.tag == 1 && storyIndex == 2    {
            changeUIElements(storyTextChange: story3, topButtonAnswerChange: answer3a, bottomButtonAnswerChange: answer3b)
            storyIndex += 1
            
          //From the second story logical flow for the bottom button decision!
        } else if sender.tag == 2 && storyIndex == 2    {
            changeUIElements(storyTextChange: story4, topButtonAnswerChange: endOfStoryGameButton, bottomButtonAnswerChange: endOfStoryGameButton)
            storyIndex += 2
        }
        
        
        //Modify the the user experience by letting them restart, code under here
        if storyIndex == 4 || storyIndex == 5 || storyIndex == 6    {
            topButton.isHidden = true
            bottomButton.isHidden = true
            
            restartButton.isHidden = false
        }
        
    }
    
    
    
    //Event when the restart button is pressed, 'touched'
    @IBAction func restartButtonIsPressed(_ sender: UIButton) {
        restartGame()
}
    
    
    //Function to restart the game
    func restartGame() {
        //Story text
        storyTextView.text = story1
        
        //The '.normal' simply means its a normal button, changing the topButton
        topButton.setTitle(answer1a, for: .normal)
        
        //Changing the bottomButton text with answer2a now
        bottomButton.setTitle(answer1b, for: .normal)
        
        topButton.isHidden = false
        bottomButton.isHidden = false
        
        restartButton.isHidden = true
        
        storyIndex = 1
    }
    
    
    
    //Changes the UIElements inside the IBAction Function when the button is pressed
    //Made this so there would be less code inside those if, else statements
    func changeUIElements(storyTextChange: String, topButtonAnswerChange: String, bottomButtonAnswerChange: String ) {
        //Changes the text property with its parameter
        storyTextView.text = storyTextChange
        
        //Changes the topButton Answer Text with the 'topButtonAnswerChange' parameter
        topButton.setTitle(topButtonAnswerChange, for: .normal)
        
        //Changes the bottompButton Answer Text with the 'bottomButtonAnswerChange' parameter
        bottomButton.setTitle(bottomButtonAnswerChange, for: .normal)
        
    }


}

