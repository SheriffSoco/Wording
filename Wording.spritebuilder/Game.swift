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
    var retryButton : CCButton!
    var trophyButton : CCButton!
    var menuButton : CCButton!
    var buttonArray : [CCButton] = []
    var letterOne : CCLabelTTF!
    var letterTwo : CCLabelTTF!
    var letterThree : CCLabelTTF!
    var letterFour : CCLabelTTF!
    var score : CCLabelTTF!
    var gameOverText : CCLabelTTF!
    var scoreBar : CCSprite!
    var zeroColors : [Int] = [] //The colors of the visible buttons
    var oneColors : [Int] = []
    let numberArray : [Int] = [1,2,3,4,6,7,8,9]
    var wordList = Array(count:27, repeatedValue:Array(count:4, repeatedValue:String()))
    var buttonCharacters : [Int] = []
    var checkingCharacter : Int = 0
    var levelCounter : CGFloat = 0
    var scoreCounter : CGFloat = 0
    var timer : CGFloat = 0
    var newButtonCounter : Int = 10
    var buttonPatternCounter : Int = 0
    var allZeros : Bool = false
    var allOnes : Bool = false
    var isGameOver = false
    
    func didLoadFromCCB() {
        //words
        //0 - 14 : Only 0
        //DOOM
        wordList[0][0] = "D"
        wordList[0][1] = "O"
        wordList[0][2] = "O"
        wordList[0][3] = "M"
        //WORD
        wordList[1][0] = "W"
        wordList[1][1] = "O"
        wordList[1][2] = "R"
        wordList[1][3] = "D"
        //PROP
        wordList[2][0] = "P"
        wordList[2][1] = "R"
        wordList[2][2] = "O"
        wordList[2][3] = "P"
        //LORD
        wordList[3][0] = "L"
        wordList[3][1] = "O"
        wordList[3][2] = "R"
        wordList[3][3] = "D"
        //NOON
        wordList[4][0] = "N"
        wordList[4][1] = "O"
        wordList[4][2] = "O"
        wordList[4][3] = "N"
        //MOON
        wordList[5][0] = "M"
        wordList[5][1] = "O"
        wordList[5][2] = "O"
        wordList[5][3] = "N"
        //LOON
        wordList[6][0] = "L"
        wordList[6][1] = "O"
        wordList[6][2] = "O"
        wordList[6][3] = "N"
        //BOOM
        wordList[7][0] = "B"
        wordList[7][1] = "O"
        wordList[7][2] = "O"
        wordList[7][3] = "M"
        //FOOL
        wordList[8][0] = "F"
        wordList[8][1] = "O"
        wordList[8][2] = "O"
        wordList[8][3] = "L"
        //BOOL
        wordList[9][0] = "B"
        wordList[9][1] = "O"
        wordList[9][2] = "O"
        wordList[9][3] = "L"
        //LOGO
        wordList[10][0] = "L"
        wordList[10][1] = "O"
        wordList[10][2] = "G"
        wordList[10][3] = "O"
        //LOOP
        wordList[11][0] = "L"
        wordList[11][1] = "O"
        wordList[11][2] = "O"
        wordList[11][3] = "P"
        //MONO
        wordList[12][0] = "M"
        wordList[12][1] = "O"
        wordList[12][2] = "N"
        wordList[12][3] = "O"
        //ZERO
        wordList[13][0] = "Z"
        wordList[13][1] = "E"
        wordList[13][2] = "R"
        wordList[13][3] = "O"
        //FROM
        wordList[14][0] = "F"
        wordList[14][1] = "R"
        wordList[14][2] = "O"
        wordList[14][3] = "M"
        
        //15 - 20 : Only 1
        //BIND
        wordList[15][0] = "B"
        wordList[15][1] = "I"
        wordList[15][2] = "N"
        wordList[15][3] = "D"
        //FIRE
        wordList[16][0] = "F"
        wordList[16][1] = "I"
        wordList[16][2] = "R"
        wordList[16][3] = "E"
        //LINE
        wordList[17][0] = "L"
        wordList[17][1] = "I"
        wordList[17][2] = "N"
        wordList[17][3] = "E"
        //GAIN
        wordList[18][0] = "G"
        wordList[18][1] = "A"
        wordList[18][2] = "I"
        wordList[18][3] = "N"
        //MINE
        wordList[19][0] = "M"
        wordList[19][1] = "I"
        wordList[19][2] = "N"
        wordList[19][3] = "E"
        //MINI
        wordList[20][0] = "M"
        wordList[20][1] = "I"
        wordList[20][2] = "N"
        wordList[20][3] = "I"
        
        //21 - 26 : Mixed
        //LION
        wordList[21][0] = "L"
        wordList[21][1] = "I"
        wordList[21][2] = "O"
        wordList[21][3] = "N"
        //COIN
        wordList[22][0] = "C"
        wordList[22][1] = "O"
        wordList[22][2] = "I"
        wordList[22][3] = "N"
        //INFO
        wordList[23][0] = "I"
        wordList[23][1] = "N"
        wordList[23][2] = "F"
        wordList[23][3] = "O"
        //JOIN
        wordList[24][0] = "J"
        wordList[24][1] = "O"
        wordList[24][2] = "I"
        wordList[24][3] = "N"
        //TOIL
        wordList[25][0] = "T"
        wordList[25][1] = "O"
        wordList[25][2] = "I"
        wordList[25][3] = "L"
        //INTO
        wordList[26][0] = "I"
        wordList[26][1] = "N"
        wordList[26][2] = "T"
        wordList[26][3] = "O"
        nodeArray.append(redNode)
        nodeArray.append(greenNode)
        nodeArray.append(blueNode)
        nodeArray.append(orangeNode)
        buttonArray.append(redZeroButton)
        buttonArray.append(greenZeroButton)
        buttonArray.append(blueZeroButton)
        buttonArray.append(orangeZeroButton)
        buttonArray.append(redOneButton)
        buttonArray.append(greenOneButton)
        buttonArray.append(blueOneButton)
        buttonArray.append(orangeOneButton)
        score.string = "0"
        loadNewButtons()
        loadNewWord()
        self.userInteractionEnabled = true
    }
    
    override func update(delta: CCTime) {
        if isGameOver == false {
            timer = 2+(0.1*levelCounter)
            scoreBar.position = ccp(scoreBar.position.x-timer,scoreBar.position.y)
        }
    }
    
    func loadNewButtons () {
        zeroColors.removeAll()
        oneColors.removeAll()
        allZeros = false
        allOnes = false
        whiteNode.position = ccp(25,0)
        redNode.position = ccp(25,0)
        greenNode.position = ccp(25,0)
        blueNode.position = ccp(25,0)
        orangeNode.position = ccp(25,0)
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
            zeroColors.append(numberArray[Int(firstNode)]) //Edit array so correct colors are being used below
            zeroColors.append(numberArray[Int(secondNode)])
            oneColors.append(numberArray[Int(firstNode)+4])
            oneColors.append(numberArray[Int(secondNode)+4])
        }
        else {
            var firstButton : UInt32 = arc4random_uniform(8)
            var secondButton : UInt32 = arc4random_uniform(8)
            var thirdButton : UInt32 = arc4random_uniform(8)
            var fourthButton : UInt32 = arc4random_uniform(8)
            while secondButton == firstButton {
                secondButton = arc4random_uniform(8)
            }
            while thirdButton == firstButton || thirdButton == secondButton {
                thirdButton = arc4random_uniform(8)
            }
            while fourthButton == firstButton || fourthButton == secondButton || fourthButton == thirdButton {
                fourthButton = arc4random_uniform(8)
            }
            buttonArray[Int(firstButton)].position = ccp(0,373)
            buttonArray[Int(secondButton)].position = ccp(147.5,373)
            buttonArray[Int(thirdButton)].position = ccp(0,235.5)
            buttonArray[Int(fourthButton)].position = ccp(147.5,235.5)
            if firstButton < 4 {
                zeroColors.append(numberArray[Int(firstButton)])
            }
            else {
                oneColors.append(numberArray[Int(firstButton)])
            }
            if secondButton < 4 {
                zeroColors.append(numberArray[Int(secondButton)])
            }
            else {
                oneColors.append(numberArray[Int(secondButton)])
            }
            if thirdButton < 4 {
                zeroColors.append(numberArray[Int(thirdButton)])
            }
            else {
                oneColors.append(numberArray[Int(thirdButton)])
            }
            if fourthButton < 4 {
                zeroColors.append(numberArray[Int(fourthButton)])
            }
            else {
                oneColors.append(numberArray[Int(fourthButton)])
            }
        }
        if zeroColors.count == 0 {
            allOnes = true
        }
        else if oneColors.count == 0 {
            allZeros = true
        }
        buttonPatternCounter++
    }
    func loadNewWord () {
        var zeroRange : UInt32 = 15
        var oneRange : UInt32 = 6
        var fullRange : UInt32 = UInt32(wordList.count)
        var randomValue : UInt32
        var randomOneValue : UInt32 = arc4random_uniform(UInt32(oneColors.count))
        var randomZeroValue : UInt32 = arc4random_uniform(UInt32(zeroColors.count))
        var newCharacter : String = ""
        var colorInt : Int = 0
        if allZeros == true {
            randomValue = arc4random_uniform(zeroRange)
        }
        else if allOnes == true {
            randomValue = arc4random_uniform(oneRange) + zeroRange
        }
        else {
            randomValue = arc4random_uniform(fullRange)
        }
        for ii in 0...3 {
            newCharacter = wordList[Int(randomValue)][ii]
            if newCharacter == "I" {
                newCharacter = "1"
                randomOneValue = arc4random_uniform(UInt32(oneColors.count))
                colorInt = oneColors[Int(randomOneValue)]
                buttonCharacters.append(oneColors[Int(randomOneValue)])
            }
            else if newCharacter == "O" {
                newCharacter = "0"
                randomZeroValue = arc4random_uniform(UInt32(zeroColors.count))
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
        else {
            gameOver()
        }
        if buttonCharacters.count == 0 {
            levelCounter++
            getScore()
            if Int(levelCounter)%Int(newButtonCounter) == 0 {
                loadNewButtons()
                if newButtonCounter < 1 {
                    newButtonCounter--
                }
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
    
    func gameOver() {
        isGameOver = true
        whiteNode.position = ccp(25,0)
        redNode.position = ccp(25,0)
        greenNode.position = ccp(25,0)
        blueNode.position = ccp(25,0)
        orangeNode.position = ccp(25,0)
        redZeroButton.position = ccp(0,0)
        redOneButton.position = ccp(147.5,0)
        blueZeroButton.position = ccp(0,0)
        blueOneButton.position = ccp(147.5,0)
        greenZeroButton.position = ccp(0,0)
        greenOneButton.position = ccp(147.5,0)
        orangeZeroButton.position = ccp(0,0)
        orangeOneButton.position = ccp(147.5,0)
        gameOverText.visible = true
        retryButton.position = ccp(20,110)
        trophyButton.position = ccp(120,110)
        menuButton.position = ccp(220,110)
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
    
    func retry() {
        let mainScene: CCScene = CCBReader.loadAsScene("Game")
        CCDirector.sharedDirector().replaceScene(mainScene);
    }
    
    func trophy() {
        
    }
    
    func menu() {
        let mainScene: CCScene = CCBReader.loadAsScene("MainScene")
        CCDirector.sharedDirector().replaceScene(mainScene);
    }
}