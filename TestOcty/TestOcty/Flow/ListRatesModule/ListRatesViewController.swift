import UIKit

class ListRatesViewController: UIViewController {
    
    private lazy var currencyTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(CurrencyTableViewCell.self, forCellReuseIdentifier: CurrencyTableViewCell.defaultReuseIdentifier)
        return tableView
    }()
    private lazy var historyButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "history"), for: .normal)
        return button
    }()
    private lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "heart"), for: .normal)
        return button
    }()
    private var currencies: [Currency] = [Currency(name: "USD", code: "USDT", rate: 0.858558), Currency(name: "EUR", code: "EURT", rate: 0.858558), Currency(name: "GBP", code: "GBPT", rate: 0.858558)]
       

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.addSubviews()
        self.makeConstraints()
    }
    
}

extension ListRatesViewController: Designable {
    func setupView() {
        self.view.backgroundColor = .white
    }
    
    func addSubviews() {
        [
            currencyTableView,
            favoriteButton,
            historyButton
        ].forEach(self.view.addSubview)
    }
    
    func makeConstraints() {
        self.currencyTableView.snp.makeConstraints { make in
            make.top.equalTo(historyButton.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(15)
        }
        
        self.historyButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.height.width.equalTo(25)
            make.leading.equalToSuperview().inset(15)
        }
        
        self.favoriteButton.snp.makeConstraints { make in
            make.centerY.equalTo(historyButton)
            make.height.width.equalTo(25)
            make.trailing.equalToSuperview().inset(15)
        }
    }
    
    
}

extension ListRatesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return currencies.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell: CurrencyTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            let currency = currencies[indexPath.row]
            cell.configure(with: currency)
            return cell
        }
}
