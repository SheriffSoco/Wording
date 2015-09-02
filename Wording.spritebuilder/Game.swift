//
//  Game.swift
//  Wording
//
//  Created by Jacob Apenes on 5/1/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

extension String
{
    subscript(integerIndex: Int) -> Character {
        let index = advance(startIndex, integerIndex)
        return self[index]
    }
    
    subscript(integerRange: Range<Int>) -> String {
        let start = advance(startIndex, integerRange.startIndex)
        let end = advance(startIndex, integerRange.endIndex)
        let range = start..<end
        return self[range]
    }
}

class Game: CCScene {
    var whiteNode : CCNode!
    var redNode : CCNode!
    var blueNode : CCNode!
    var greenNode : CCNode!
    var orangeNode : CCNode!
    var particleNode : CCNode!
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
    var newParticles : CCParticleSystem!
    var zeroColors : [Int] = [] //The colors of the visible buttons
    var oneColors : [Int] = []
    let numberArray : [Int] = [1,2,3,4,6,7,8,9]
    var location : String = ""
    var buttonCharacters : [Int] = []
    var allCharacters : [Int] = []
    var checkingCharacter : Int = 0
    var levelCounter : CGFloat = 0
    var speedCounter : CGFloat = 0
    var scoreCounter : CGFloat = 0
    var timer : CGFloat = 0
    var newButtonCounter : Int = 10
    var buttonPatternCounter : Int = 0
    var stepCounter : Int = 0
    var startCounter : Int = 0
    var moveButtons : Bool = false
    var allZeros : Bool = false
    var allOnes : Bool = false
    var isGameOver = false
    var newWord = WordGrabber()
    
    func didLoadFromCCB() {
        OALSimpleAudio.sharedInstance().preloadEffect("Correct.wav")
        OALSimpleAudio.sharedInstance().preloadEffect("Fail.wav")
        OALSimpleAudio.sharedInstance().preloadEffect("LevelUp.wav")
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
        /*particles
        newParticles = [CCBReader load:"newButtonParticles"];
        newParticles.autoRemoveOnFinish = true
        newParticles.position = ccp(160,221)*/
        loadNewButtons()
        loadNewWord()
        self.userInteractionEnabled = true
    }
    
    override func update(delta: CCTime) {
        if startCounter > 0 {
            redZeroButton.position = ccp(redZeroButton.position.x + 60.225,redZeroButton.position.y)
            greenZeroButton.position = ccp(greenZeroButton.position.x + 60.225,greenZeroButton.position.y)
            blueZeroButton.position = ccp(blueZeroButton.position.x + 60.225,blueZeroButton.position.y)
            orangeZeroButton.position = ccp(orangeZeroButton.position.x + 60.225,orangeZeroButton.position.y)
            redOneButton.position = ccp(redOneButton.position.x + 60.225,redOneButton.position.y)
            greenOneButton.position = ccp(greenOneButton.position.x + 60.225,greenOneButton.position.y)
            blueOneButton.position = ccp(blueOneButton.position.x + 60.225,blueOneButton.position.y)
            orangeOneButton.position = ccp(orangeOneButton.position.x + 60.225,orangeOneButton.position.y)
            startCounter++
            if startCounter == 5 {
                startCounter = 0
                loadNewButtons()
                loadNewWord()
            }
        }
        else if isGameOver != true {
            timer = 2+(0.1*speedCounter)
            scoreBar.position = ccp(scoreBar.position.x-timer,scoreBar.position.y)
            if scoreBar.position.x <= -320 {
                isGameOver = true
                gameOver()
            }
        }
        if moveButtons == true {
            redZeroButton.position = ccp(redZeroButton.position.x + 60.225,redZeroButton.position.y)
            greenZeroButton.position = ccp(greenZeroButton.position.x + 60.225,greenZeroButton.position.y)
            blueZeroButton.position = ccp(blueZeroButton.position.x + 60.225,blueZeroButton.position.y)
            orangeZeroButton.position = ccp(orangeZeroButton.position.x + 60.225,orangeZeroButton.position.y)
            redOneButton.position = ccp(redOneButton.position.x + 60.225,redOneButton.position.y)
            greenOneButton.position = ccp(greenOneButton.position.x + 60.225,greenOneButton.position.y)
            blueOneButton.position = ccp(blueOneButton.position.x + 60.225,blueOneButton.position.y)
            orangeOneButton.position = ccp(orangeOneButton.position.x + 60.225,orangeOneButton.position.y)
            stepCounter++
            if stepCounter == 10 {
                moveButtons = false
            }
        }
    }
    
