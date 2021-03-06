/**
 Copyright IBM Corporation 2016
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

struct Book {
    
    let id: Int
    let title: String
    let author: String
    let ISBN: String
    let year: Int
    let quantity: Int?
    
}

extension Book: FieldMappable {
    
    init?(fields: [String: Any]) {
        
        if let fieldID = fields["book_id"] {
            id = Int(fieldID as! String)!
        } else {
            return nil
        }
        
        title = fields["title"] as! String
        
        ISBN = fields["isbn"] as! String
        
        if let fieldYear = fields["year"] {
            year = Int(fieldYear as! String)!
        } else {
            return nil
        }
        
        if let fieldAuthor = fields["author"] {
            author = fieldAuthor as! String
        } else {
            return nil
        }
        
        if let fieldQuantity = fields["quantity"] {
            quantity = Int(fieldQuantity as! String)!
        } else {
            quantity = nil
        }
        
    }
    
}

extension Book: DictionaryConvertible {
    
    var dictionary: [String: Any] {
        var basicItems = [String:Any]()
        
        basicItems["id"]     = id
        basicItems["title"]  = title
        basicItems["author"] = author
        basicItems["ISBN"]   = ISBN
        basicItems["year"]   = year

        if let quantity = quantity {
            basicItems["quantity"] = quantity
        }
        
        return basicItems
    }
    
}
