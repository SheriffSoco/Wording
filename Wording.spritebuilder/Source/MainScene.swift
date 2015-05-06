import Foundation

class MainScene: CCNode {
    var nextScene: NSString = "Game"
    var whiteZeroButton : CCButton!
    var whiteOneButton : CCButton!
    var redZeroButton : CCButton!
    var redOneButton : CCButton!
    var blueZeroButton : CCButton!
    var blueOneButton : CCButton!
    var greenZeroButton : CCButton!
    var greenOneButton : CCButton!
    var orangeZeroButton : CCButton!
    var orangeOneButton : CCButtton!
    
    func didLoadFromCCB() {
        self.userInteractionEnabled = true
    }
    
    override func update(delta: CCTime) {
        if nextScene == "Game" {
            let mainScene: CCScene = CCBReader.loadAsScene(nextScene)
            CCDirector.sharedDirector().replaceScene(mainScene);
        }
    }
}
