//
//  CardViewController.swift
//  DeckOfOneObjC
//
//  Created by Brady Bentley on 12/18/18.
//  Copyright © 2018 Brady. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var cardImageView: UIImageView!
    
    
    // MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func cardButtonTapped(_ sender: Any) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        BBCardController.fetchCard { (card) in
            guard let card = card else { return }
            BBCardController.fetchCardImage(with: card, completion: { (image) in
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    self.cardImageView.image = image
                }
            })
        }
    }
}
