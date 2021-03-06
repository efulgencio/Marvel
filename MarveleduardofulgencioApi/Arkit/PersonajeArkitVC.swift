//
//  PersonajeArkitVC.swift
//  MarveleduardofulgencioApi
//
//  Created by eduardo fulgencio on 14/01/2021.
//  Copyright © 2021 Eduardo Fulgencio. All rights reserved.
//

import UIKit
import ARKit
import SceneKit

class PersonajeArkitVC: UIViewController {

    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var pickerBtn: UIButton!
   // var heroesPickerViewController: HeroesPickerViewController?
    var popupVC: PopupVC?
    
    var cameraNode: SCNNode!
    var selectedHeroName: HeroName?
    var nodes = [HeroNode]()
    
    var focusPoint: CGPoint {
        return CGPoint(
            x: sceneView.bounds.size.width / 2,
            y: sceneView.bounds.size.height - (sceneView.bounds.size.height / 1.618))
    }
    
    var focusView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.alpha = 0.8
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.frame.size = CGSize(width: 20, height: 20)
        imageView.image = #imageLiteral(resourceName: "imgpersonaje1")
        imageView.center = view.center
        
        view.addSubview(imageView)
        
        UIView.animate(withDuration: 1.0, delay: 0, options: [.repeat, .autoreverse], animations: {
            
            imageView.transform = imageView.transform.scaledBy(x: 1.5, y: 1.5)
            
        }, completion: nil)
        
        return view
    }()
    
    // MARK: - ciclo de vida VC
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }
    
    func placeHero(position: SCNVector3) {
        guard let nodeName = selectedHeroName else { return }
        let node = HeroNode(name: nodeName)
        node.position = position
        node.scale = SCNVector3(0.1, 0.1, 0.1)
        sceneView.scene.rootNode.addChildNode(node)
        selectedHeroName = nil
        nodes.append(node)
    }
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//        if heroesPickerViewController?.isViewLoaded ?? false && (heroesPickerViewController?.view.window != nil) {
//            return
//        }
        
        guard let touch = touches.first else { return }
        
        let results = sceneView.hitTest(touch.location(in: sceneView), types: [.featurePoint])
        guard let hitFeature = results.last else { return }
        let hitTransform = SCNMatrix4(hitFeature.worldTransform)
        let hitPosition = SCNVector3Make(hitTransform.m41, hitTransform.m42, hitTransform.m43)
        placeHero(position: hitPosition)
        
    }

}


// MARK: - PersonajeArkitVC

extension PersonajeArkitVC {
    
    private func setupUI() {
        setupSceneView()
    }
    
    private func setupSceneView() {
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        sceneView.scene.rootNode.addChildNode(cameraNode)
        cameraNode.position = SCNVector3(0, 0, 8)
        
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .spot
        lightNode.position = SCNVector3(0, 5, 5)
        sceneView.scene.rootNode.addChildNode(lightNode)
        
        focusView.isHidden = true
        focusView.center = focusPoint
        sceneView.addSubview(focusView)
        
      //   sceneView.delegate = self
    }

    func onHeroSelected(selectedHeroName: HeroName) {
        self.selectedHeroName = selectedHeroName
        popupVC?.dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - UIPopoverPresentationControllerDelegate

extension PersonajeArkitVC: UIPopoverPresentationControllerDelegate {
    
    @IBAction func onPickAHeroBtnPressed(_ sender: Any) {
        popupVC = PopupVC(size: CGSize(width: view.bounds.width, height: 300))
        popupVC!.modalPresentationStyle = .popover
        popupVC!.popoverPresentationController?.delegate = self
        popupVC!.personajeArkitVC = self
        present(popupVC!, animated: true, completion: nil)
        popupVC!.popoverPresentationController?.sourceView = sender as? UIView
    }
    
}
