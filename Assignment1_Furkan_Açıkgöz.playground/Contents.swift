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
    var name: String
    var surname: String
    var email: String
    var isSelected: Bool
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
    
    func getIdentity() -> String {
        return "Participant name is \(name) \(surname)"
    }
    
    /**
        -Returns: Enrolled Bootcamp String or nil depending on
     whether isSelected value is true or false in Participant class.
    */
    func getEnrolledBootcamp() -> String? {
        
        if isSelected {
            return "Participant is enrolled in " +
            "\(codeOfBootcamp). \(nameOfBootcamp)"
        } else {
            print("Participant is currently not involved in " +
            "any Bootcamp!")
            return nil
        }
    }
    
    func getEmail() -> String {
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

extension Bootcamp {
    
    mutating func setUpBootcamp(_ name: Name, _ code: Int, _ nameOfTeacher: String) {
        self.name = name
        self.code = code
        self.nameOfTeacher = nameOfTeacher
    }
    
    /**
     Adds Participant or array of Participant depending on passed
     participants parameter type.
     
     -parameter participants: Type is declared as Any to provide both
     adding single or multiple Participants.
     -returns: None
     */
    mutating func addParticipants(_ participants: Any) {
        if participants is Participant {
            self.participants?.append(participants as! Participant)
        } else if participants is [Participant] {
            self.participants?.append(contentsOf: participants as! [Participant])
        }
    }
    
    /**
     Adds Assistant or array of Assistants depending on passed
     participants parameter type.
     
     -parameter assistants: Type is declared as Any to provide both
     adding single or multiple Assistants.
     -returns: None
     */
    mutating func addAssistants(_ assistants: Any) {
        if assistants is String {
            self.nameOfAssistants?.append(assistants as! String)
        } else if assistants is [String] {
            self.nameOfAssistants?.append(contentsOf: assistants as! [String])
        }
    }
    
}
