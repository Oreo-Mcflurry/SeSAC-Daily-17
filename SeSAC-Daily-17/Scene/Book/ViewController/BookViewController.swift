//
//  BookViewController.swift
//  SeSAC-Daily-17
//
//  Created by A_Mcflurry on 1/17/24.
//

import UIKit
import Alamofire
import Kingfisher

class BookViewController: UIViewController {

	var datas: Book? 
	@IBOutlet weak var searchBar: UISearchBar!
	@IBOutlet weak var collectionView: UICollectionView!
	override func viewDidLoad() {
		super.viewDidLoad()
		setSearchBarDelegate()
		registerCell()
		setCollectionViewDelegate()

		let layout = UICollectionViewFlowLayout()
		let padding: CGFloat = 10

		layout.itemSize = CGSize(width: (UIScreen.main.bounds.width-padding*3)/2, height: (UIScreen.main.bounds.width-padding*3))
		layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
		layout.minimumLineSpacing = padding
		layout.minimumInteritemSpacing = padding
		collectionView.collectionViewLayout = layout
	}
}



extension BookViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return datas?.documents?.count ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookCollectionViewCell.identifier, for: indexPath) as! BookCollectionViewCell
		let fail = "https://mblogthumb-phinf.pstatic.net/MjAyMTA3MDhfMTc3/MDAxNjI1NzA5ODMwOTIy.TQzEnrCHySFY3NHYCKWSwpVjScqF96r1YmN3DdsaY_Ug.oZJ_2F1YkfzNrUVdOQ-N2SOW12UPH47SjNm5PHAaSb8g.JPEG.kimjin8946/2.jpg?type=w800"

		if let bookImage = URL(string: datas!.documents![indexPath.item].thumbnail!) {
			cell.bookImage.kf.setImage(with: bookImage)
		} else {
			cell.bookImage.kf.setImage(with: URL(string: fail)!)
		}

		cell.titleLabel.text = datas?.documents![indexPath.item].title
		cell.descriptionLabel.text = datas?.documents![indexPath.item].contents
		return cell
	}

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let vc = storyboard?.instantiateViewController(identifier: WebBookViewController.identifier) as! WebBookViewController

		vc.url = (datas?.documents![indexPath.row].url)!

		navigationController?.pushViewController(vc, animated: true)
	}

	func registerCell() {
		collectionView.register(UINib(nibName: BookCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: BookCollectionViewCell.identifier)
	}

	func setCollectionViewDelegate() {
		collectionView.delegate = self
		collectionView.dataSource = self
	}
}

extension BookViewController: UISearchBarDelegate {
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		callRequest(searchBar.text!)
	}

	func setSearchBarDelegate() {
		searchBar.delegate = self
	}

	func callRequest(_ bookName: String) {
		let url = "https://dapi.kakao.com/v3/search/book?query=\(bookName)"
		let header: HTTPHeaders = [
			"Authorization": APIKeys.kakaoAuth.rawValue
		  ]

		AF.request(url, method: .get, headers: header).responseDecodable(of: Book.self) { response in
			switch response.result {
			case .success(let success):
				dump(success)
				self.datas = success
				self.collectionView.reloadData()
			case .failure(_):
				print("123")
			}
		}
	}
}
