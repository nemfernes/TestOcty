import UIKit

class DetailRatesViewController: UIViewController {
       
    private lazy var nameLabel: UILabel = {
         let label = UILabel()
         label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium)
         label.textColor = .black
         label.textAlignment = .right
         label.setContentHuggingPriority(.required, for: .horizontal)
         label.setContentCompressionResistancePriority(.required, for: .horizontal)
         return label
     }()
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "heart"), for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.addSubviews()
        self.makeConstraints()
    }
    
}

extension DetailRatesViewController: Designable {
    func setupView() {
        self.view.backgroundColor = .white
    }
    
    func addSubviews() {
        [
            favoriteButton,
            nameLabel
        ].forEach(self.view.addSubview)
    }
    
    func makeConstraints() {
        
        self.nameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(15)
            make.centerX.equalToSuperview()
        }
        
        self.favoriteButton.snp.makeConstraints { make in
            make.height.width.equalTo(45)
            make.top.equalTo(nameLabel.snp.bottom).offset(25)
            make.trailing.equalToSuperview().inset(15)
        }
    }
    
    
}
