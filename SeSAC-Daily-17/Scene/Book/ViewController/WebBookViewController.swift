//
//  WebBookViewController.swift
//  SeSAC-Daily-17
//
//  Created by A_Mcflurry on 1/17/24.
//

import UIKit
import WebKit

class WebBookViewController: UIViewController {

	@IBOutlet weak var webView: WKWebView!
	var url = ""
	override func viewDidLoad() {
		super.viewDidLoad()
		webView.load(URLRequest(url: URL(string: url)!))
	}

}
