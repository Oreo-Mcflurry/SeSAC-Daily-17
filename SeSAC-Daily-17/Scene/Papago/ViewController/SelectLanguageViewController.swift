//
//  SelectLanguageViewController.swift
//  SeSAC-Daily-17
//
//  Created by A_Mcflurry on 1/17/24.
//

import UIKit

class SelectLanguageViewController: UIViewController {
	
	var senderTag = 0
	let allCase = LanguageCode.allCases
	var selectLang: (inputLang: LanguageCode, outputLang: LanguageCode) = (.ko, .en)
	var complitionHandeler: ((LanguageCode) -> ())?
	@IBOutlet weak var tableView: UITableView!
	override func viewDidLoad() {
		super.viewDidLoad()
		setDelegate()
	}
}

extension SelectLanguageViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return SelectLanguageViewController.languageDictionary.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "SelectLang")!

		let currentCase = allCase[indexPath.row]
		cell.textLabel?.text = SelectLanguageViewController.languageDictionary[currentCase]

		// 이런 부분에서 튜플로 짜놓은게 실수였던것 같습니다. Array로 했으면 좀 더 깔끔하게 처리할 수 있었을거 같아요.
		// 동시에 두 값이 필요하지 않으니 애초에 처음부터 설계가 잘못된 거 같아요. 어떻게 바인딩 해줘야할지 감이 안와서 싱글톤 패턴으로 먼저 짜놓았던게 실수 같습니다.
		// 튜플이 아니라 값을 하나만 받았다면 senderTag도 필요하지 않았겠죠.
		if senderTag == 0 && currentCase == selectLang.inputLang {
			cell.textLabel?.textColor = .red
		} else if senderTag == 1 && currentCase == selectLang.outputLang {
			cell.textLabel?.textColor = .red
		}

		return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		complitionHandeler?(allCase[indexPath.row])
		navigationController?.popViewController(animated: true)
	}

	func setDelegate() {
		tableView.delegate = self
		tableView.dataSource = self
	}
}
