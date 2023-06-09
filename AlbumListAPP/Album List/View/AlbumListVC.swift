//
//  AlbumListVC.swift
//  Starter Project
//
//  Created by MohamedNajeh on 31/03/2023.
//

import UIKit

class AlbumListVC: UIViewController {
    
    @IBOutlet weak var loafingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    let viewModel  = AlbumListViewModel()
    var thumbNails:Image?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate   = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "AlbumListCell", bundle: nil), forCellReuseIdentifier: "AlbumListCell")
        viewModel.getThumbNails()
        bindData()
    }
    
    func bindData(){
        viewModel.isLoading.bind { [weak self] isLodaing in
            switch isLodaing {
            case true:
                self?.loafingIndicator.startAnimating()
            case false:
                DispatchQueue.main.async {
                    self?.loafingIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.thumbNails.bind { [weak self] thumnails in
            guard let thumnails = thumnails else { return }
            self?.thumbNails = thumnails
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}




extension AlbumListVC:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumListCell", for: indexPath) as? AlbumListCell else { return UITableViewCell()}
        
        cell.configureCell(image: thumbNails?[indexPath.row].urls?.thumb ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        thumbNails?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FullScreenVC") as! FullScreenImageVC
        vc.imagePath = thumbNails?[indexPath.row].urls?.full ?? ""
        
        present(vc, animated: true)
    }
}
