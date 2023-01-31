func findContact(inputName : String){
    var filteredContacts = contacts.filter { Contact in Contact.name == inputName }
    if  filteredContacts.count > 0 {
        filteredContacts.forEach { print($0.description) }
    } else {
        print("연락처에 \(inputName) 이(가) 없습니다.\n")
    }
}

