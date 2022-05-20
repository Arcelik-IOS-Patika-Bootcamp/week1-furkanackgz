import UIKit

/**
 - Authors:
    N. Furkan Açıkgöz
 */

// This enumeration is for defining names of each bootcamp.
enum Name {
    case Arcelik
    case Todeb
    case Enuygun
}

class Participant {
    private var name: String?
    private var surname: String?
    private var email: String?
    private var isSelected: Bool?
    private var nameOfBootcamp: Name?
    private var codeOfBootcamp: Int?
    
    init(name: String, surname: String, email:String,
         isSelected: Bool, nameOfBootcamp: Name,
         codeOfBootcamp: Int) {
        self.name = name
        self.surname = surname
        self.email = email
        self.isSelected = isSelected
        self.nameOfBootcamp = nameOfBootcamp
        self.codeOfBootcamp = codeOfBootcamp
    }
}
