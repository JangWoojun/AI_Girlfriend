import UIKit

class TalkTableViewCell: UITableViewCell {
    
    let mainImage: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "girlfriend2")
            
        return img
    }()
    
    let nameLabel: UILabel = {
        let tv = UILabel()
        tv.textColor = .black
        tv.font = .systemFont(ofSize: 17)
        tv.text = "여친❤"
        
        return tv
    }()
    
    let contextLabel: UILabel = {
        let tv = UILabel()
        tv.textColor = .gray
        tv.font = .systemFont(ofSize: 15)
        tv.text = "그는 신이야"
        
        return tv
    }()
    
    lazy var textStack: UIStackView = {
        let st = UIStackView(arrangedSubviews: [nameLabel, contextLabel])
        st.axis = .vertical
        st.spacing = 0
        st.distribution = .fill
        st.alignment = .fill
        
        return st
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.addSubview(mainImage)
        self.addSubview(textStack)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        setUI()
        super.updateConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainImage.clipsToBounds = true
        mainImage.layer.cornerRadius = self.mainImage.frame.width / 2
        mainImage.layer.borderWidth = 1
        mainImage.layer.borderColor = UIColor.gray.cgColor
    }
    
    func setUI() {
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        textStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainImage.heightAnchor.constraint(equalToConstant: 55),
            mainImage.widthAnchor.constraint(equalToConstant: 55),
            mainImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            mainImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            textStack.leadingAnchor.constraint(equalTo: mainImage.trailingAnchor, constant: 12),
            textStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            textStack.topAnchor.constraint(equalTo: mainImage.topAnchor, constant: 4),
            textStack.bottomAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: -6)
        ])
    }
}
