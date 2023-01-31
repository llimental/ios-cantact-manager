func addContact(){
    var isAddContactError: Bool = false
    
    while !isAddContactError {
        print("")
        print("연락처 정보를 입력해주세요: ", terminator: "")
        
        guard let input = readLine(), input != "" else {
            print("아무것도 입력되지 않았습니다. 입력 형식을 확인해주세요.")
            continue
        }

        guard Validation.validateInputBySlash(input: input) else {
            print("입력된 정보가 [이름]/[나이]/[전화번호] 형식인지 확인해주세요")
            continue
        }
        
        let seperatedInput = input.components(separatedBy:"/")
        
        let trimSet = seperatedInput.map {
            $0.trimmingCharacters(in: [" "])
        }
        
        let trimName = trimSet[0]
        let trimAge = trimSet[1]
        let trimNum = trimSet[2]
        
        let zeroBlankName = trimName.components(separatedBy: [" "]).joined()
        
        guard errorCheck(trimName: trimName, trimAge: trimAge, trimNum: trimNum) else {
            continue
        }
        
        isAddContactError = true
        print("입력한 정보는 \(trimAge)세 \(zeroBlankName)(\(trimNum))입니다.\n")
        
        let contact = Contact(name: zeroBlankName, age: trimAge, phoneNumber: trimNum)
        
        contacts.insert(contact)
    }

}


