//
//  HomeCameraBrain.swift
//  PestanyasYDelegados
//
//  Created by TEO on 27/12/22.
//

//import Foundation
import UIKit

protocol HomeCameraBrainProtocol {
    func setViewController (_ viewController: HomeCameraViewControllerProtocol)
    func processCleanButtonPressed()
    func processCapturePhotoButtonPressed()
    func processPhoto(_ photo: UIImage?)
}

class HomeCameraBrain {
    weak var viewController: HomeCameraViewControllerProtocol?
}

extension HomeCameraBrain: HomeCameraBrainProtocol {
    func setViewController(_ viewController: HomeCameraViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func processCleanButtonPressed() {
        
    }
    
    func processCapturePhotoButtonPressed() {
        guard let viewController = viewController else { return }
        viewController.launchCamera()
    }
    
    func processPhoto(_ photo: UIImage?) {
        guard let viewController = viewController else { return }
        viewController.showPreview(photo)
    }
    
}
