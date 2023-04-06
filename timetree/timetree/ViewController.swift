//
//  ViewController.swift
//  timetree
//
//  Created by 조성민 on 2023/04/03.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{

    
    
    
    
    private lazy var navigationBar = UINavigationBar()
    private lazy var mainView = UIView()
    private lazy var bottomStackView = UIStackView()
    private lazy var sideBarButton = UIButton()
    private lazy var premiumButton = UIButton()
    private lazy var typeOfCalendar = UILabel()
    private lazy var calendarFunctionView = UIView()
    private lazy var todayDateLabel = UILabel()
    private lazy var returnButton = UIButton()
    private lazy var resizeButton = UIButton()
    private lazy var fullscreenButton = UIButton()
    private lazy var weekStackView = UIStackView()
    
    private lazy var sunLabel = UILabel()
    private lazy var monLabel = UILabel()
    private lazy var tueLabel = UILabel()
    private lazy var wedLabel = UILabel()
    private lazy var thuLabel = UILabel()
    private lazy var friLabel = UILabel()
    private lazy var satLabel = UILabel()
    
    private lazy var calendarButton = UIButton()
    private lazy var memoButton = UIButton()
    private lazy var plusButton = UIButton()
    private lazy var searchButton = UIButton()
    private lazy var moreButton = UIButton()
    
    private lazy var calendarUICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    
    
    
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
        setupBottomStackView()
        
    }
    
    
    
    
    func setupView() {
        view.addSubview(navigationBar)
        view.addSubview(mainView)
        view.addSubview(bottomStackView)
        
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
        
        bottomStackView.snp.makeConstraints { make in
            make.top.equalTo(mainView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(60)
        }
    }
    
    func setupNavigationBar() {
        sideBarButton.setImage(UIImage(systemName: "align.horizontal.left.fill"), for: .normal)
        sideBarButton.tintColor = .white
        navigationBar.addSubview(sideBarButton)
        sideBarButton.snp.makeConstraints{make in
            make.leading.equalToSuperview().offset(10)
            make.width.height.equalTo(40)
            make.centerY.equalToSuperview()
        }
        
        premiumButton.setImage(UIImage(systemName: "star.circle"), for: .normal)
        premiumButton.tintColor = .white
        navigationBar.addSubview(premiumButton)
        premiumButton.snp.makeConstraints{make in
            make.trailing.equalToSuperview().offset(-10)
            make.width.height.equalTo(40)
            make.centerY.equalToSuperview()
        }
        
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
        
        
        mainView.addSubview(calendarFunctionView)
        
        calendarFunctionView.backgroundColor = .darkGray
        calendarFunctionView.snp.makeConstraints{make in
            make.top.trailing.leading.equalToSuperview()
            make.height.equalTo(50)
        }
        
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
        
        
        mainView.addSubview(weekStackView)
        weekStackView.axis = .horizontal
        weekStackView.distribution = .fillEqually
        weekStackView.backgroundColor = .black
        weekStackView.snp.makeConstraints{make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(calendarFunctionView.snp.bottom)
            make.height.equalTo(30)
        }
        
        sunLabel.text = "일"
        sunLabel.textColor = .white
        sunLabel.textAlignment = .center
        sunLabel.font = UIFont.systemFont(ofSize: 11)
        
        monLabel.text = "월"
        monLabel.textColor = .white
        monLabel.textAlignment = .center
        monLabel.font = UIFont.systemFont(ofSize: 11)
        
        tueLabel.text = "화"
        tueLabel.textColor = .white
        tueLabel.textAlignment = .center
        tueLabel.font = UIFont.systemFont(ofSize: 11)
        
        wedLabel.text = "수"
        wedLabel.textColor = .white
        wedLabel.textAlignment = .center
        wedLabel.font = UIFont.systemFont(ofSize: 11)
        
        thuLabel.text = "목"
        thuLabel.textColor = .white
        thuLabel.textAlignment = .center
        thuLabel.font = UIFont.systemFont(ofSize: 11)
        
        friLabel.text = "금"
        friLabel.textColor = .white
        friLabel.textAlignment = .center
        friLabel.font = UIFont.systemFont(ofSize: 11)
        
        satLabel.text = "토"
        satLabel.textColor = .white
        satLabel.textAlignment = .center
        satLabel.font = UIFont.systemFont(ofSize: 11)
        
        weekStackView.addArrangedSubview(sunLabel)
        weekStackView.addArrangedSubview(monLabel)
        weekStackView.addArrangedSubview(tueLabel)
        weekStackView.addArrangedSubview(wedLabel)
        weekStackView.addArrangedSubview(thuLabel)
        weekStackView.addArrangedSubview(friLabel)
        weekStackView.addArrangedSubview(satLabel)
        
        
        mainView.addSubview(calendarUICollectionView)
        calendarUICollectionView.dataSource = self
        calendarUICollectionView.delegate = self
        calendarUICollectionView.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: CalendarCollectionViewCell.identifier)
        calendarUICollectionView.backgroundColor = .gray
        calendarUICollectionView.snp.makeConstraints{make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(weekStackView.snp.bottom)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 42
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCollectionViewCell.identifier, for: indexPath) as? CalendarCollectionViewCell else { return UICollectionViewCell() }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.weekStackView.frame.width / 7
        return CGSize(width: width, height: width * 1.3)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func setupBottomStackView() {
        
        
        bottomStackView.axis = .horizontal
        bottomStackView.distribution = .fillEqually
        bottomStackView.backgroundColor = .black
        
        bottomStackView.addArrangedSubview(calendarButton)
        bottomStackView.addArrangedSubview(memoButton)
        bottomStackView.addArrangedSubview(plusButton)
        bottomStackView.addArrangedSubview(searchButton)
        bottomStackView.addArrangedSubview(moreButton)
        
        calendarButton.setImage(UIImage(systemName: "calendar"), for: .normal)
        calendarButton.tintColor = .white
        
        memoButton.setImage(UIImage(systemName: "note.text"), for: .normal)
        memoButton.tintColor = .white
        
        plusButton.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        plusButton.tintColor = .white
        
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.tintColor = .white
        
        moreButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        moreButton.tintColor = .white
        
    }
    
    
}