    func loadNewButtons () {
        //newButtons
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
            nodeArray[Int(firstNode)].position = ccp(-577.25,373) //Position Buttons
            nodeArray[Int(secondNode)].position = ccp(-577.25, 235.5)
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
            buttonArray[Int(firstButton)].position = ccp(-602.25,373)
            buttonArray[Int(secondButton)].position = ccp(-454.75,373)
            buttonArray[Int(thirdButton)].position = ccp(-602.25,235.5)
            buttonArray[Int(fourthButton)].position = ccp(-454.75,235.5)
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
        moveButtons = true
        stepCounter = 0
        levelCounter = 0
        buttonPatternCounter++
    }
    func loadNewWord () {
        var randomOneValue : UInt32 = arc4random_uniform(UInt32(oneColors.count))
        var randomZeroValue : UInt32 = arc4random_uniform(UInt32(zeroColors.count))
        var newCharacter : String = ""
        var wordString : String = ""
        var colorInt : Int = 0
        if allZeros == true {
            wordString = newWord.loadNewWord(1)
        }
        else if allOnes == true {
            wordString = newWord.loadNewWord(2)
        }
        else {
            wordString = newWord.loadNewWord(3)
        }
        for ii in 1...4 {
            newCharacter = String(wordString[ii] as Character)
            if newCharacter == "I" {
                newCharacter = "1"
                randomOneValue = arc4random_uniform(UInt32(oneColors.count))
                colorInt = oneColors[Int(randomOneValue)]
                buttonCharacters.append(oneColors[Int(randomOneValue)])
                allCharacters.append(oneColors[Int(randomOneValue)])
            }
            else if newCharacter == "O" {
                newCharacter = "0"
                randomZeroValue = arc4random_uniform(UInt32(zeroColors.count))
                colorInt = zeroColors[Int(randomZeroValue)]
                buttonCharacters.append(zeroColors[Int(randomZeroValue)])
                allCharacters.append(zeroColors[Int(randomZeroValue)])
            }
            else {
                allCharacters.append(-1)
            }
            if ii == 1 {
                letterOne.string = newCharacter
                if newCharacter == "0" || newCharacter == "1" {
                    letterOne.fontColor = getColor(colorInt)
                }
                else {
                    letterOne.fontColor = CCColor(red: 1.0, green: 1.0, blue: 1.0)
                }
            }
            else if ii == 2 {
                letterTwo.string = newCharacter
                if newCharacter == "0" || newCharacter == "1" {
                    letterTwo.fontColor = getColor(colorInt)
                }
                else {
                    letterTwo.fontColor = CCColor(red: 1.0, green: 1.0, blue: 1.0)
                }
            }
            else if ii == 3 {
                letterThree.string = newCharacter
                if newCharacter == "0" || newCharacter == "1" {
                    letterThree.fontColor = getColor(colorInt)
                }
                else {
                    letterThree.fontColor = CCColor(red: 1.0, green: 1.0, blue: 1.0)
                }
            }
            else if ii == 4 {
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
        var finished : Bool = false
        var characterSlot : Int = -1
        if checkingCharacter == buttonCharacters[0] {
            OALSimpleAudio.sharedInstance().playEffect("Correct.wav")
            for ii in 0...3 {
                if checkingCharacter == allCharacters[ii] && finished == false {
                    characterSlot = ii
                    finished = true
                    allCharacters[ii] = -1
                }
            }
            if characterSlot == 0 {
                letterOne.fontColor = getColor(5)
            }
            else if characterSlot == 1 {
                letterTwo.fontColor = getColor(5)
            }
            else if characterSlot == 2 {
                letterThree.fontColor = getColor(5)
            }
            else {
                letterFour.fontColor = getColor(5)
            }
            buttonCharacters.removeAtIndex(0)
        }
        else {
            gameOver()
        }
        if buttonCharacters.count == 0 {
            allCharacters.removeAll()
            levelCounter++
            speedCounter++
            getScore()
            if Int(levelCounter)%Int(newButtonCounter) == 0 {
                startCounter = 1
                if newButtonCounter > 3 {
                    newButtonCounter--
                }
            }
            else {
                loadNewWord()
            }
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
        OALSimpleAudio.sharedInstance().playEffect("Fail.wav")
    }
    
    func getColor (number: Int) -> CCColor {
        let red = CCColor(red: 1.0, green: 0.0, blue: 0.0)
        let green = CCColor(red: 0.0, green: 1.0, blue: 0.0)
        let blue = CCColor(red: 0.0078, green: 0.6289, blue: 0.9375)
        let orange = CCColor(red: 1.0, green: 0.4745, blue: 0.0392)
        let white = CCColor(red: 1.0, green: 1.0, blue: 1.0)
        let gold = CCColor(red:1.0, green: 0.8125, blue: 0.1602)
        let black = CCColor(red:0.0, green:0.0, blue:0.0)
        
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
        else if number == 5 {
            return white
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