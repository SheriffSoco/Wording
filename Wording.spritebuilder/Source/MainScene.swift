import Foundation

infix operator ^^ { }
func ^^ (radix: CGFloat, power: CGFloat) -> CGFloat {
    return pow(radix, power)
}

class MainScene: CCNode {
    var playImage : MenuButton!
    var helpImage : MenuButton!
    var aboutImage : MenuButton!
    var playButton : CCButton!
    var helpButton : CCButton!
    var aboutButton : CCButton!
    var backButton : CCButton!
    var githubNode : CCNode!
    var twitterNode : CCNode!
    var playNode : CCNode!
    var helpNode : CCNode!
    var aboutNode : CCNode!
    var mainNode : CCNode!
    var creditNode : CCNode!
    var timeCounter : Int = 0
    var caseVariable : Int = 0
    var subCaseVariable : Int = 0
    var linkMove : Int = 0
    var linkTime : Int = 0
    //helpScreen
    var helpScene : CCNode!
    var letterOne : CCLabelTTF!
    var letterTwo : CCLabelTTF!
    var letterThree : CCLabelTTF!
    var letterFour : CCLabelTTF!
    var helpText : CCLabelTTF!
    var scoreBar : CCNodeColor!
    var buttonBackground : CCNodeColor!
    var helpBackground : CCNodeColor!
    var redZeroNode : CCNode!
    var redOneNode : CCNode!
    var blueZeroNode : CCNode!
    var blueOneNode : CCNode!
    var redZeroImage : GameButton!
    var redOneImage : GameButton!
    var blueZeroImage : GameButton!
    var blueOneImage : GameButton!
    var redZeroButton : CCButton!
    var redOneButton : CCButton!
    var blueZeroButton : CCButton!
    var blueOneButton : CCButton!
    var sceneButton : CCButton!
    var startHelp : Int = 0
    var wordCase : Int = 0
    
    func didLoadFromCCB() {
        OALSimpleAudio.sharedInstance().preloadEffect("Correct.wav")
        OALSimpleAudio.sharedInstance().preloadEffect("Play.wav")
        OALSimpleAudio.sharedInstance().preloadEffect("Help.wav")
        OALSimpleAudio.sharedInstance().preloadEffect("About.wav")
        OALSimpleAudio.sharedInstance().preloadEffect("BackComp.wav")
        OALSimpleAudio.sharedInstance().preloadEffect("Continue.wav")
        playImage.loadParticles()
        helpImage.loadParticles()
        aboutImage.loadParticles()
        redZeroImage.loadParticles()
        redOneImage.loadParticles()
        blueZeroImage.loadParticles()
        blueOneImage.loadParticles()
        playNode.position = ccp(-1314,0)
        helpNode.position = ccp(-1314,0)
        aboutNode.position = ccp(-1314,0)
        playButton.enabled = false
        helpButton.enabled = false
        aboutButton.enabled = false
        backButton.enabled = false
        redZeroButton.enabled = true
        redOneButton.enabled = true
        blueZeroButton.enabled = true
        blueOneButton.enabled = true
        sceneButton.enabled = false
        self.userInteractionEnabled = true
    }
    
    override func update(delta: CCTime) {
        playImage.moveParticles(0.5)
        helpImage.moveParticles(0.5)
        aboutImage.moveParticles(0.5)
        redZeroImage.moveParticles(0.5)
        redOneImage.moveParticles(0.5)
        blueZeroImage.moveParticles(0.5)
        blueOneImage.moveParticles(0.5)
        initialNodeMove(timeCounter, choice: caseVariable)
        if timeCounter == 80 && caseVariable == 1 {
            let mainScene: CCScene = CCBReader.loadAsScene("Game")
            CCDirector.sharedDirector().replaceScene(mainScene);
        }
        if linkMove != 0 {
            linkMovement(linkTime, choice: linkMove)
        }
        timeCounter++
        linkTime++
    }
    
    func play() {
        OALSimpleAudio.sharedInstance().playEffect("Play.wav")
        timeCounter = 0
        caseVariable = 1
        linkMove = -1
        linkTime = 0
        playButton.enabled = false
        helpButton.enabled = false
        aboutButton.enabled = false
        backButton.enabled = false
    }
    
