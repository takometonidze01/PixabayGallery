//
//  RootAssembly.swift
//  Pixabay Gallery
//
//  Created by codergirlTM on 26.02.23.
//

import Foundation

class RootAssembly {
    lazy var presentationAssembly: PresentationAssembly = PresentationAssembly(serviceAssembly: serviceAssembly)
    lazy var serviceAssembly: ServiceAssemblyProtocol = ServiceAssembly()
}
