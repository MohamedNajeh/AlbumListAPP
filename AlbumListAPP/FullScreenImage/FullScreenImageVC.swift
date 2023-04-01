//
//  FullScreenImageVC.swift
//  AlbumListAPP
//
//  Created by MohamedNajeh on 01/04/2023.
//

import UIKit

class FullScreenImageVC: UIViewController {

    @IBOutlet weak var imageVOutlet: UIImageView!
    var imagePath:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let imagePath = imagePath else { return }
        getImage(imagePath: imagePath)
        
    }
    
    func getImage(imagePath:String){
        self.imageVOutlet.downloadImg(from: imagePath)
    }

}
