//
//  NetworkClient.swift
//  SpaceXplorer
//
//  Created by Alex Lin Segarra on 17/12/24.
//

import Foundation

protocol NetworkClientProtocol {
    func request<T: Decodable>(endpoint: Endpoint) async throws -> T
    func downloadImage(from urlString: String) async throws -> Data
}

class NetworkClient: NetworkClientProtocol {
    private let session: URLSession
    private let logger: XLogger
    
    init(session: URLSession = .shared,
         logger: XLogger = NetworkingLogger()) {
        self.session = session
        self.logger = logger
    }
    
    func request<T: Decodable>(endpoint: Endpoint) async throws -> T {
        guard let url = buildURL(for: endpoint) else {
            throw NetworkError.invalidUrl
        }
        
        let request = createURLRequest(for: endpoint, with: url)
        let requestInfo = logRequestWith(request)
        
        do {
            let (data, _) = try await session.data(for: request)
            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
            logger.log(message: "Successful response from: \(requestInfo)", level: .info)
            return decodedResponse
        } catch {
            logger.log(message: "Decoding error for: \(requestInfo) with error: \(error)", level: .error)
            throw NetworkError.decodingError(error)
        }
    }
    
    func downloadImage(from urlString: String) async throws -> Data {
        guard let url = URL(string: urlString) else { throw NetworkError.invalidUrl }
        do {
            let (data, _) = try await session.data(from: url)
            return data
        } catch {
            throw NetworkError.networkError(error)
        }
    }

    // MARK: - Private Helpers
    
    private func buildURL(for endpoint: Endpoint) -> URL? {
        var components = URLComponents(string: endpoint.basePath + endpoint.path)
        return components?.url
    }
    
    private func createURLRequest(for endpoint: Endpoint, with url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        if let bodyParameters = endpoint.bodyParameters {
            request.httpBody = bodyParameters
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        return request
    }
    
    private func logRequestWith(_ request: URLRequest) -> String {
        let safeUrlString = request.url?.absoluteString ?? "Invalid URL"
        let requestInfo = "\(request.httpMethod ?? "GET") \(safeUrlString)"
        logger.log(message: "Starting request: \(requestInfo)", level: .info)
        return requestInfo
    }
}
