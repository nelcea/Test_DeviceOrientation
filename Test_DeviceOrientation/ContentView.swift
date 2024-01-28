//
//  ContentView.swift
//  Test_DeviceOrientation
//
//  Created by Eric Bariaux on 28/01/2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?

    var body: some View {
        GeometryReader { proxy in
            HStack {
                Spacer()
                VStack(alignment: .center) {
                    Spacer()
                    Text("Geometry reader information")
                        .font(.title3)
                    Text("Size: \(proxy.size.width) x \(proxy.size.height)")
                    Text("\(proxy.size.width > proxy.size.height ? "Wide" : "Tall")")
                    if let h = horizontalSizeClass {
                        Text("Horizontal size class: \(String(describing: h))")
                    } else {
                        Text("No horizontal size class information available")
                    }
                    if let v = verticalSizeClass {
                        Text("Vertical size class: \(String(describing: v))")
                    } else {
                        Text("No vertical size class information available")
                    }
                    #if os(iOS)
                    switch UIDevice.current.orientation {
                    case .portrait:
                        Text("Device orientation: portrait")
                    case .portraitUpsideDown:
                        Text("Device orientation: portrait upside down")
                    case.landscapeLeft:
                        Text("Device orientation: landscape left")
                    case .landscapeRight:
                        Text("Device orientation: landscape right")
                    case .faceUp:
                        Text("Device orientation: face up")
                    case .faceDown:
                        Text("Device orientation: face down")
                    case .unknown:
                        Text("Device orientation: unknown")
                    @unknown default:
                        Text("Device orientation: unforeseen")
                    }
                    #else
                        Text("Device orientation does not make sense on this device")
                    #endif
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
