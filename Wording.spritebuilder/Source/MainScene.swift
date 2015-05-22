import Foundation

class MainScene: CCNode {
    var nextScene: NSString = "Menu"
    
    func didLoadFromCCB() {
        self.userInteractionEnabled = true
    }
    
    override func update(delta: CCTime) {
    }
    func play() {
        let mainScene: CCScene = CCBReader.loadAsScene("Game")
        CCDirector.sharedDirector().replaceScene(mainScene);
    }
}
