//
//  FootballDataService.swift
//  Socer swiftui
//
//  Created by hosam on 2/22/21.
//

import SwiftUI

struct FootballDataService {
    
    static let shared = FootballDataService()
    private let urlSession = URLSession.shared
    private let apiKey = "d4746e65890d4322a82a99f7cdbf36ea"
    private let baseURL = "https://api.football-data.org/v2/"
    
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    private init() {}
    
    func fetchLatestStandings(competitionId: Int, completion: @escaping(Result<[TeamStandingTable], Error>) -> ()) {
        let url = baseURL + "/competitions/\(competitionId)/standings"
        let urlRequest = URLRequest(url: URL(string: url)!)
        
        fetchData(request: urlRequest) { (result: Result<StandingResponse, Error>) in
            switch result {
            case .success(let response):
                if let standing = response.standings?.first {
                    completion(.success(standing.table))
                } else {
                    completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Not found"])))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchTeamDetail(teamId: Int, completion: @escaping(Result<Team, Error>) -> ()) {
        let url = baseURL + "/teams/\(teamId)"
        let urlRequest = URLRequest(url: URL(string: url)!)
        
        fetchData(request: urlRequest, completion: completion)
    }
    
    func fetchData<D: Decodable>(request: URLRequest, completion: @escaping(Result<D, Error>) -> ()) {
        var urlRequest = request
        urlRequest.addValue(apiKey, forHTTPHeaderField: "X-Auth-Token")
        
        
        urlSession.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: [NSLocalizedDescriptionKey: "Data not found"])
                completion(.failure(error))
                return
            }
            
            do {
                let d = try self.jsonDecoder.decode(D.self, from: data)
                completion(.success(d))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    
}
