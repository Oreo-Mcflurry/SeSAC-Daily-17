//
//  LanguageCode.swift
//  SeSAC-Daily-17
//
//  Created by A_Mcflurry on 1/17/24.
//

import UIKit

enum LanguageCode: String, CaseIterable {
	case ko, en, ja, zhCN, zhTW, vi, id, th, de, ru, es, it, fr
}

extension UIViewController {
	static let languageDictionary: [LanguageCode: String] = [
		.ko: "한국어",
		.en: "영어",
		.ja: "일본어",
		.zhCN: "중국어 간체",
		.zhTW: "중국어 번체",
		.vi: "베트남어",
		.id: "인도네시아어",
		.th: "태국어",
		.de: "독일어",
		.ru: "러시아어",
		.es: "스페인어",
		.it: "이탈리아어",
		.fr: "프랑스어"
	]
}
