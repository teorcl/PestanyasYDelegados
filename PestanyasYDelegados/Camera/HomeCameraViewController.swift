//
//  HomeCameraViewController.swift
//  PestanyasYDelegados
//
//  Created by TEO on 27/12/22.
//

import UIKit

protocol HomeCameraViewControllerProtocol: AnyObject {
    func launchCamera()
    func showPreview(_ preview: Data)
    func removePreview()
}

class HomeCameraViewController: UIViewController {
    
    @IBOutlet weak var previewImageView: UIImageView!
    
    let brain: HomeCameraBrainProtocol = HomeCameraBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        brain.setViewController(self)
    }
    
    @IBAction func onCleanButtonTapped() {
        brain.processCleanButtonPressed()
    }
    
    @IBAction func onCapturePhotoButtonTapped() {
        brain.processCapturePhotoButtonPressed()
    }
}

extension HomeCameraViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // Quitar el picker (UIImagePickerController que se está presentando en launchCamera())
        picker.dismiss(animated: true)
        
        let image = info[.originalImage] as? UIImage
        
        // Aplicamos la modificación de la orientación de la imagen
        let verticalImage = image?.fixOrientation()
        
        //  Convetir la imagen a datos
        let imageAsBytes = verticalImage?.pngData()
        
        brain.processPhoto(imageAsBytes)
    }
}

extension HomeCameraViewController: HomeCameraViewControllerProtocol {
    func launchCamera() {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func showPreview(_ preview: Data) {
        previewImageView.image = UIImage(data: preview)
    }
    
    func removePreview() {
        previewImageView.image = nil
    }
}

