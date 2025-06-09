//
//  GeminiChatView.swift
//  BudgetBaller
//
//  Created by Angad Kumar on 6/9/25.
//

import SwiftUI
import UIKit
import AVFoundation

struct GeminiChatView: View {
    @State private var inputText = ""
    @State private var responseText = "Ask Away, Powered By Gemini..."
    private let geminiService = GeminiService()
    @State private var showCamera = false

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    Text(responseText)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                }

                Button(action: {
                    showCamera = true
                }) {
                    Image(systemName: "camera")
                        .font(.title)
                        .padding()
                }

                .sheet(isPresented: $showCamera) {
                    CameraView { image in
                        responseText = "📸 Sending image to Gemini..."
                        if let imageData = image.jpegData(compressionQuality: 0.8) {
                            geminiService.sendImageMessage(imageData: imageData) { reply in
                                DispatchQueue.main.async {
                                    self.responseText = reply ?? "⚠️ No response from image"
                                }
                            }
                        } else {
                            responseText = "❌ Failed to process image."
                        }
                    }
                }

                HStack {
                    TextField("Type your prompt", text: $inputText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button("Send") {
                        sendPrompt()
                    }
                    .disabled(inputText.isEmpty)
                    .padding(.horizontal)
                }
                .padding()
            }
            .padding()
            .navigationTitle("Have Questions?")
        }
    }

    func sendPrompt() {
        let prompt = inputText
        inputText = ""
        responseText = "Thinking..."

        geminiService.sendMessage(prompt: prompt) { reply in
            DispatchQueue.main.async {
                self.responseText = reply ?? "⚠️ No response"
            }
        }
    }
}

struct CameraView: UIViewControllerRepresentable {
    var onImagePicked: (UIImage) -> Void

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(onImagePicked: onImagePicked)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var onImagePicked: (UIImage) -> Void

        init(onImagePicked: @escaping (UIImage) -> Void) {
            self.onImagePicked = onImagePicked
        }

        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                onImagePicked(image)
            }
            picker.dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
}

#Preview {
    GeminiChatView()
}
