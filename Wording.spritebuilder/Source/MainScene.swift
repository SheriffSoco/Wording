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
    var playNode : CCNode!
    var helpNode : CCNode!
    var aboutNode : CCNode!
    var mainNode : CCNode!
    var creditNode : CCNode!
    var timeCounter : Int = 0
    var caseVariable : Int = 0
    
    func didLoadFromCCB() {
        playImage.loadParticles()
        helpImage.loadParticles()
        aboutImage.loadParticles()
        playNode.position = ccp(-1314,0)
        helpNode.position = ccp(-1314,0)
        aboutNode.position = ccp(-1314,0)
        playButton.enabled = false
        helpButton.enabled = false
        aboutButton.enabled = false
        backButton.enabled = false
        self.userInteractionEnabled = true
    }
    
    override func update(delta: CCTime) {
        playImage.moveParticles(0.5)
        helpImage.moveParticles(0.5)
        aboutImage.moveParticles(0.5)
        initialNodeMove(timeCounter, choice: caseVariable)
        if timeCounter == 80 && caseVariable == 1 {
            let mainScene: CCScene = CCBReader.loadAsScene("Game")
            CCDirector.sharedDirector().replaceScene(mainScene);
        }
        timeCounter++
    }
    
    func play() {
        timeCounter = 0
        caseVariable = 1
        playButton.enabled = false
        helpButton.enabled = false
        aboutButton.enabled = false
        backButton.enabled = false
    }
    
    func help() {
        
    }
    
    func about() {
        timeCounter = 0
        caseVariable = 2
        playButton.enabled = false
        helpButton.enabled = false
        aboutButton.enabled = false
        backButton.enabled = false
    }
    
    func back() {
        timeCounter = 0
        caseVariable = 3
        playButton.enabled = false
        helpButton.enabled = false
        aboutButton.enabled = false
        backButton.enabled = false
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
            if time < 100 {
                playNode.position = ccp(playNode.position.x + 12.81,0)
                helpNode.position = ccp(helpNode.position.x + 12.81,0)
                aboutNode.position = ccp(aboutNode.position.x + 12.81,0)
            }
            else if time < 193 {
                playNode.position = ccp(xposition,0)
                helpNode.position = ccp(xposition,0)
                aboutNode.position = ccp(xposition,0)
            }
            else {
                playNode.position = ccp(0,0)
                helpNode.position = ccp(0,0)
                aboutNode.position = ccp(0,0)
                playButton.enabled = true
                helpButton.enabled = true
                aboutButton.enabled = true
                backButton.enabled = true
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
        case 3:
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
}
