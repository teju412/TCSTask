

import UIKit

class NewsListTableViewCell: UITableViewCell {
    
    // MARK: - Components
    lazy var backView: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    lazy var userImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.layer.cornerRadius = CGFloat(40)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var titleNameLbl: UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.font = .boldSystemFont(ofSize: 18)
        return lbl
    }()
    
    lazy var descriptionLbl: UILabel = {
        let lbl = UILabel(frame: .zero)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        return lbl
    }()
    
    // MARK: - Constraints
        func addBackViewConstraints() {
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: CGFloat(0)).isActive = true
        backView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: CGFloat(0)).isActive = true
        backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: CGFloat(0)).isActive = true
        backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: CGFloat(0)).isActive = true
    }
    
    func addUIImageViewConstraints() {
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userImage.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: CGFloat(20)).isActive = true
        userImage.topAnchor.constraint(equalTo: backView.topAnchor, constant: CGFloat(20)).isActive = true
        userImage.bottomAnchor.constraint(greaterThanOrEqualTo: backView.bottomAnchor, constant: CGFloat(-20)).isActive = true
        userImage.heightAnchor.constraint(equalToConstant: CGFloat(80)).isActive = true
        userImage.widthAnchor.constraint(equalToConstant: CGFloat(80)).isActive = true
    }
    
    func addTitleNameLabelConstraints() {
        titleNameLbl.translatesAutoresizingMaskIntoConstraints = false
        titleNameLbl.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: CGFloat(20)).isActive = true
        titleNameLbl.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: CGFloat(-20)).isActive = true
        titleNameLbl.topAnchor.constraint(equalTo: backView.topAnchor, constant: CGFloat(10)).isActive = true
    }
    
    func addDescriptionLabelConstraints() {
        descriptionLbl.translatesAutoresizingMaskIntoConstraints = false
        descriptionLbl.leadingAnchor.constraint(equalTo: titleNameLbl.leadingAnchor).isActive = true
        descriptionLbl.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: CGFloat(-20)).isActive = true
        descriptionLbl.topAnchor.constraint(equalTo: titleNameLbl.bottomAnchor, constant: CGFloat(10)).isActive = true
        descriptionLbl.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: CGFloat(-20)).isActive = true
    }

    // MARK: - Lifecycle
    func configure(data: NewsApiArticle) {
        self.titleNameLbl.text = data.title
        self.descriptionLbl.text = data.description
        self.userImage.load(url: URL(string: data.urlToImage!)!)
        addViews()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func addViews() {
        self.contentView.addSubview(backView)
        backView.addSubview(userImage)
        backView.addSubview(titleNameLbl)
        backView.addSubview(descriptionLbl)
        addBackViewConstraints()
        addUIImageViewConstraints()
        addTitleNameLabelConstraints()
        addDescriptionLabelConstraints()
    }

}
