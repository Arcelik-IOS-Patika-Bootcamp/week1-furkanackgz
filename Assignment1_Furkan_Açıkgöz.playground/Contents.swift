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
         isSelected: Bool, nameOfBootcamp: Name?,
         codeOfBootcamp: Int?) {
        self.name = name
        self.surname = surname
        self.email = email
        self.isSelected = isSelected
        self.nameOfBootcamp = nameOfBootcamp
        self.codeOfBootcamp = codeOfBootcamp
    }
}

// Getter methods of Participant
extension Participant {
    
    func getIdentity() -> String {
        return "Participant name is \(name) \(surname)"
    }
    
    /**
        -Returns: Enrolled Bootcamp String or nil depending on
     whether isSelected value is true or false in Participant class.
    */
    func getEnrolledBootcamp() -> String {
        
        if isSelected {
            return "Participant is enrolled in " +
            "\(codeOfBootcamp!). \(nameOfBootcamp!)"
        } else {
            return "Participant is currently not involved in " +
            "any Bootcamp!"
        }
    }
    
    func getEmail() -> String {
        return email
    }
    
}

// Setter methods of Participant
extension Participant {
    
    /**
     After assigning name and code of the Bootcamp, we change isSelected
     value from false to true.
     
     returns: None
     */
    func assignToGiven(_ nameOfBootcamp:Name, _ codeOfBootcamp:Int) {
        self.nameOfBootcamp = nameOfBootcamp
        self.codeOfBootcamp = codeOfBootcamp
        self.isSelected = true
    }
}

struct Bootcamp {
    var name: Name
    var code: Int
    var nameOfTeacher: String
    var participants: [Participant] = []
    var namesOfAssistants: [String] = []
}

// Mutating methods of Bootcamp Struct
extension Bootcamp {
    
    /**
     Add single Participant if it's not enrolled to other bootcamps
     previously.
     
     -returns: None
     */
    mutating func addSingle(_ participant:Participant) {
        if !participant.isSelected {
            participant.assignToGiven(name, code)
            self.participants.append(participant)
        } else {
            print("Given participant is already enrolled to other " +
            "Bootcamp")
        }
    }
    
    /**
     Add multiple Participants if they are not enrolled to other bootcamps
     previously.
     
     -returns: None
     */
    mutating func addMultiple(_ participants: [Participant]) {
        for participant in participants {
            addSingle(participant)
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
            self.namesOfAssistants.append(assistants as! String)
        } else if assistants is [String] {
            self.namesOfAssistants.append(contentsOf: assistants as! [String])
        }
    }
    
}

// Non-mutating methods of Bootcamp
extension Bootcamp {
    
    func printNameOfBootcamp() {
        print("\(code). \(name)")
    }
    
    func printNameOfTeacher() {
        print(nameOfTeacher)
    }
    
    /**
     If Assistans are assigned to the bootcamp print their name
     one by one.
     */
    func printNamesOfAssistants() {
        if namesOfAssistants.count > 0 {
            print("-> Assistant Names:")
            for assistant in namesOfAssistants {
                print(assistant)
            }
        } else {
            print("There is no Assistant assigned to this bootcamp yet!")
        }
    }
    
    /**
     If Participants are assigned to the bootcamp print their name
     one by one.
     */
    func printNamesOfParticipants() {
        if participants.count > 0 {
            print("-> Participant Names:")
            for index in 0..<participants.count {
                print("\(index+1). \(participants[index].getIdentity())")
            }
        } else {
            print("There is no Participants assigned to this bootcamp yet!")
        }
    }
    
}

// Initializing the Bootcamp
var arcelikBootcamp = Bootcamp(name: .Arcelik, code: 184, nameOfTeacher: "Mücahit Katırcı")
arcelikBootcamp.printNameOfBootcamp()
arcelikBootcamp.printNameOfTeacher()

// Adding Assistants
arcelikBootcamp.addAssistants("İsmail Palalı")
arcelikBootcamp.addAssistants(["Özgün Aksay","Ali Şen"])
// Printing Assistan names
arcelikBootcamp.printNamesOfAssistants()

// Creating Participants
var participant1 = Participant(name: "Furkan", surname: "Açıkgöz", email: "furkanackgz99@gmail.com", isSelected: false, nameOfBootcamp: nil, codeOfBootcamp: nil)

var participant2 = Participant(name: "Ahmet", surname: "Gültekin", email: "ahmetgultekin@gmail.com", isSelected: true, nameOfBootcamp: .Enuygun, codeOfBootcamp: 180)

var participant3 = Participant(name: "Kürşad", surname: "Cüce", email: "kursatcuce@gmail.com", isSelected: false, nameOfBootcamp: nil, codeOfBootcamp: nil)

var participant4 = Participant(name: "Enes", surname: "Aslan", email: "enesaslan@gmail.com", isSelected: false, nameOfBootcamp: nil, codeOfBootcamp: nil)

// Adding Participants
arcelikBootcamp.addSingle(participant1)

// Trying to add Participant who is already assigned to other Bootcamp
arcelikBootcamp.addSingle(participant2)

// Adding multiple Participants
arcelikBootcamp.addMultiple([participant3,participant4])

// Printing Participant names
arcelikBootcamp.printNamesOfParticipants()
