//
//  VideoCapture.swift
//  basketball_app
//
//  Created by Viktor on 16/05/2023.
//

import Foundation
import AVFoundation

class VideoCapture: NSObject {
    let captureSession = AVCaptureSession()
    let videoOutput = AVCaptureVideoDataOutput()
    
    let predictor = Predictor()
    
   override init(){
       super.init()
       
        guard let captureDevice = AVCaptureDevice.default(for: .video),
              let input = try? AVCaptureDeviceInput(device: captureDevice) else {
            return
        }
       
        captureSession.sessionPreset = AVCaptureSession.Preset.high
        captureSession.addInput(input)
        captureSession.addOutput(videoOutput)
        videoOutput.alwaysDiscardsLateVideoFrames = true
        
    }
    
    func startCaptureSesion(){
        captureSession.startRunning()
        videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoDispatchQueue"))
    }
    func getDevice(position: AVCaptureDevice.Position) -> AVCaptureDevice? {
          let devices: NSArray = AVCaptureDevice.devices() as NSArray;
          for de in devices {
              let deviceConverted = de as! AVCaptureDevice
              if(deviceConverted.position == position){
                 return deviceConverted
              }
          }
         return nil
      }
}


extension VideoCapture: AVCaptureVideoDataOutputSampleBufferDelegate{
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        predictor.estimation(sampleBuffer:  sampleBuffer)
    }
}
