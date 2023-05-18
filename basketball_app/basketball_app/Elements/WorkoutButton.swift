//
//  WorkoutButton.swift
//  basketball_app
//
//  Created by Viktor on 15/05/2023.
//

import SwiftUI
import UIKit

struct WorkoutButton: View {
    @State private var isUIKitPagePresented = false
    
    var body: some View {
        ZStack {
            Spacer(minLength: 0)
            
            HStack {
                Button(action: {
                    isUIKitPagePresented = true
                }) {
                    Text("Open UIKit Page")
                }
            }
            .frame(width: 300)
            .padding()
            .background(Color("Elgreen"))
            .foregroundColor(.black)
            .cornerRadius(50)
        }
        .background(
            NavigationLink(
                destination: UIKitPage(),
                isActive: $isUIKitPagePresented,
                label: EmptyView.init
            )
        )
    }
}

struct UIKitPage: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        // Instantiate and return your UIKit view controller here
        let uikitViewController = CameraWorkout()
        return uikitViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Update the view controller if needed
    }
}

// YourUIKitViewController should be the actual UIKit view controller you want to present



