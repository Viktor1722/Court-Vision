//
//  ShootingExercise.swift
//  basketball_app
//
//  Created by Viktor on 11/05/2023.
//

import SwiftUI
import AVFoundation

struct ShootingExercise: View {
    
    @State private var captureSession: AVCaptureSession?
        @State private var previewLayer: AVCaptureVideoPreviewLayer?
    
    var body: some View {
        ZStack {
                 if let previewLayer = previewLayer {
                     VideoPreviewView(layer: previewLayer)
                 } else {
                     Text("Camera not available")
                 }
             }
             .onAppear {
                 let captureSession = AVCaptureSession()
                 guard let camera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else { return }
                 guard let input = try? AVCaptureDeviceInput(device: camera) else { return }
                 captureSession.addInput(input)
                 let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                 previewLayer.videoGravity = .resizeAspectFill
                 self.captureSession = captureSession
                 self.previewLayer = previewLayer
                 captureSession.startRunning()
             }
             .onDisappear {
                 captureSession?.stopRunning()
             }
         }
     }

     struct VideoPreviewView: UIViewRepresentable {
         let layer: AVCaptureVideoPreviewLayer
         
         func makeUIView(context: Context) -> UIView {
             let view = UIView(frame: CGRect.zero)
             layer.frame = view.layer.bounds
             view.layer.addSublayer(layer)
             return view
         }
         
         func updateUIView(_ uiView: UIView, context: Context) {
             layer.frame = uiView.layer.bounds
         }
     }

struct ShootingExercise_Previews: PreviewProvider {
    static var previews: some View {
        ShootingExercise()
    }
}
