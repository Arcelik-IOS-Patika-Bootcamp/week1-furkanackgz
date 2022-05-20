import UIKit

/**
 - Authors:
    N. Furkan Açıkgöz
 */

/// This enumeration is for defining names of each bootcamp.
enum Name {
    case Arcelik
    case Todeb
    case Enuygun
}

class Participant {
    var name: String?
    var surname: String?
    var email: String?
    var isSelected: Bool?
    var nameOfBootcamp: Name?
    var codeOfBootcamp: Int?
    
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

extension Participant {
    
    /**
        -Returns: Identity String or nil depending on whether name
     and surname variables initialized in Participant class.
    */
    func getIdentity() -> String? {
        guard let name = name, let surname = surname else {
            print("Name and surname is not declared yet")
            return nil
        }
        
        return "Participant name is \(name) \(surname)"
    }
    
    /**
        -Returns: Enrolled Bootcamp String or nil depending on
     whether codeOfBootcamp and nameOfBootcamp variables initialized
     in Participant class.
    */
    func getEnrolledBootcamp() -> String? {
        guard let codeOfBootcamp = codeOfBootcamp,
              let nameOfBootcamp = nameOfBootcamp else {
            print("Bootcamp is not declared yet")
            return nil
        }

        return "Participant currently enrolled in " +
        "\(codeOfBootcamp). \(nameOfBootcamp)"
    }
    
    /**
        -Returns: Email String or nil depending on whether email
     variable is initialized in Participant class.
    */
    func getEmail() -> String? {
        guard let email = email else {
            print("No e-mail address")
            return nil
        }
        return email
    }
    
}

struct Bootcamp {
    private var name: Name?
    private var code: Int?
    private var participants: [Participant]?
    private var nameOfAssistants: [String]?
    private var nameOfTeacher: String? {
        didSet{
            participants = [Participant]()
            nameOfAssistants = [String]()
        }
    }
}
