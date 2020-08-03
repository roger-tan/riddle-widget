//
//  Riddle+Mock.swift
//  Riddle
//
//  Created by Roger Tan on 30/07/2020.
//

import Foundation

extension Riddle {
    public static var list: [Riddle] {
        [
            Riddle(id: 1,
                   text: "What bird is always out of breath?",
                   answer: "A puffin."),
            Riddle(id: 2,
                   text: "Why did outlaws sleep on the ground after robbing a bank?",
                   answer: "They wanted to lie low."),
            Riddle(id: 3,
                   text: "Why did the tire need a vacation?",
                   answer: "It couldn't take the pressure anymore?"),
            Riddle(id: 4,
                   text: "What does a shark eat with peanut butter?",
                   answer: "Jellyfish!"),
            Riddle(id: 5,
                   text: "How does the moon cut his hair?",
                   answer: "E-clipse it!"),
            Riddle(id: 6,
                   text: "What weighs more? A pound of feathers or a pound of stones?",
                   answer: "The same. They both weigh a pound!"),
            Riddle(id: 7,
                   text: "You give someone a dollar. You are this person's brother, but the person is not your brother. How can that be?",
                   answer: "It's your sister!"),
            Riddle(id: 8,
                   text: "Before Mount Everest was discovered, what was the highest mountain on Earth?",
                   answer: "Mount Everest."),
            Riddle(id: 9,
                   text: "What lies at the bottom of the sea and shivers?",
                   answer: "A nervous wreck."),
            Riddle(id: 10,
                   text: "Why aren't elephants allowed on the beach?",
                   answer: "They can't keep their trunks up!"),
        ]
    }
    
    public static func shuffleList() -> [Riddle] {
        Riddle.list.shuffled()
    }
    
    public static func random() -> Riddle {
        Riddle.list.randomElement()!
    }
}
