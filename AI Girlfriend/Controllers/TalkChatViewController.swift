import UIKit

class TalkChatViewController: UIViewController {
    
    private let talkChatView = TalkChatView()
    
    override func loadView() {
        view = talkChatView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
    }
    

}
