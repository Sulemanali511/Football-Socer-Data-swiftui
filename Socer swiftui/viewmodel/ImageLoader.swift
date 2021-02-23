//
//  ImageLoader.swift
//  Socer swiftui
//
//  Created by hosam on 2/22/21.
//

import SwiftUI
import SVGKit

extension UserDefaults {
    
    static func save (key:Int,value:String) {
        UserDefaults.standard.set(value, forKey: "\(key)")
    }
    
    static func get (key:Int) ->String {
        guard let ss = UserDefaults.standard.value(forKey: "\(key)") as? String else { return "" }
        
        return ss
    }
    
}
class ImageLoader: ObservableObject {
    
    private static let imageCache = NSCache<AnyObject, AnyObject>()
    
    @Published var notFoundData = true
    @Published var isLoading = false
    
    @Published var image: UIImage? = nil
    
    @Published var imageUrl:String? = nil
    
    init(teamId: Int? = nil) {
        if let imageFromCache = ImageLoader.imageCache.object(forKey: teamId as AnyObject) as? String {
            
            self.imageUrl = imageFromCache
            return
        }
    }
    
    func getTeamId(teamId: Int? = nil)  {
        if let imageFromCache = ImageLoader.imageCache.object(forKey: teamId as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
    }
    
    
    public func downloadImage(url: String, teamId: Int) {
        if let imageFromCache = ImageLoader.imageCache.object(forKey: teamId as AnyObject) as? String {
            self.imageUrl = imageFromCache
            return
        }
        
    }
}