    func help() {
        OALSimpleAudio.sharedInstance().playEffect("Help.wav")
        timeCounter = 0
        caseVariable = 2
        subCaseVariable = 0
        wordCase = 0
        letterOne.string = "L"
        letterTwo.string = "1"
        letterThree.string = "0"
        letterFour.string = "N"
        letterOne.fontColor = CCColor(red:0.0, green:0.0, blue:0.0)
        letterTwo.fontColor = CCColor(red: 0.0078, green: 0.6289, blue: 0.9375)
        letterThree.fontColor = CCColor(red: 1.0, green: 0.0, blue: 0.0)
        letterFour.fontColor = CCColor(red:0.0, green:0.0, blue:0.0)
        helpBackground.opacity = 0
        buttonBackground.opacity = 0
        helpText.opacity = 0
        letterOne.opacity = 0
        letterTwo.opacity = 0
        letterThree.opacity = 0
        letterFour.opacity = 0
        redZeroButton.position = ccp(-1000,0)
        redOneButton.position = ccp(-1000,0)
        blueZeroButton.position = ccp(-1000,0)
        blueOneButton.position = ccp(-1000,0)
        scoreBar.position = ccp(-420, scoreBar.position.y)
        playButton.enabled = false
        helpButton.enabled = false
        aboutButton.enabled = false
    }
    
    func about() {
        OALSimpleAudio.sharedInstance().playEffect("About.wav")
        timeCounter = 0
        caseVariable = 3
        playButton.enabled = false
        helpButton.enabled = false
        aboutButton.enabled = false
        backButton.enabled = false
    }
    
    func back() {
        OALSimpleAudio.sharedInstance().playEffect("BackComp.wav")
        timeCounter = 0
        caseVariable = 4
        playButton.enabled = false
        helpButton.enabled = false
        aboutButton.enabled = false
        backButton.enabled = false
    }
    
    func github() {
        var url : NSURL? = NSURL(string: "https://github.com/SheriffSoco/Wording")
        UIApplication.sharedApplication().openURL(url!)
    }
    
    func twitter() {
        var url : NSURL? = NSURL(string: "https://twitter.com/TwinningInc")
        UIApplication.sharedApplication().openURL(url!)
    }
    
