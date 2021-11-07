//
//  UIImageViewExtension.swift
//  TableViewTest
//
//  Created by TejaDanasvi on 5/11/21.
//

import UIKit
import Alamofire
import AlamofireImage

extension UIImageView {
    func load(urlString: String) {
        AF.request(urlString).responseImage { response in
            guard let data = response.data else { return }
            self.image = UIImage(data: data, scale: UIScreen.main.scale)!
        }
    }
}
