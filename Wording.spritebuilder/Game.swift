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
    var buttonArray : [CCButton] = []
    var letterOne : CCLabelTTF!
    var letterTwo : CCLabelTTF!
    var letterThree : CCLabelTTF!
    var letterFour : CCLabelTTF!
    var score : CCLabelTTF!
    var scoreBar : CCSprite!
    var zeroColors : [Int] = [] //The colors of the visible buttons
    var oneColors : [Int] = []
    let zeroArray : [Int] = [1,2,3,4] //color used in words
    let oneArray : [Int] = [6,7,8,9]
    var wordList = Array(count:23, repeatedValue:Array(count:4, repeatedValue:String()))
    var buttonCharacters : [Int] = []
    var checkingCharacter : Int = 0
    var levelCounter : CGFloat = 0
    var scoreCounter : CGFloat = 0
    var timer : CGFloat = 0
    var newButtonCounter : Int = 15
    var buttonPatternCounter : Int = 0
    
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
        //FIRE
        wordList[6][0] = "F"
        wordList[6][1] = "I"
        wordList[6][2] = "R"
        wordList[6][3] = "E"
        //LINE
        wordList[7][0] = "L"
        wordList[7][1] = "I"
        wordList[7][2] = "N"
        wordList[7][3] = "E"
        //LORD
        wordList[8][0] = "L"
        wordList[8][1] = "O"
        wordList[8][2] = "R"
        wordList[8][3] = "D"
        //MINE
        wordList[9][0] = "M"
        wordList[9][1] = "I"
        wordList[9][2] = "N"
        wordList[9][3] = "E"
        //NOON
        wordList[10][0] = "N"
        wordList[10][1] = "O"
        wordList[10][2] = "O"
        wordList[10][3] = "N"
        //MOON
        wordList[11][0] = "M"
        wordList[11][1] = "O"
        wordList[11][2] = "O"
        wordList[11][3] = "N"
        //LOON
        wordList[12][0] = "L"
        wordList[12][1] = "O"
        wordList[12][2] = "O"
        wordList[12][3] = "N"
        //BOOM
        wordList[13][0] = "B"
        wordList[13][1] = "O"
        wordList[13][2] = "O"
        wordList[13][3] = "M"
        //FOOL
        wordList[14][0] = "F"
        wordList[14][1] = "O"
        wordList[14][2] = "O"
        wordList[14][3] = "L"
        //BOOL
        wordList[15][0] = "B"
        wordList[15][1] = "O"
        wordList[15][2] = "O"
        wordList[15][3] = "L"
        //COIN
        wordList[16][0] = "C"
        wordList[16][1] = "O"
        wordList[16][2] = "I"
        wordList[16][3] = "N"
        //INFO
        wordList[17][0] = "I"
        wordList[17][1] = "N"
        wordList[17][2] = "F"
        wordList[17][3] = "O"
        //JOIN
        wordList[18][0] = "J"
        wordList[18][1] = "O"
        wordList[18][2] = "I"
        wordList[18][3] = "N"
        //TOIL
        wordList[19][0] = "T"
        wordList[19][1] = "O"
        wordList[19][2] = "I"
        wordList[19][3] = "L"
        //LOGO
        wordList[20][0] = "L"
        wordList[20][1] = "O"
        wordList[20][2] = "G"
        wordList[20][3] = "O"
        //LOOP
        wordList[21][0] = "L"
        wordList[21][1] = "O"
        wordList[21][2] = "O"
        wordList[21][3] = "P"
        //MONO
        wordList[22][0] = "M"
        wordList[22][1] = "O"
        wordList[22][2] = "N"
        wordList[22][3] = "O"
        //ZERO
        wordList[22][0] = "Z"
        wordList[22][1] = "E"
        wordList[22][2] = "R"
        wordList[22][3] = "O"
        //INTO
        wordList[22][0] = "I"
        wordList[22][1] = "N"
        wordList[22][2] = "T"
        wordList[22][3] = "O"
        //FROM
        wordList[22][0] = "F"
        wordList[22][1] = "R"
        wordList[22][2] = "O"
        wordList[22][3] = "M"
        //MINI
        wordList[22][0] = "M"
        wordList[22][1] = "I"
        wordList[22][2] = "N"
        wordList[22][3] = "I"
        nodeArray.append(redNode)
        nodeArray.append(greenNode)
        nodeArray.append(blueNode)
        nodeArray.append(orangeNode)
        buttonArray.append(redZeroButton)
        buttonArray.append(redOneButton)
        buttonArray.append(greenZeroButton)
        buttonArray.append(greenOneButton)
        buttonArray.append(blueZeroButton)
        buttonArray.append(blueOneButton)
        buttonArray.append(orangeZeroButton)
        buttonArray.append(orangeOneButton)
        score.string = "0"
        loadNewButtons()
        loadNewWord()
        self.userInteractionEnabled = true
    }
    
    override func update(delta: CCTime) {
        timer = 2+(0.1*levelCounter)
        scoreBar.position = ccp(scoreBar.position.x-timer,scoreBar.position.y)
    }
    
    func loadNewButtons () {
        zeroColors.removeAll()
        oneColors.removeAll()
        whiteNode.position = ccp(-406.9,260.5)
        redNode.position = ccp(-406.9,260.5)
        greenNode.position = ccp(-406.9,260.5)
        blueNode.position = ccp(-406.9,260.5)
        orangeNode.position = ccp(-406.9,260.5)
        redZeroButton.position = ccp(0,0)
        redOneButton.position = ccp(147.5,0)
        blueZeroButton.position = ccp(0,0)
        blueOneButton.position = ccp(147.5,0)
        greenZeroButton.position = ccp(0,0)
        greenOneButton.position = ccp(147.5,0)
        orangeZeroButton.position = ccp(0,0)
        orangeOneButton.position = ccp(147.5,0)
        if buttonPatternCounter <= 2 {
            var firstNode : UInt32 = arc4random_uniform(4) //Take new colors
            var secondNode : UInt32 = arc4random_uniform(4)
            while secondNode == firstNode {
                secondNode = arc4random_uniform(4)
            }
            nodeArray[Int(firstNode)].position = ccp(25,373) //Position Buttons
            nodeArray[Int(secondNode)].position = ccp(25, 235.5)
            zeroColors.append(zeroArray[Int(firstNode)]) //Edit array so correct colors are being used below
            zeroColors.append(zeroArray[Int(secondNode)])
            oneColors.append(oneArray[Int(firstNode)])
            oneColors.append(oneArray[Int(secondNode)])
        }
        buttonPatternCounter++
    }
    func loadNewWord () {
        var randomValue : UInt32 = arc4random_uniform(UInt32(wordList.count))
        var randomOneValue : UInt32 = arc4random_uniform(UInt32(oneColors.count))
        var randomZeroValue : UInt32 = arc4random_uniform(UInt32(zeroColors.count))
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
        scoreBar.position = ccp(0,438)
    }
    
    func checkLetter (colorNumber: Int) {
        if checkingCharacter == buttonCharacters[0] {
            buttonCharacters.removeAtIndex(0)
        }
        if buttonCharacters.count == 0 {
            levelCounter++
            getScore()
            if Int(levelCounter)%Int(newButtonCounter) == 0 {
                loadNewButtons()
            }
            loadNewWord()
        }
    }
    
    func getScore () {
        var levelScore : CGFloat
        levelScore = ((320+scoreBar.position.x)/320)*100.0
        scoreCounter = scoreCounter + levelScore
        score.string = "\(Int(scoreCounter))"
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