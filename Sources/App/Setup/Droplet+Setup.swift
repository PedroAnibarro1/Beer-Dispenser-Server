@_exported import Vapor

extension Droplet {
    public func setup() throws {
        try setupRoutes()
        // Do any additional droplet setup
        
        // Set up mysql
        _ = try self.mysql()
        
    }
}
