import Foundation

class MainScene: CCNode {
    var nextScene: NSString = "Game"
    
    func didLoadFromCCB() {
        self.userInteractionEnabled = true
    }
    
    override func update(delta: CCTime) {
        if nextScene == "Game" {
            let mainScene: CCScene = CCBReader.loadAsScene(nextScene)
            CCDirector.sharedDirector().replaceScene(mainScene);
            nextScene == "Done"
        }
    }
}
