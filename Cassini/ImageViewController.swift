//
//  ImageViewController.swift
//  Cassini
//
//  Created by Shakaib Akhtar on 16/08/2019.
//  Copyright © 2019 iParagons. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    var imageUrl: URL? {
        didSet {
            imageView.image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
    }

    @IBOutlet weak var imageView: UIImageView!
    
    private func fetchImage() {
        if let url = imageUrl {
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents {
                imageView.image = UIImage(data: imageData)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if imageUrl == nil {
            imageUrl = DemoURLs.stanford
        }
    }
}
