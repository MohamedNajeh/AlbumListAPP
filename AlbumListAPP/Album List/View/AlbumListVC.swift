//
//  AlbumListVC.swift
//  Starter Project
//
//  Created by MohamedNajeh on 31/03/2023.
//

import UIKit

class AlbumListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let viewModel = AlbumListViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getThumbNails()
    }
}
