import UIKit

class TalkView: UIView {
    
    let mainLabel: UILabel = {
        let tv = UILabel()
        tv.textColor = .black
        tv.font = .boldSystemFont(ofSize: 26)
        tv.text = "메시지"

        return tv
    }()
    
    func setUI() {
        self.addSubview(mainLabel)
        self.backgroundColor = .white
        
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            mainLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
