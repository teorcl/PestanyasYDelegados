//
//  UIImage+fixOrientation.swift
//  PestanyasYDelegados
//
//  Created by TEO on 28/12/22.
//

import UIKit

extension UIImage {
    //MARK: - self hace referencia a la imagen de tipo UIImage
    func fixOrientation() -> UIImage?{
        if self.imageOrientation == .up {
            return self
        }
        
        //MARK: - Si la orientacion de la imagen (self) no es hacia arriba
        UIGraphicsBeginImageContext(self.size) // Inicio el contexto
        self.draw(in: CGRect(origin: .zero, size: self.size))
        // MARK: - Extraemos la image que redibujamos en el imageContext
        let normalizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext() // Cierro el contexto
        return normalizedImage
    }
}
