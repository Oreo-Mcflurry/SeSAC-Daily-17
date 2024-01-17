//
//  Book.swift
//  SeSAC-Daily-17
//
//  Created by A_Mcflurry on 1/17/24.
//
import Foundation

struct Book: Codable {
	 let documents: [Document]?
}

struct Document: Codable {
	let contents: String?
	let publisher: String?
	let thumbnail: String?
	let title: String?
	let url: String?
}
