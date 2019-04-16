//
//  Box.swift
//  ARKitPlanes
//
//  Created by Admin on 15/04/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import SceneKit
import ARKit

class Box: SCNNode {
    
    init(atPosition position: SCNVector3) {
        super.init()
        
        let boxGeometry = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0)
        
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.green
        
        boxGeometry.materials = [material]
        
        self.geometry = boxGeometry
        
        let physicsShape = SCNPhysicsShape(geometry: self.geometry!, options: nil)
        self.physicsBody = SCNPhysicsBody(type: .dynamic, shape: physicsShape)
        self.physicsBody?.categoryBitMask = BitMaskCategory.box
        self.physicsBody?.collisionBitMask = BitMaskCategory.box | BitMaskCategory.plane
        self.physicsBody?.contactTestBitMask = BitMaskCategory.plane
        
        self.position = position
     
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