    func initialNodeMove(time: Int, choice: Int) {
        let pi : CGFloat = 3.14159265359
        var xposition : CGFloat
        var xx : CGFloat
        var yposition : CGFloat
        var yy : CGFloat
        var squareline : CGFloat
        switch choice {
        case 0:
            xx = -(CGFloat(time-80)/180)
            xposition = -150 * (10 ^^ xx)*(cos(4*pi*xx))
            yposition = 0.04 * (CGFloat(time - 180) ^^ 2) - 66.2
            if time < 100 {
                playNode.position = ccp(playNode.position.x + 12.81,0)
                helpNode.position = ccp(helpNode.position.x + 12.81,0)
                aboutNode.position = ccp(aboutNode.position.x + 12.81,0)
            }
            else if time < 193 {
                playNode.position = ccp(xposition,0)
                helpNode.position = ccp(xposition,0)
                aboutNode.position = ccp(xposition,0)
                linkTime = 0
            }
            else {
                playNode.position = ccp(0,0)
                helpNode.position = ccp(0,0)
                aboutNode.position = ccp(0,0)
                playButton.enabled = true
                helpButton.enabled = true
                aboutButton.enabled = true
                backButton.enabled = true
                linkMove = 1
            }
            break;
        case 1:
            xx = CGFloat(time-113)/180
            xposition = -150 * (10 ^^ xx)*(cos(4*pi*xx))
            squareline = 2000.0*((xx + 0.35) ^^ 2.0) + 4.669
            if time < 50 {
                playNode.position = ccp(xposition,0)
                helpNode.position = ccp(xposition,0)
                aboutNode.position = ccp(xposition,0)
            }
            else {
                playNode.position = ccp(playNode.position.x + squareline,0)
                helpNode.position = ccp(helpNode.position.x + squareline,0)
                aboutNode.position = ccp(aboutNode.position.x + squareline,0)
            }
            break;
        case 2:
            switch subCaseVariable {
            case 0:
                if time == 0 {
                    helpScene.visible = true
                }
                if time < 10 {
                    helpBackground.opacity = helpBackground.opacity + 0.10
                }
                else if time < 20 {
                    helpText.opacity = helpText.opacity + 0.10
                }
                else {
                    sceneButton.enabled = true
                }
                break;
            case 1:
                if time < 10 {
                    letterOne.opacity = letterOne.opacity + 0.10
                    letterTwo.opacity = letterTwo.opacity + 0.10
                    letterThree.opacity = letterThree.opacity + 0.10
                    letterFour.opacity = letterFour.opacity + 0.10
                    helpText.opacity = helpText.opacity - 0.10
                }
                else if time == 10 {
                    helpText.string = "Words have colored 0's and 1's"
                }
                else if time < 21 {
                    helpText.opacity = helpText.opacity + 0.10
                }
                else {
                    sceneButton.enabled = true
                }
                break;
            case 2:
                if time < 10 {
                    redZeroNode.position = ccp(redZeroNode.position.x + 40, redZeroNode.position.y)
                    redOneNode.position = ccp(redOneNode.position.x + 40, redOneNode.position.y)
                    blueZeroNode.position = ccp(blueZeroNode.position.x + 40, blueZeroNode.position.y)
                    blueOneNode.position = ccp(blueOneNode.position.x + 40, blueOneNode.position.y)
                    buttonBackground.opacity = buttonBackground.opacity + 0.10
                    helpText.opacity = helpText.opacity - 0.10
                }
                else if time == 10 {
                    helpText.string = "Tap the buttons that match\nthe colored 0's and 1's"
                }
                else if time < 21 {
                    helpText.opacity = helpText.opacity + 0.10
                }
                else {
                    sceneButton.enabled = true
                }
                break;
            case 3:
                if time == 0 {
                    helpText.string = "The 1 is blue"
                    sceneButton.enabled = true
                }
                break;
            case 4:
                if time == 0 {
                    blueOneButton.position = ccp(0,0)
                    helpText.string = "Tap the button with the blue 1"
                }
                break;
            case 5:
                if time == 0 {
                    blueOneButton.position = ccp(-1000,0)
                    helpText.string = "The 0 is red"
                    sceneButton.enabled = true
                }
                break;
            case 6:
                if time == 0 {
                    redZeroButton.position = ccp(0,0)
                    helpText.string = "Tap the button with the red 0"
                }
                break;
            case 7:
                if time < 10 {
                    redZeroButton.position = ccp(-1000,0)
                    scoreBar.position = ccp(scoreBar.position.x + 20, scoreBar.position.y)
                    helpText.opacity = helpText.opacity - 0.10
                }
                else if time == 10 {
                    helpText.string = "There's a timer below the word"
                    scoreBar.position = ccp(scoreBar.position.x + 20, scoreBar.position.y)
                }
                else if time < 21 {
                    helpText.opacity = helpText.opacity + 0.10
                    scoreBar.position = ccp(scoreBar.position.x + 20, scoreBar.position.y)
                }
                else {
                    sceneButton.enabled = true
                }
                break;
            case 8:
                if time == 0 {
                    helpText.string = "Complete the word before\ntime runs out"
                    letterOne.string = "M"
                    letterTwo.string = "0"
                    letterThree.string = "N"
                    letterFour.string = "0"
                    letterOne.fontColor = CCColor(red:0.0, green:0.0, blue:0.0)
                    letterTwo.fontColor = CCColor(red: 0.0078, green: 0.6289, blue: 0.9375)
                    letterThree.fontColor = CCColor(red:0.0, green:0.0, blue:0.0)
                    letterFour.fontColor = CCColor(red: 1.0, green: 0.0, blue: 0.0)
                    redZeroButton.position = ccp(0,0)
                    redOneButton.position = ccp(0,0)
                    blueZeroButton.position = ccp(0,0)
                    blueOneButton.position = ccp(0,0)
                    wordCase = 2
                }
                scoreBar.position = ccp(scoreBar.position.x - 1, scoreBar.position.y)
                if scoreBar.position.x == -320 {
                    scoreBar.position = ccp(0, scoreBar.position.y)
                }
                break;
            case 9:
                if time < 41 {
                    helpText.string = "Good!"
                }
                else if time < 81 {
                    redZeroNode.position = ccp(redZeroNode.position.x - 20, redZeroNode.position.y)
                    redOneNode.position = ccp(redOneNode.position.x - 20, redOneNode.position.y)
                    blueZeroNode.position = ccp(blueZeroNode.position.x - 20, blueZeroNode.position.y)
                    blueOneNode.position = ccp(blueOneNode.position.x - 20, blueOneNode.position.y)
                    scoreBar.position = ccp(scoreBar.position.x - 10, scoreBar.position.y)
                }
                else if time < 101 {
                    scoreBar.position = ccp(scoreBar.position.x - 10, scoreBar.position.y)
                }
                else if time < 121 {
                    scoreBar.position = ccp(scoreBar.position.x - 10, scoreBar.position.y)
                    buttonBackground.opacity = buttonBackground.opacity - 0.05
                }
                else if time < 131 {
                    letterOne.opacity = letterOne.opacity - 0.10
                    letterTwo.opacity = letterTwo.opacity - 0.10
                    letterThree.opacity = letterThree.opacity - 0.10
                    letterFour.opacity = letterFour.opacity - 0.10
                    helpText.opacity = helpText.opacity - 0.10
                }
                else if time < 141 {
                    helpBackground.opacity = helpBackground.opacity - 0.10
                }
                else if time == 152 {
                    helpScene.visible = false
                    playButton.enabled = true
                    helpButton.enabled = true
                    aboutButton.enabled = true
                    helpText.string = "Welcome to Wording!\nLet's begin!"
                }
                break;
            default:
                println("Something went wrong :(")
            }
            break;
        case 3:
            yy = CGFloat(time)
            yposition = yy ^^ 2
            if yy < 28 {
                mainNode.position = ccp(mainNode.position.x, yposition)
                creditNode.position = ccp(creditNode.position.x, yposition - 750)
            }
            else {
                mainNode.position = ccp(mainNode.position.x, 750)
                creditNode.position = ccp(creditNode.position.x, 0)
                playButton.enabled = true
                helpButton.enabled = true
                aboutButton.enabled = true
                backButton.enabled = true
            }
            break;
        case 4:
            yy = CGFloat(time)
            yposition = -(yy ^^ 2) + 750
            if yy < 28 {
                mainNode.position = ccp(mainNode.position.x, yposition)
                creditNode.position = ccp(creditNode.position.x, yposition - 750)
            }
            else {
                mainNode.position = ccp(mainNode.position.x, 0)
                creditNode.position = ccp(creditNode.position.x, -750)
                playButton.enabled = true
                helpButton.enabled = true
                aboutButton.enabled = true
                backButton.enabled = true
            }
            break;
        default:
            println("Something went wrong :(")
        }
    }
    
