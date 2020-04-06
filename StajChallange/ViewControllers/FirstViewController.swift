import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private lazy var viewModel = CoinViewModel()
    
    var choosenName = ""
    var choosenDescription = ""
    var choosenEditedPrice = ""
    var choosenSymbol = ""
    var choosenCoinHistories = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.registerTableViewCells()
        viewModel.fetchCoinResults()
        navigationItem.title = "Coin List"
        viewModel.addChangeHandler { [weak self] (state) -> Void in
            DispatchQueue.main.async {
                switch state {
                case .fetching:
                    self?.showSpinner()
                case .failed(let message):
                    self?.closeSpinner()
                    print(message!)
                case .succeeded:
                    self?.closeSpinner()
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.coins?.data?.coins?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell {
            cell.customCellSymbolLabel.text = viewModel.coins?.data?.coins?[indexPath.row].symbol ?? ""
            cell.customCellSymbolLabel.textColor = cell.textLabel?.textColor.hexStringToUIColor(hex: viewModel.coins?.data?.coins?[indexPath.row].color ?? "#00000")
            cell.customCellPriceLabel.text = String().editPrice(givenPrice: viewModel.coins?.data?.coins?[indexPath.row].price ?? "")
            cell.customCellPriceLabel.textColor = cell.textLabel?.textColor.hexStringToUIColor(hex: viewModel.coins?.data?.coins?[indexPath.row].color ?? "#00000")
            cell.customCellImage.image = UIImage(named: "coinIcon.png")
            return cell
        }
        return UITableViewCell()
    }
    
    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "CustomTableViewCell", bundle: nil)
        self.tableView.register(textFieldCell, forCellReuseIdentifier: "CustomTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let normalPrice = viewModel.coins?.data?.coins?[indexPath.row].price ?? ""
        let editedPrice = normalPrice.editPrice(givenPrice: normalPrice)
        choosenName = viewModel.coins?.data?.coins?[indexPath.row].name ?? ""
        choosenEditedPrice = editedPrice
        choosenDescription = viewModel.coins?.data?.coins?[indexPath.row].description ?? ""
        choosenSymbol = viewModel.coins?.data?.coins?[indexPath.row].symbol ?? ""
        choosenCoinHistories = (viewModel.coins?.data?.coins?[indexPath.row].history)!
        performSegue(withIdentifier: "toDetailViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailViewController" {
            let detailVC = segue.destination as? DetailViewController
            detailVC?.selectedName = choosenName
            detailVC?.selectedPrice = choosenEditedPrice
            detailVC?.selectedDescription = choosenDescription
            detailVC?.selectedSymbol = choosenSymbol
            detailVC?.selectedCoinHistories = choosenCoinHistories
        }
    }
}
