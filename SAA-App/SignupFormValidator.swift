//
//  SignupFormValidator.swift
//  SAA-App
//
//  Created by SAHIL AMRUT AGASHE on 27/04/24.
//

import Foundation

enum SignupError: Error {
    case illigalCharactersFound
}

class SignupFormModelValidator {
    private let invalidCharacters = CharacterSet(charactersIn: "~!@#$%^&*()_+{}[],.")
    
    func isFirstNameValid(_ firstName: String) throws -> Bool {
        var returnValue = true
        
        // Check for illigal characters
        if firstName.rangeOfCharacter(from: invalidCharacters) != nil {
            throw SignupError.illigalCharactersFound
        }
        
        // Check first name
        if firstName.count < 2 || firstName.count > 10 {
            returnValue = false
        }
        
        return returnValue
    }
}
