//
//  Game.swift
//  Wording
//
//  Created by Jacob Apenes on 5/1/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Game: CCScene {
    var whiteNode : CCNode!
    var redNode : CCNode!
    var blueNode : CCNode!
    var greenNode : CCNode!
    var orangeNode : CCNode!
    var nodeArray : [CCNode] = []
    var whiteZeroButton : CCButton!
    var whiteOneButton : CCButton!
    var redZeroButton : CCButton!
    var redOneButton : CCButton!
    var blueZeroButton : CCButton!
    var blueOneButton : CCButton!
    var greenZeroButton : CCButton!
    var greenOneButton : CCButton!
    var orangeZeroButton : CCButton!
    var orangeOneButton : CCButton!
    var letterOne : Letter!
    var letterTwo : Letter!
    var letterThree : Letter!
    var letterFour : Letter!
    var zeroColors : [Int] = [0, 1] //The colors of the visible buttons
    var oneColors : [Int] = [4, 5]
    let zeroArray : [Int] = [1,2,3,4] //color used in words
    let oneArray : [Int] = [6,7,8,9]
    var wordList = Array(count:6, repeatedValue:Array(count:4, repeatedValue:String()))
    var buttonCharacters : [Int] = []
    var checkingCharacter : Int = 0
    
    func didLoadFromCCB() {
        //words
        //LION
        wordList[0][0] = "L"
        wordList[0][1] = "I"
        wordList[0][2] = "O"
        wordList[0][3] = "N"
        //DOOM
        wordList[1][0] = "D"
        wordList[1][1] = "O"
        wordList[1][2] = "O"
        wordList[1][3] = "M"
        //BIND
        wordList[2][0] = "B"
        wordList[2][1] = "I"
        wordList[2][2] = "N"
        wordList[2][3] = "D"
        //GAIN
        wordList[3][0] = "G"
        wordList[3][1] = "A"
        wordList[3][2] = "I"
        wordList[3][3] = "N"
        //WORD
        wordList[4][0] = "W"
        wordList[4][1] = "O"
        wordList[4][2] = "R"
        wordList[4][3] = "D"
        //PROP
        wordList[5][0] = "P"
        wordList[5][1] = "R"
        wordList[5][2] = "O"
        wordList[5][3] = "P"
        /*wordList[0][0] = "FIRE"
        wordList[0][0] = "LINE"
        wordList[0][0] = "LORD"
        wordList[0][0] = "MINE"
        wordList[0][0] = "NOON"
        wordList[0][0] = "MOON"
        wordList[0][0] = "LOON"
        wordList[0][0] = "BOOM"
        wordList[0][0] = "FOOL"
        wordList[0][0] = "BOOL"
        wordList[0][0] = "COIN"
        wordList[0][0] = "INFO"
        wordList[0][0] = "JOIN"
        wordList[0][0] = "TOIL"
        wordList[0][0] = "LOGO"
        wordList[0][0] = "LOOP"
        wordList[0][0] = "MONO"*/
        
        nodeArray.append(redNode)
        nodeArray.append(greenNode)
        nodeArray.append(blueNode)
        nodeArray.append(orangeNode)
        loadNewButtons()
        loadNewWord()
        self.userInteractionEnabled = true
    }
    
    override func update(delta: CCTime) {
        
    }
    
    func loadNewButtons () {
        whiteNode.position = ccp(-406.9,260.5)
        redNode.position = ccp(-406.9,260.5)
        greenNode.position = ccp(-406.9,260.5)
        blueNode.position = ccp(-406.9,260.5)
        orangeNode.position = ccp(-406.9,260.5)
        var firstNode : UInt32 = arc4random_uniform(4) //Take new colors
        var secondNode : UInt32 = arc4random_uniform(4)
        while secondNode == firstNode {
            secondNode = arc4random_uniform(4)
        }
        nodeArray[Int(firstNode)].position = ccp(25,373) //Position Buttons
        nodeArray[Int(secondNode)].position = ccp(25, 235.5)
        zeroColors[0] = zeroArray[Int(firstNode)] //Edit array so correct colors are being used below
        zeroColors[1] = zeroArray[Int(secondNode)]
        oneColors[0] = oneArray[Int(firstNode)]
        oneColors[1] = oneArray[Int(secondNode)]
    }
    func loadNewWord () {
        var randomValue : UInt32 = arc4random_uniform(UInt32(wordList.count))
        var randomOneValue : UInt32 = arc4random_uniform(2)
        var randomZeroValue : UInt32 = arc4random_uniform(2)
        var newCharacter : String = ""
        var colorInt : Int = 0
        for ii in 0...3 {
            newCharacter = wordList[Int(randomValue)][ii]
            if newCharacter == "I" {
                newCharacter = "1"
                randomOneValue = arc4random_uniform(2)
                colorInt = oneColors[Int(randomOneValue)]
                buttonCharacters.append(oneColors[Int(randomOneValue)])
            }
            else if newCharacter == "O" {
                newCharacter = "0"
                randomZeroValue = arc4random_uniform(2)
                colorInt = zeroColors[Int(randomZeroValue)]
                buttonCharacters.append(zeroColors[Int(randomZeroValue)])
            }
            if ii == 0 {
                letterOne.string = newCharacter
                if newCharacter == "0" || newCharacter == "1" {
                    letterOne.fontColor = getColor(colorInt)
                }
                else {
                    letterOne.fontColor = CCColor(red: 1.0, green: 1.0, blue: 1.0)
                }
            }
            else if ii == 1 {
                letterTwo.string = newCharacter
                if newCharacter == "0" || newCharacter == "1" {
                    letterTwo.fontColor = getColor(colorInt)
                }
                else {
                    letterTwo.fontColor = CCColor(red: 1.0, green: 1.0, blue: 1.0)
                }
            }
            else if ii == 2 {
                letterThree.string = newCharacter
                if newCharacter == "0" || newCharacter == "1" {
                    letterThree.fontColor = getColor(colorInt)
                }
                else {
                    letterThree.fontColor = CCColor(red: 1.0, green: 1.0, blue: 1.0)
                }
            }
            else if ii == 3 {
                letterFour.string = newCharacter
                if newCharacter == "0" || newCharacter == "1" {
                    letterFour.fontColor = getColor(colorInt)
                }
                else {
                    letterFour.fontColor = CCColor(red: 1.0, green: 1.0, blue: 1.0)
                }
            }
        }
    }
    
    func checkLetter (colorNumber: Int) {
        if checkingCharacter == buttonCharacters[0] {
            buttonCharacters.removeAtIndex(0)
        }
        if buttonCharacters.count == 0 {
            loadNewWord()
        }
    }
    
    func getColor (number: Int) -> CCColor {
        let red = CCColor(red: 1.0, green: 0.0, blue: 0.0)
        let green = CCColor(red: 0.0, green: 1.0, blue: 0.0)
        let blue = CCColor(red: 0.0, green: 0.0, blue: 1.0)
        let orange = CCColor(red: 1.0, green: 0.4745, blue: 0.0392)
        let white = CCColor(red: 1.0, green: 1.0, blue: 1.0)
        
        if number == 1 {
            return red
        }
        else if number == 2 {
            return green
        }
        else if number == 3 {
            return blue
        }
        else if number == 4 {
            return orange
        }
        else if number == 6 {
            return red
        }
        else if number == 7 {
            return green
        }
        else if number == 8 {
            return blue
        }
        else if number == 9 {
            return orange
        }
        return white
    }
    
    func whiteZero() {
        checkingCharacter = 0
        checkLetter(checkingCharacter)
    }
    
    func redZero() {
        checkingCharacter = 1
        checkLetter(checkingCharacter)
    }
    
    func greenZero() {
        checkingCharacter = 2
        checkLetter(checkingCharacter)
    }
    
    func blueZero() {
        checkingCharacter = 3
        checkLetter(checkingCharacter)
    }
    
    func orangeZero() {
        checkingCharacter = 4
        checkLetter(checkingCharacter)
    }
    
    func whiteOne() {
        checkingCharacter = 5
        checkLetter(checkingCharacter)
    }
    
    func redOne() {
        checkingCharacter = 6
        checkLetter(checkingCharacter)
    }
    
    func greenOne() {
        checkingCharacter = 7
        checkLetter(checkingCharacter)
    }
    
    func blueOne() {
        checkingCharacter = 8
        checkLetter(checkingCharacter)
    }
    
    func orangeOne() {
        checkingCharacter = 9
        checkLetter(checkingCharacter)
    }
    
}