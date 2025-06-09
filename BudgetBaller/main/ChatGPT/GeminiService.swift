//
//  GeminiService.swift
//  BudgetBaller
//
//  Created by Angad Kumar on 6/9/25.
//


import Foundation

class GeminiService {
    private let apiKey = "AIzaSyDZDZWpajFjEQmWibIV6pRzeg4n-JvbZso" // Replace this
    private let endpoint = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent"

    func sendMessage(prompt: String, completion: @escaping (String?) -> Void) {
        guard let url = URL(string: "\(endpoint)?key=\(apiKey)") else {
            completion("⚠️ Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let payload: [String: Any] = [
            "contents": [
                ["parts": [["text": prompt]]]
            ]
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: payload)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion("⚠️ Error: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                completion("⚠️ No data")
                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let candidates = json["candidates"] as? [[String: Any]],
                   let first = candidates.first,
                   let content = first["content"] as? [String: Any],
                   let parts = content["parts"] as? [[String: Any]],
                   let text = parts.first?["text"] as? String {
                    completion(text)
                } else {
                    completion("⚠️ Unexpected response format")
                }
            } catch {
                completion("⚠️ JSON parse error: \(error.localizedDescription)")
            }
        }.resume()
    }

    func sendImageMessage(imageData: Data, completion: @escaping (String?) -> Void) {
        guard let url = URL(string: "\(endpoint)?key=\(apiKey)") else {
            completion("⚠️ Invalid URL")
            return
        }

        let base64Image = imageData.base64EncodedString()

        let payload: [String: Any] = [
            "contents": [
                [
                    "parts": [
                        ["text": "What do you see in this image?"],
                        [
                            "inline_data": [
                                "mime_type": "image/jpeg",
                                "data": base64Image
                            ]
                        ]
                    ]
                ]
            ]
        ]

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: payload)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion("⚠️ Error: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                completion("⚠️ No data")
                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let candidates = json["candidates"] as? [[String: Any]],
                   let first = candidates.first,
                   let content = first["content"] as? [String: Any],
                   let parts = content["parts"] as? [[String: Any]],
                   let text = parts.first?["text"] as? String {
                    completion(text)
                } else {
                    completion("⚠️ Unexpected response format")
                }
            } catch {
                completion("⚠️ JSON parse error: \(error.localizedDescription)")
            }
        }.resume()
    }
}
