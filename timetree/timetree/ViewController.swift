//
//  ViewController.swift
//  timetree
//
//  Created by 조성민 on 2023/04/03.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let navigationBar = UINavigationBar()
    let mainView = UIView()
    let tabBar = UITabBar()
    
    
    private let titleLabel : UILabel = {
       let label = UILabel()

        label.text = "hello"
        label.textColor = .yellow

        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupView()
        setupNavigationBar()
        setupMainView()
        setuptabBar()
        
    }
    
    func setupView() {
        view.addSubview(navigationBar)
        view.addSubview(mainView)
        view.addSubview(tabBar)
        
        navigationBar.backgroundColor = .black
        navigationBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(mainView.snp.top)
            make.height.equalTo(60)
        }
        
        mainView.backgroundColor = .gray
        mainView.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        
        tabBar.backgroundColor = .black
        tabBar.snp.makeConstraints { make in
            make.top.equalTo(mainView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(60)
        }
    }
    
    func setupNavigationBar() {
        let sideBarButton = UIButton()
        sideBarButton.setImage(UIImage(systemName: "align.horizontal.left.fill"), for: .normal)
        sideBarButton.tintColor = .white
        navigationBar.addSubview(sideBarButton)
        sideBarButton.snp.makeConstraints{make in
            make.leading.equalToSuperview().offset(10)
            make.width.height.equalTo(40)
            make.centerY.equalToSuperview()
        }
        
        let premiumButton = UIButton()
        premiumButton.setImage(UIImage(systemName: "star.circle"), for: .normal)
        premiumButton.tintColor = .white
        navigationBar.addSubview(premiumButton)
        premiumButton.snp.makeConstraints{make in
            make.trailing.equalToSuperview().offset(-10)
            make.width.height.equalTo(40)
            make.centerY.equalToSuperview()
        }
        
        let typeOfCalendar = UILabel()
        typeOfCalendar.text = "캘린더의 종류 func"
        typeOfCalendar.textColor = .white
        typeOfCalendar.font = UIFont.systemFont(ofSize: 15)
        typeOfCalendar.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        
        navigationBar.addSubview(typeOfCalendar)
        typeOfCalendar.snp.makeConstraints{make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(sideBarButton.snp.trailing).offset(15)
            make.trailing.equalTo(premiumButton.snp.leading)
        }

        
        
    }
    func setupMainView() {
        
        let calendarFunctionView = UIView()
        
        mainView.addSubview(calendarFunctionView)
        
        calendarFunctionView.backgroundColor = .darkGray
        calendarFunctionView.snp.makeConstraints{make in
            make.top.trailing.leading.equalToSuperview()
            make.height.equalTo(50)
        }
        
        let todayDateLabel = UILabel()
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월"
        todayDateLabel.text = dateFormatter.string(from: date)
        todayDateLabel.textColor = .white
        todayDateLabel.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        calendarFunctionView.addSubview(todayDateLabel)
        todayDateLabel.snp.makeConstraints{make in
            make.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(100)
        }
        
        let returnButton = UIButton()
        let resizeButton = UIButton()
        let fullscreenButton = UIButton()
        
        returnButton.setImage(UIImage(systemName: "arrow.uturn.backward"), for: .normal)
        returnButton.tintColor = .white
        returnButton.backgroundColor = .gray
        returnButton.layer.cornerRadius = 10
        
        resizeButton.setImage(UIImage(systemName: "square.topthird.inset.filled"), for: .normal)
        resizeButton.tintColor = .white
        resizeButton.backgroundColor = .gray
        resizeButton.layer.cornerRadius = 10
        
        fullscreenButton.setImage(UIImage(systemName: "arrow.up.left.and.arrow.down.right"), for: .normal)
        fullscreenButton.tintColor = .white
        fullscreenButton.backgroundColor = .gray
        fullscreenButton.layer.cornerRadius = 10

        calendarFunctionView.addSubview(returnButton)
        calendarFunctionView.addSubview(resizeButton)
        calendarFunctionView.addSubview(fullscreenButton)
        
        fullscreenButton.snp.makeConstraints{make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-10)
            make.width.height.equalTo(40)
        }
        resizeButton.snp.makeConstraints{make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(fullscreenButton).offset(-50)
            make.width.height.equalTo(40)
        }
        returnButton.snp.makeConstraints{make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(resizeButton).offset(-50)
            make.width.height.equalTo(40)
        }
        
        let weekStackView = UIStackView()
        
        mainView.addSubview(weekStackView)
        weekStackView.axis = .horizontal
//        weekStackView.alignment = .fill
        weekStackView.distribution = .fillEqually
        weekStackView.backgroundColor = .black
        weekStackView.snp.makeConstraints{make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(calendarFunctionView.snp.bottom)
            make.height.equalTo(30)
        }
        
