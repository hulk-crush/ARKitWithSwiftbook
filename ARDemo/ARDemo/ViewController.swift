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
    
    var session: ARSession {
        return sceneView.session
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        sceneView.showsStatistics = true
        sceneView.autoenablesDefaultLighting = true
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        
        let scene = SCNScene()
        
       // let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(boxTapped(touch:)))
       // self.sceneView.addGestureRecognizer(gestureRecognizer)
        
        sceneView.scene = scene
        
        
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
    
//    @objc func boxTapped(touch: UITapGestureRecognizer) {
//        let sceneView = touch.view as! SCNView
//        let touchLocation = touch.location(in: sceneView)
//
//        let touchResults = sceneView.hitTest(touchLocation, options: [:])
//
//        guard !touchResults.isEmpty, let node = touchResults.first?.node else {
//            return
//        }
//
//        let boxMaterial = SCNMaterial()
//        boxMaterial.diffuse.contents = UIColor.blue
//        boxMaterial.specular.contents = UIColor.red
//        node.geometry?.materials[0] = boxMaterial
//
//    }
//
    private func createBox(in scene: SCNScene) {
        
        let box = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0)
        let boxMaterial = SCNMaterial()
        
        boxMaterial.diffuse.contents = UIColor.red
        boxMaterial.specular.contents = UIColor.yellow
        
        let boxNode = SCNNode(geometry: box)
        boxNode.name = "box"
        boxNode.geometry?.materials = [boxMaterial]
        boxNode.position = SCNVector3(0.0, 0.0, -0.5)
        scene.rootNode.addChildNode(boxNode)
        
        
        
        
        
        
        
        
//        let array: [SCNGeometry] = [SCNPlane(), SCNSphere(), SCNBox(), SCNPyramid(), SCNTube(), SCNCone(), SCNTorus(), SCNCylinder(), SCNCapsule()]
//        var xCoordinate: Double = 1
//
//        sceneView.autoenablesDefaultLighting = true
//
//        for geometryShape in array {
//            let node = SCNNode(geometry: geometryShape)
//
//            let material = SCNMaterial()
//            material.diffuse.contents = UIColor.red
//
//            node.geometry?.materials = [material]
//            node.scale = SCNVector3(0.1, 0.1, 0.1)
//            node.position = SCNVector3(xCoordinate, 0, -1)
//            xCoordinate -= 0.2
//
//            scene.rootNode.addChildNode(node)
//        }
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
    
    @IBAction func resetTapped(sender: UIButton){
        session.pause()
        sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            if node.name == "box" {
                node.removeFromParentNode()
            }
        }
        let configuration = ARWorldTrackingConfiguration()
        session.run(configuration, options: [.removeExistingAnchors, .resetTracking])
        
    }
    
    @IBAction func addTapped(sender: UIButton){
        createBox(in: sceneView.scene)
    }

}
