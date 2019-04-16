//
//  VirtualObject.swift
//  ARKitPlanes
//
//  Created by Admin on 16/04/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import SceneKit

class VirtualObject: SCNReferenceNode {
    
    static let availableObjects: [SCNReferenceNode] = {
        guard let modelsURLs = Bundle.main.url(forResource: "art.scnassets", withExtension: nil) else { return [] }
        
        let fileEnumerator = FileManager().enumerator(at: modelsURLs, includingPropertiesForKeys: nil)!
        
        return fileEnumerator.compactMap { element in
            let url = element as! URL
            
            guard url.pathExtension == "scn" else { return nil}
            
            return VirtualObject(url: url)
        }
    }()
}
