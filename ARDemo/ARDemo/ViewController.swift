//
//  ViewController.swift
//  ARDemo
//
//  Created by Admin on 12/04/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        let scene = SCNScene()
        createFigure(in: scene)
        
//        let sphereGeometry = SCNSphere(radius: 0.1)
//        let sphereMaterial = SCNMaterial()
//
//        sphereMaterial.diffuse.contents = UIImage(named: "head.jpg")
//        //sphereMaterial.diffuse.contentsTransform = SCNMatrix4MakeScale(2, 2, 2) масштаб текстуры
//        let  sphereNode = SCNNode(geometry: sphereGeometry)
//        sphereNode.geometry?.materials = [sphereMaterial]
//
//        sphereNode.position = SCNVector3(0, 0, -1)
//        scene.rootNode.addChildNode(sphereNode)
        

//        let boxGeometry = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0)
//
//        let material = SCNMaterial()
//        material.diffuse.contents = UIColor.blue
//
//        let boxNode = SCNNode(geometry: boxGeometry)
//        boxNode.geometry?.materials = [material]
//        boxNode.position = SCNVector3(0, 0, -1.0)
//
//        scene.rootNode.addChildNode(boxNode)
//
//        sceneView.scene = scene
//
//
//        let textGeometry = SCNText(string: "Hello, darling", extrusionDepth: 2.0)
//        let textMaterial = SCNMaterial()
//        textMaterial.diffuse.contents = UIColor.purple
//
//        let textNode = SCNNode(geometry: textGeometry)
//        textNode.scale = SCNVector3(0.005, 0.005, 0.005 )
//        textNode.geometry?.materials = [textMaterial]
//
//        textNode.position = SCNVector3(0,0.2, -1.0)
//        scene.rootNode.addChildNode(textNode)
        
    }
    
    private func createFigure(in scene: SCNScene) {
        let array: [SCNGeometry] = [SCNPlane(), SCNSphere(), SCNBox(), SCNPyramid(), SCNTube(), SCNCone(), SCNTorus(), SCNCylinder(), SCNCapsule()]
        var xCoordinate: Double = 1
        
        sceneView.autoenablesDefaultLighting = true
        
        for geometryShape in array {
            let node = SCNNode(geometry: geometryShape)
            
            let material = SCNMaterial()
            material.diffuse.contents = UIColor.red
            
            node.geometry?.materials = [material]
            node.scale = SCNVector3(0.1, 0.1, 0.1)
            node.position = SCNVector3(xCoordinate, 0, -1)
            xCoordinate -= 0.2
            
            scene.rootNode.addChildNode(node)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
}
