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
    var isThrowDetected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        setupVideoPreview()
        
        videoCapture.predictor.delegate = self
        
        guard let soundURL = Bundle.main.url(forResource: "perfect", withExtension: "mp3") else {
            print("Sound file not found.")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.prepareToPlay()
        } catch {
            print("Error loading sound file: \(error)")
        }
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
        print(confidence < 0.95 ? "Not sure yet. Current prediction \(action) with \(confidence)%" : "Current prediction \(action) with \(confidence)")
        
        if action == "Throw" && confidence > 0.95 && !isThrowDetected {
            print("Throw detected")
            isThrowDetected = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.isThrowDetected = false
            }
            
            DispatchQueue.main.async {
                self.playThrowSound()
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
    
    
     private func playThrowSound() {
         audioPlayer?.play()
     }
}
    
