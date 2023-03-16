import UIKit
import MessageKit

class TalkChatViewController: UIViewController {
    
    private let talkChatView = TalkChatView()
    
    override func loadView() {
        view = talkChatView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}
