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
    
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var addUpdateButton: UIButton!
    
    @IBOutlet weak var quoteImageView: UIImageView!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    var imagePicker = UIImagePickerController()
    var quote : Quotes? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        
        /*
         ACTIONS connected here
         */
    }
    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        
        if quote != nil {
            quoteImageView.image = UIImage(data: quote!.image as! Data)
            titleTextField.text = quote!.title
            
            addUpdateButton.setTitle("Update", for: .normal)
        } else {
            deleteButton.isHidden = true
        }
        
        
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        quoteImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
        if quote != nil {
            
            quote!.title = titleTextField.text
            quote!.image = NSData(data: UIImagePNGRepresentation(quoteImageView.image!)!)

            
        } else {
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let quote = Quotes(context: context)
            quote.title = titleTextField.text
            quote.image = NSData(data: UIImagePNGRepresentation(quoteImageView.image!)!)
        }
        
        
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func deleteTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.delete(quote!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
    }
    
    
}
