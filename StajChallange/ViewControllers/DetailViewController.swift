import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var historyTableView: UITableView!
    @IBOutlet weak var tableNameLabel: UILabel!
    
    var selectedName = ""
    var selectedPrice = ""
    var selectedDescription = ""
    var selectedSymbol = ""
    var selectedCoinHistories = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = selectedSymbol
        descriptionLabel.text = selectedDescription
        imageView.image = UIImage().getSVG(imageName: selectedName)
        nameLabel.text = selectedName
        priceLabel.text = selectedPrice
        tableNameLabel.text = "History of " + selectedName
        historyTableView.delegate = self
        historyTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedCoinHistories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = String().editPrice(givenPrice: selectedCoinHistories[indexPath.row])
        return cell
    }
}
