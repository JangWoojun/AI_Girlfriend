import UIKit
import MessageKit
import InputBarAccessoryView


struct Sender: SenderType {
    var senderId: String
    var displayName: String
}

struct Message: MessageType {
    var sender: MessageKit.SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKit.MessageKind
}

class TalkChatViewController: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate, InputBarAccessoryViewDelegate {
    
    let currentUser = Sender(senderId: "self", displayName: "나")
    let otherUser = Sender(senderId: "other", displayName: "여친❤")
    var messages =  [MessageType]()
    
    private let talkChatView = TalkChatView()
    
    override func loadView() {
        view = talkChatView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageInputBar.delegate = self
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.inputTextView.placeholder = "메시지를 입력하세요."
        messageInputBar.sendButton.title = "전송"
        messageInputBar.sendButton.isEnabled = false
        
        messages.append(Message(sender: otherUser, messageId: "1", sentDate: Date().addingTimeInterval(-86400), kind: .text("오늘은 뭐하고 왔어 성준아?")))
        
        let layout = messagesCollectionView.collectionViewLayout as? MessagesCollectionViewFlowLayout
        layout?.setMessageOutgoingAvatarSize(.zero)
    }
    
    func sendButtonClicked() {
        guard let text = messageInputBar.inputTextView.text else { return }
        let message = Message(sender: currentUser, messageId: "self", sentDate: Date(), kind: .text(text))
        messages.append(message)
        messagesCollectionView.reloadData()
        messageInputBar.inputTextView.text = ""
        messageInputBar.invalidatePlugins()
    }
    
    func currentSender() -> MessageKit.SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> MessageKit.MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
        return messages.count
    }
    
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        sendButtonClicked()
    }
    
    
    
}

