import Foundation

enum MAMAAError: Error {
    case invalidURL
    case networkError(Error)
    case noData
    case decodingError
}

struct SystemStatus: Codable {
    let status: String
    let system: String
    let message: String
}

class MAMAAClient {
    private let baseURL = "http://localhost:8000"
    
    /// Fetches the current core connection status from the Python backend
    func checkCoreStatus(completion: @escaping (Result<SystemStatus, MAMAAError>) -> Void) {
        guard let url = URL(string: "\(baseURL)/") else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            import Foundation

enum MAMAAError: Error {
    case invalidURL
    case networkError(Error)
    case noData
    case decodingError
}

struct SystemStatus: Codable {
    let status: String
    let system: String
    let message: String
}

class MAMAAClient {
    private let baseURL = "http://localhost:8000"
    
    /// Fetches the current core connection status from the Python backend
    func checkCoreStatus(completion: @escaping (Result<SystemStatus, MAMAAError>) -> Void) {
        guard let url = URL(string: "\(baseURL)/") else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.networkError(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let status = try decoder.decode(SystemStatus.self, from: data)
                completion(.success(status))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        task.resume()
    }
}

            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let status = try decoder.decode(SystemStatus.self, from: data)
                completion(.success(status))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        task.resume()
    }
}
