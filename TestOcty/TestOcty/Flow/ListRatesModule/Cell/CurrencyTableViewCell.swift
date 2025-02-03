//
//  CurrencyTableViewCell.swift
//  TestOcty
//
//  Created by Dmitry Kirpichev on 03.02.2025.
//
import SnapKit
import UIKit

class CurrencyTableViewCell: UITableViewCell, Reusable {

   private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        label.textColor = .black
        label.textAlignment = .right
        label.setContentHuggingPriority(.required, for: .horizontal)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        return label
    }()
    
    private lazy var codeLabel: UILabel = {
         let label = UILabel()
         label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        label.textColor = .black
         label.textAlignment = .right
         label.setContentHuggingPriority(.required, for: .horizontal)
         label.setContentCompressionResistancePriority(.required, for: .horizontal)
         return label
     }()
    
    private lazy var rateLabel: UILabel = {
         let label = UILabel()
         label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
         label.textColor = .black
         label.textAlignment = .right
         label.setContentHuggingPriority(.required, for: .horizontal)
         label.setContentCompressionResistancePriority(.required, for: .horizontal)
         return label
     }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
        self.addSubviews()
        self.makeConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with currency: Currency) {
        nameLabel.text = currency.name
        rateLabel.text = String(format: "%.2f", currency.rate)
        codeLabel.text = currency.code
       }
}

extension CurrencyTableViewCell: Designable {
    
    func setupView() {
        self.selectionStyle = .none
        self.backgroundColor = .clear
    }

    func addSubviews() {
        [
            codeLabel,
            nameLabel,
            rateLabel,
            separatorView
        ].forEach(self.addSubview)
    }

    func makeConstraints() {

        self.nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(15)
        }
        self.codeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(nameLabel.snp.trailing).offset(15)
        }
        self.rateLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(15)
        }
        
        self.separatorView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.trailing.leading.equalToSuperview().inset(15)
            make.height.equalTo(1)
        }
    }
}
