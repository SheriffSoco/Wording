import Foundation

infix operator ^^ { }
func ^^ (radix: CGFloat, power: CGFloat) -> CGFloat {
    return pow(radix, power)
}

class MainScene: CCNode {
    var playImage : MenuButton!
    var helpImage : MenuButton!
    var aboutImage : MenuButton!
    var playNode : CCNode!
    var helpNode : CCNode!
    var aboutNode : CCNode!
    var timeCounter : Int = 0
    
    func didLoadFromCCB() {
        playImage.loadParticles()
        helpImage.loadParticles()
        aboutImage.loadParticles()
        playNode.position = ccp(-1314,0)
        helpNode.position = ccp(-1314,0)
        aboutNode.position = ccp(-1314,0)
        self.userInteractionEnabled = true
    }
    
    override func update(delta: CCTime) {
        playImage.moveParticles(0.5)
        helpImage.moveParticles(0.5)
        aboutImage.moveParticles(0.5)
        initialNodeMove(timeCounter)
        timeCounter++
    }
    
    func play() {
        let mainScene: CCScene = CCBReader.loadAsScene("Game")
        CCDirector.sharedDirector().replaceScene(mainScene);
    }
    
    func initialNodeMove(time: Int) {
        let pi : CGFloat = 3.14159265359
        var xposition : CGFloat
        var xx : CGFloat = -(CGFloat(time-80)/180)
        xposition = -150 * (10 ^^ xx)*(cos(4*pi*xx))
        if time < 100 {
            playNode.position = ccp(playNode.position.x + 12.81,0)
            helpNode.position = ccp(helpNode.position.x + 12.81,0)
            aboutNode.position = ccp(aboutNode.position.x + 12.81,0)
        }
        else {
            playNode.position = ccp(xposition,0)
            helpNode.position = ccp(xposition,0)
            aboutNode.position = ccp(xposition,0)
        }
    }
}
