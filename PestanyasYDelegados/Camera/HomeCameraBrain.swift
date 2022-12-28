//
//  HomeCameraBrain.swift
//  PestanyasYDelegados
//
//  Created by TEO on 27/12/22.
//

import Foundation
//import UIKit

protocol HomeCameraBrainProtocol {
    func setViewController (_ viewController: HomeCameraViewControllerProtocol)
    func processCleanButtonPressed()
    func processCapturePhotoButtonPressed()
    func processPhoto(_ photo: Data?)
    //func processPhoto(_ photo: UIImage?) -> Con UIKit
}

class HomeCameraBrain {
    weak var viewController: HomeCameraViewControllerProtocol?
}

extension HomeCameraBrain: HomeCameraBrainProtocol {
    func setViewController(_ viewController: HomeCameraViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func processCleanButtonPressed() {
        guard let viewController = viewController else { return }
        
        viewController.removePreview()
    }
    
    func processCapturePhotoButtonPressed() {
        guard let viewController = viewController else { return }
        viewController.launchCamera()
    }
    
    func processPhoto(_ photo: Data?) {
        guard let viewController = viewController else { return }
        
        if let safePhoto = photo {
            viewController.showPreview(safePhoto)
        }
        
    }
    
}
