import Vapor
import MySQLProvider

extension Droplet {
    func setupRoutes() throws {
        get("hello") { req in
            var json = JSON()
            try json.set("hello", "world")
            return json
        }
        
        get("plaintext") { req in
            return "Hello, world!"
        }
        
        // Database test
        get("database") { req in
            let pello = User(userID: 2127, firstName: "Pedro", lastName: "Anibarro", email: "pello3811@gmail.com", credit: 0, password: "1234566y")
            
            do {
                try pello.save()
                return "Added \(pello.firstName)"
            } catch {
                return "\(pello.firstName) is already in the DB."
            }
            
        }
        
        get("rfid") { req in
            let pello = RFID(userID: 2127, rfid: "9827982789645")
            try pello.save()
            
            return "\(pello.rfid)"
        }
        
        // response to requests to /info domain
        // with a description of the request
        get("info") { req in
            return req.description
        }
        
        get("description") { req in return req.description }
        
        try resource("posts", PostController.self)
    }
}

