//
//  ViewController.swift
//  ARPlaneDetection
//
//  Created by 伴地慶介 on 2021/11/12.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        //シーンの作成
        sceneView.scene = SCNScene()
        //デバッグオプションで特徴点を表示する設定を追加
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        //FPSやGPU使用率やレンダリングパフォーマンスなどを表示（デフォルトではfalse)
        sceneView.showsStatistics = true
        //デフォルトでオムニライトを使用（デフォルトではfalse)
        //オムニライト：１つの光源からすべての方向に向かって光線を出し、影付けと投影の役割を持つ。
        sceneView.autoenablesDefaultLighting = true
        //コンフィギュレーションを生成
        let configration = ARWorldTrackingConfiguration()
        //平面検出の設定->水平面を検出できるように設定
        configration.planeDetection = .horizontal
        //コンフィギュレーションの内容を反映してセッションを開始(シーンの表示)
        sceneView.session.run(configration)
        
        // Show statistics such as fps and timing information
//        sceneView.showsStatistics = true
        
        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
//        sceneView.scene = scene
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        //ノードを生成
        let sphereNode = SCNNode()
        //ジオメトリを球体に設定
        sphereNode.geometry = SCNSphere(radius: 0.05)
        //球体が埋まらないように球体の位置を上方向に半径分の距離動かす
        sphereNode.position.y += Float(0.05)
        //追加されたノードの子要素として球体のノードを登録
        node.addChildNode(sphereNode)
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        // Create a session configuration
//        let configuration = ARWorldTrackingConfiguration()
//
//        // Run the view's session
//        sceneView.session.run(configuration)
//    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//
//        // Pause the view's session
//        sceneView.session.pause()
//    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
