//
//  ViewController.swift
//  HelloWorld
//
//  Created by 조성민 on 2023/03/31.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        let snpTextLabel = UILabel()
        snpTextLabel.text = "Hello world.."
        view.addSubview(snpTextLabel)
        snpTextLabel.snp.makeConstraints{ make in
            make.centerX.centerY.equalToSuperview()
        }
        
    }
}

