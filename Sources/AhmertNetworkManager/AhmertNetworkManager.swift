import Foundation

public class NetworkManager {
    
    public static let shared = NetworkManager()
    
    public func request<T: Codable>(type : T.Type, urlString: String, method : HTTPMethods, completion : @escaping ((Result<T, ErrorTypes>)->())){
        
        let session = URLSession.shared
        
        if let url = URL(string: urlString){
            
            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            
            let dataTask = session.dataTask(with: request) { data, response, error in
                
                if let _ = error {
                    //has error
                    
                    completion(.failure(.generalError))
                    
                }else if let data = data {
                    //has data
                    
                    self.handleResponse(data: data) { response in
                        completion(response)
                    }
                    
                }else {
                    completion(.failure(.invalidURL))
                }
            }
            dataTask.resume()
        }
        
    }
    
    public func handleResponse<T: Codable>(data : Data, completion : @escaping ((Result<T, ErrorTypes>)->())){
        
        do {
            
            let result = try JSONDecoder().decode(T.self, from: data)
            completion(.success(result))
            
        }catch{
            completion(.failure(.invalidData))
        }
        
    }
}

public enum HTTPMethods : String {

    case get = "GET"
    case post = "POST"
    
}

public enum ErrorTypes : String, Error{
    case invalidData = "invalid Data"
    case invalidURL = "invalid URL"
    case generalError = "An error happened"
}
