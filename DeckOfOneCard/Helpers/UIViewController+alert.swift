//
//  UIViewController+alert.swift
//  DeckOfOneCard
//
//  Created by James Hager on 4/5/22.
//

import UIKit

extension UIViewController {
    
    func presentAlert(for error: Error) {
        let alert = UIAlertController(title: "Error!", message: error.localizedDescription, preferredStyle: .actionSheet)
        
        let dismiss = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(dismiss)
        
        present(alert, animated: true)
    }
}
