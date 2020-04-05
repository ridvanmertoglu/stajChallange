//
//  FirstViewController.swift
//  StajChallange
//
//  Created by RIDVAN on 4.04.2020.
//  Copyright © 2020 ridvanmertoglu. All rights reserved.
//

import UIKit
import SVGKit


class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    private lazy var viewModel = CoinViewModel()
    
    
    var choosenName = ""
    var choosenDescription = ""
    var choosenEditedPrice = ""
    var choosenSymbol = ""
    
    
    
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
                    // indicator
                    
                    self?.showSpinner()
                    print("fetching")
                case .failed(let message):
                    self?.closeSpinner()
                    print(message!)
                case .succeeded:
                    self?.closeSpinner()
                    self?.tableView.reloadData()
                    
                    //self?.tableView.reloadData()
                    print("deneme")
                    
                }
            }
        }
    }
    
  
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(viewModel.coins?.my_data?.coins?.count ?? 0)
        return viewModel.coins?.data?.coins?.count ?? 0
    }
    
  /*  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.textColor = cell.textLabel?.textColor.hexStringToUIColor(hex: viewModel.coins?.data?.coins?[indexPath.row].color ?? "#00000")
        
      /*  let normalPrice = viewModel.coins?.data?.coins?[indexPath.row].price ?? ""
        let editedPrice = normalPrice.editPrice(givenPrice: normalPrice)*/
        
        
        cell.textLabel?.text = (viewModel.coins?.data?.coins?[indexPath.row].symbol ?? "") + "                                         " + (String().editPrice(givenPrice: viewModel.coins?.data?.coins?[indexPath.row].price ?? ""))
        
        //download(url: viewModel.coins?.data?.coins?[indexPath.row].iconUrl ?? "https://cdn.coinranking.com/rk4RKHOuW/eth.svg", coinName: viewModel.coins?.data?.coins?[indexPath.row].name ?? "Ethereum")
        //print(viewModel.coins?.data?.coins?[indexPath.row].name!)
        cell.imageView?.image = UIImage().getSVG(imageName:viewModel.coins?.data?.coins?[indexPath.row].name ?? "Tether")
        //cell.imageView?.image?.draw(in: CGRect(x: 0, y: 0, width: 0.7, height: 0.7))
        
        
        
        
        
        return cell
    }*/
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell {
            cell.customCellNameLabel.text = viewModel.coins?.data?.coins?[indexPath.row].symbol ?? ""
            cell.customCellNameLabel.textColor = cell.textLabel?.textColor.hexStringToUIColor(hex: viewModel.coins?.data?.coins?[indexPath.row].color ?? "#00000")
            cell.customCellPriceLabel.text = String().editPrice(givenPrice: viewModel.coins?.data?.coins?[indexPath.row].price ?? "")
            cell.customCellPriceLabel.textColor = cell.textLabel?.textColor.hexStringToUIColor(hex: viewModel.coins?.data?.coins?[indexPath.row].color ?? "#00000")
            //cell.customCellImage.image = UIImage().getSVG(imageName:viewModel.coins?.data?.coins?[indexPath.row].name ?? "Tether")
            cell.customCellImage.image = UIImage(named: "icon.png")
            return cell
        }
        
        return UITableViewCell()
    }
    
    private func registerTableViewCells() {
        let textFieldCell = UINib(nibName: "CustomTableViewCell",
                                  bundle: nil)
        self.tableView.register(textFieldCell,
                                forCellReuseIdentifier: "CustomTableViewCell")
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let normalPrice = viewModel.coins?.data?.coins?[indexPath.row].price ?? ""
        let editedPrice = normalPrice.editPrice(givenPrice: normalPrice)
        choosenName = viewModel.coins?.data?.coins?[indexPath.row].name ?? ""
        choosenEditedPrice = editedPrice
        choosenDescription = viewModel.coins?.data?.coins?[indexPath.row].description ?? ""
        choosenSymbol = viewModel.coins?.data?.coins?[indexPath.row].symbol ?? ""
        performSegue(withIdentifier: "toDetailViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailViewController" {
            let detailVC = segue.destination as? DetailViewController
            detailVC?.selectedName = choosenName
            detailVC?.selectedPrice = choosenEditedPrice
            detailVC?.selectedDescription = choosenDescription
            detailVC?.selectedSymbol = choosenSymbol
        }
    }
    
    func download(url:String, coinName:String) {

        //let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0];

        let filePath="/Users/ridvan/Desktop/invio/StajChallange/StajChallange/\(coinName).svg"
        //print(documentsPath)

        DispatchQueue.global(qos: .background).async {
            

            if let url = URL(string: url),
                

                let urlData = NSData(contentsOf: url) {

                DispatchQueue.main.async {
                    
                    urlData.write(toFile: filePath, atomically: true)
                    
                    

                    print("done-----------------------------")

                }
            }
        }
    }
    
   /* func getSVG(coinName:String) -> UIImage {
        
       
        
        
        let namSvgImgVar: SVGKImage = SVGKImage(named: coinName)
        //let namSvgImgVyuVar = SVGKImageView(svgkImage: namSvgImgVar)
        
        let namImjVar: UIImage = namSvgImgVar.uiImage
        return namImjVar
    }
*/
    
    
    
    
    

}
