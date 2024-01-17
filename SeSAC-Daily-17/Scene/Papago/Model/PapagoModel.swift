//
//  PapagoModel.swift
//  SeSAC-Daily-17
//
//  Created by A_Mcflurry on 1/17/24.
//

import Foundation

struct PapagoModel: Codable {
	let message: Message
}

struct Message: Codable {
	let result: Result
}

struct Result: Codable {
	let translatedText: String
}
