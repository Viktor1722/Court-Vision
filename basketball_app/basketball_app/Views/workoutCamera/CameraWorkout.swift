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


class WorkoutStatsViewController: UIViewController {
    struct SwiftUIView: View {
        var body: some View {
            VStack {
                Image("workout1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }
            .background(Color.white)
        }
    }
}

class CameraWorkout: UIViewController {
    let videoCapture = VideoCapture()
    var previewLayer: AVCaptureVideoPreviewLayer?
    var audioPlayer: AVAudioPlayer?
    var pointsLayer = CAShapeLayer()
    var isTrowDetected = false
    var confidenceLabel: UILabel?
    var trowCount = 0
    let requiredTrowCount = 2
    
    @State private var isWorkoutComplete = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVideoPreview()
        videoCapture.predictor.delegate = self
        setupAudioPlayer()
    }
    
    private func setupVideoPreview() {
        videoCapture.startCaptureSesion()
        previewLayer = AVCaptureVideoPreviewLayer(session: videoCapture.captureSession)
        
        guard let previewLayer = previewLayer else { return }
        
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
        
        view.layer.addSublayer(pointsLayer)
        pointsLayer.frame = view.frame
        pointsLayer.strokeColor = UIColor.green.cgColor
    }
    
    private func setupAudioPlayer() {
        guard let soundURL = Bundle.main.url(forResource: "perfect", withExtension: "mp3") else {
            print("Sound file not found.")
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.prepareToPlay()
        } catch {
            print("Error initializing audio player: \(error)")
        }
    }
}

extension CameraWorkout: PredictorDelegate {
    func predictor(_ predictor: Predictor, didLabelAction action: String, with confidence: Double) {
        let formattedConfidence = String(format: "%.2f", confidence)
        let confidenceText = confidence < 0.95 ? "Not sure yet. Current prediction \(action) with \(formattedConfidence)%" : "Current prediction \(action) with \(formattedConfidence)"
        
        DispatchQueue.main.async {
            self.confidenceLabel?.text = confidenceText
        }
        
        if action == "Trow" && confidence > 0.80 && isTrowDetected == false {
            print("Pose detected \(action)")
            isTrowDetected = true
            
            trowCount += 1
            print("Trow count: \(trowCount)")
            
            if trowCount >= requiredTrowCount {
                print("You made 5 trows!")
                audioPlayer?.play()
                isWorkoutComplete = true
                
                DispatchQueue.main.async {
                    let workoutStatsViewController = WorkoutStatsViewController()
                    self.present(workoutStatsViewController, animated: true, completion: nil)
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.isTrowDetected = false
            }
            
            DispatchQueue.main.async {
                AudioServicesPlayAlertSound(SystemSoundID(1322))
                print("You made 5 trows!")
            }
        }
    }
    
    func predictor(_ predictor: Predictor, didFindNewRecognizedPoints points: [CGPoint]) {
        guard let previewLayer = previewLayer else { return }
        let convertedPoints = points.map { previewLayer.layerPointConverted(fromCaptureDevicePoint: $0) }
        let combinedPath = CGMutablePath()
        
        for point in convertedPoints {
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
