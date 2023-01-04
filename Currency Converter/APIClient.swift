//
//  APIClient.swift
//  Currency Converter
//
//  Created by Oleh Titov on 04.01.2023.
//

import Foundation

class APIClient {
    
    static var host = "api.exchangerate.host"
    
    enum Path: String {
        case latest = "/latest"
        case convert = "/convert"
    }
    
    class func urlComponents(path: Path, queryItems: [URLQueryItem]?) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path.rawValue
        components.queryItems = queryItems
        let url = components.url
        return url!
    }
    
    private func getRequest<ResponseType: Decodable>(responseType: ResponseType.Type, urlRequest: URLRequest) async -> ResponseType? {
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest, delegate: .none)
            print(data)
            print(String(decoding: data, as: UTF8.self))
            let decoder = JSONDecoder()
            return try decoder.decode(ResponseType.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
            return nil
        } catch DecodingError.valueNotFound(let type, let context) {
            Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
            return nil
        } catch DecodingError.typeMismatch(let type, let context) {
            Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
            return nil
        } catch DecodingError.dataCorrupted(let context) {
            Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
            return nil
        } catch let error as NSError {
            NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
            return nil
        } catch {
            return nil
        }
    }
}
