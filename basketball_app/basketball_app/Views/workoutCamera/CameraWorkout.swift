//
//  CameraWorkout.swift
//  basketball_app
//
//  Created by Viktor on 16/05/2023.
//

import UIKit
import Foundation
import SwiftUI
import AVFoundation
import AudioToolbox

class CameraWorkout: UIViewController{
    
    let videoCapture = VideoCapture()
    var previewLayer: AVCaptureVideoPreviewLayer?
    var audioPlayer: AVAudioPlayer?
    var pointsLayer = CAShapeLayer()
    var isTrowDetected = false
    var confidenceLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        setupVideoPreview()
        
        videoCapture.predictor.delegate = self
        
        // Create and configure the confidence label
      


    }
    
    
    
    private func setupVideoPreview(){
        videoCapture.startCaptureSesion()
        previewLayer = AVCaptureVideoPreviewLayer(session: videoCapture.captureSession)
        


        
        guard let previewLayer = previewLayer else { return }
        
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
        
        view.layer.addSublayer(pointsLayer)
        pointsLayer.frame = view.frame
        pointsLayer.strokeColor = UIColor.green.cgColor
    }
    
}

extension CameraWorkout: PredictorDelegate {
    func predictor(_ predictor: Predictor, didLabelAction action: String, with confidence: Double) {
        let formattedConfidence = String(format: "%.2f", confidence)
        let confidenceText = confidence < 0.95 ? "Not sure yet. Current prediction \(action) with \(formattedConfidence)%" : "Current prediction \(action) with \(formattedConfidence)"
        print(confidenceText)
        
        DispatchQueue.main.async {
            self.confidenceLabel?.text = confidenceText
        }
        

        
        if action == "Trow" && confidence > 0.45 && isTrowDetected == false{
                   print("Pose detected \(action)")
                   print(confidence)
                   
                isTrowDetected = true
                   
                   DispatchQueue.main.asyncAfter(deadline: .now()+3){
                       self.isTrowDetected = false
                   }
                   DispatchQueue.main.async{
                       AudioServicesPlayAlertSound(SystemSoundID(1322))
                       
                   

                       
                       //self.view.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
                       //view.layer.addSublayer()
                   }
                   
                   
               }

    }
    
    func predictor(_ predictor: Predictor, didFindNewRecognizedPoints points: [CGPoint]) {
        guard let previewLayer =  previewLayer else {return}
        
        let convertedPoints = points.map { previewLayer.layerPointConverted(fromCaptureDevicePoint: $0) }
        let combinedPath = CGMutablePath()
        
        for point in  convertedPoints {
            let dotPath = UIBezierPath(ovalIn: CGRect(x: point.x, y: point.y, width: 10, height: 10))
            combinedPath.addPath(dotPath.cgPath)
        }
        
        pointsLayer.path = combinedPath
        
        DispatchQueue.main.async {
            self.pointsLayer.didChangeValue(for: \.path)
        }
    }
    
    private func flashScreen() {
        let flashView = UIView(frame: view.bounds)
        flashView.backgroundColor = .green
        view.addSubview(flashView)
        
        UIView.animate(withDuration: 1.0, animations: {
            flashView.alpha = 0.0
        }) { (_) in
            flashView.removeFromSuperview()
        }
    }
}
    
