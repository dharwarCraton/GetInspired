//
//  QuoteCatcherViewController.swift
//  GetInspired
//
//  Created by Farah Alam on 5/25/17.
//  Copyright © 2017 Farah Alam. All rights reserved.
//

import UIKit

class QuoteCatcherViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    /*
        OUTLETS connected here
    */
    
    @IBOutlet weak var quoteImageView: UIImageView!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
    /*
         ACTIONS connected here
    */
    }
    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
    }
    
    @IBAction func addTapped(_ sender: Any) {
    }
    
    
    
}