//        var dayOfWeekLabelArray = [UILabel()]
        
        let sunLabel = UILabel()
        sunLabel.text = "일"
        sunLabel.textColor = .white
        sunLabel.textAlignment = .center
        sunLabel.font = UIFont.systemFont(ofSize: 11)
//        dayOfWeekLabelArray.append(sunLabel)
        let monLabel = UILabel()
        monLabel.text = "월"
        monLabel.textColor = .white
        monLabel.textAlignment = .center
        monLabel.font = UIFont.systemFont(ofSize: 11)
//        dayOfWeekLabelArray.append(monLabel)
        let tueLabel = UILabel()
        tueLabel.text = "화"
        tueLabel.textColor = .white
        tueLabel.textAlignment = .center
        tueLabel.font = UIFont.systemFont(ofSize: 11)
//        dayOfWeekLabelArray.append(tueLabel)
        let wedLabel = UILabel()
        wedLabel.text = "수"
        wedLabel.textColor = .white
        wedLabel.textAlignment = .center
        wedLabel.font = UIFont.systemFont(ofSize: 11)
//        dayOfWeekLabelArray.append(wedLabel)
        let thuLabel = UILabel()
        thuLabel.text = "목"
        thuLabel.textColor = .white
        thuLabel.textAlignment = .center
        thuLabel.font = UIFont.systemFont(ofSize: 11)
//        dayOfWeekLabelArray.append(thuLabel)
        let friLabel = UILabel()
        friLabel.text = "금"
        friLabel.textColor = .white
        friLabel.textAlignment = .center
        friLabel.font = UIFont.systemFont(ofSize: 11)
//        dayOfWeekLabelArray.append(friLabel)
        let satLabel = UILabel()
        satLabel.text = "토"
        satLabel.textColor = .white
        satLabel.textAlignment = .center
        satLabel.font = UIFont.systemFont(ofSize: 11)
//        dayOfWeekLabelArray.append(satLabel)
        weekStackView.addArrangedSubview(sunLabel)
        weekStackView.addArrangedSubview(monLabel)
        weekStackView.addArrangedSubview(tueLabel)
        weekStackView.addArrangedSubview(wedLabel)
        weekStackView.addArrangedSubview(thuLabel)
        weekStackView.addArrangedSubview(friLabel)
        weekStackView.addArrangedSubview(satLabel)
        
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        let calendarCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        mainView.addSubview(calendarFunctionView)
//        calendarFunctionView.backgroundColor = .systemGray
//
//        calendarFunctionView.snp.makeConstraints{make in
//            make.top.equalTo(weekStackView.snp.bottom)
//            make.leading.trailing.bottom.equalToSuperview()
//        }
//
    }
    func setuptabBar() {
        
        tabBar.itemSpacing = UIScreen.main.bounds.width/5
        tabBar.itemPositioning = .centered
        let calendarButton = UIButton()
        let memoButton = UIButton()
        let plusButton = UIButton()
        let searchButton = UIButton()
        let moreButton = UIButton()
        
        
        calendarButton.setImage(UIImage(systemName: "calendar"), for: .normal)
        calendarButton.tintColor = .white
        tabBar.addSubview(calendarButton)
        calendarButton.snp.makeConstraints{make in
//            make.leading.equalToSuperview().offset(10)
            make.width.height.equalTo(40)
            make.centerY.equalToSuperview()
        }

        memoButton.setImage(UIImage(systemName: "note.text"), for: .normal)
        memoButton.tintColor = .white
        tabBar.addSubview(memoButton)
        memoButton.snp.makeConstraints{make in
//            make.leading.equalTo(calendarButton.snp.trailing)
            make.width.height.equalTo(40)
            make.centerY.equalToSuperview()
        }
        
        plusButton.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        plusButton.tintColor = .white
        tabBar.addSubview(plusButton)
        plusButton.snp.makeConstraints{make in
//            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(40)
        }
        
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .white
        tabBar.addSubview(searchButton)
        searchButton.snp.makeConstraints{make in
//            make.leading.equalTo(plusButton.snp.trailing).offset(-10)
            make.width.height.equalTo(40)
            make.centerY.equalToSuperview()
        }
        
        moreButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        moreButton.tintColor = .white
        tabBar.addSubview(moreButton)
        moreButton.snp.makeConstraints{make in
//            make.trailing.equalToSuperview().offset(-10)
//            make.leading.equalTo(searchButton.snp.trailing)
            make.width.height.equalTo(40)
            make.centerY.equalToSuperview()
        }
        
    }
    
}