    func linkMovement(time: Int, choice: Int) {
        var yposition : CGFloat
        switch choice {
        case -1:
            yposition = -2.94 * CGFloat(time) + 33.8
            if time < 21 {
                githubNode.position = ccp(githubNode.position.x, githubNode.position.y - 2.94)
                twitterNode.position = ccp(twitterNode.position.x, twitterNode.position.y - 2.94)
            }
            else {
                linkMove = 0
            }
            break;
            
        case 1:
            yposition = 2.94 * CGFloat(time) - 25
            if time < 21 {
                githubNode.position = ccp(githubNode.position.x, githubNode.position.y + 2.94)
                twitterNode.position = ccp(twitterNode.position.x, twitterNode.position.y + 2.94)
            }
            else {
                linkMove = 0
            }
            break;
            
        default:
            println("Something went wrong :(")
        }
    }
    
    func updateHelp() {
        OALSimpleAudio.sharedInstance().playEffect("Continue.wav")
        subCaseVariable++
        timeCounter = 0
        sceneButton.enabled = false
    }
    
    func redZero() {
        if subCaseVariable == 6 {
            OALSimpleAudio.sharedInstance().playEffect("Correct.wav")
            letterThree.fontColor = CCColor(red: 1.0, green: 1.0, blue: 1.0)
            subCaseVariable++
            timeCounter = 0
        }
        else if subCaseVariable == 8 && wordCase == 1 {
            OALSimpleAudio.sharedInstance().playEffect("Correct.wav")
            letterFour.fontColor = CCColor(red: 1.0, green: 1.0, blue: 1.0)
            wordCase = 0
            subCaseVariable++
            timeCounter = 0
        }
    }
    
    func redOne() {
    }
    
    func blueZero() {
        if subCaseVariable == 8 && wordCase == 2 {
            OALSimpleAudio.sharedInstance().playEffect("Correct.wav")
            letterTwo.fontColor = CCColor(red: 1.0, green: 1.0, blue: 1.0)
            wordCase = 1
        }
    }
    
    func blueOne() {
        if subCaseVariable == 4 {
            OALSimpleAudio.sharedInstance().playEffect("Correct.wav")
            letterTwo.fontColor = CCColor(red: 1.0, green: 1.0, blue: 1.0)
            subCaseVariable++
            timeCounter = 0
        }
    }
}
