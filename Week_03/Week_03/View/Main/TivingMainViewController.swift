//
//  TivingMainViewController.swift
//  Week_03
//
//  Created by 정정욱 on 5/1/25.
//

import UIKit

import SnapKit
import Then

final class TivingMainViewController: UIViewController {
    
    // MARK: - Properties
    
    private let tabBarItems = ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"]
    private var selectedTabIndex = 0
    private let bannerData = [ImageLiterals.tiving_Benner1, ImageLiterals.tiving_Benner2, ImageLiterals.tiving_Benner3]
    private let top20Data = Top20Model.mockData()
    private let popularLiveData = PopularLiveModel.mockData()
    private let popularMovieData = PopularMovieModel.mockData()
    
    // MARK: - UI Components
    
    private var TvingMainImage = UIImageView()
    private var TvingSerchButton = UIButton()
    private var TvingMainIcon = UIImageView()
    
    private lazy var tabCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: self.createCompositionalLayout()
    )
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setUI()
        setLayout()
    }
    
    // MARK: - SetStyle
    
    private func setStyle() {
        view.backgroundColor = .black
        
        TvingMainImage.do {
            $0.image = ImageLiterals.tiving_MainImage
        }
        
        TvingSerchButton.do {
            $0.setImage(ImageLiterals.tiving_SearchIcon, for: .normal)
        }
        
        TvingMainIcon.do {
            $0.image = ImageLiterals.tiving_MainIcon
        }
        
        tabCollectionView.do {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.minimumInteritemSpacing = 28
            layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
            $0.collectionViewLayout = layout
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .black
            $0.dataSource = self
            $0.delegate = self
            $0.register(TabBarCell.self, forCellWithReuseIdentifier: TabBarCell.identifier)
        }
        
        collectionView.do {
            $0.backgroundColor = .black
            $0.dataSource = self
            $0.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.identifier)
            $0.register(TivingTop20Cell.self, forCellWithReuseIdentifier: TivingTop20Cell.identifier)
            $0.register(PopularLiveCell.self, forCellWithReuseIdentifier: PopularLiveCell.identifier)
            $0.register(PopularMovieCell.self, forCellWithReuseIdentifier: PopularMovieCell.identifier)
            $0.register(SectionHeaderView.self,
                        forSupplementaryViewOfKind: SectionHeaderView.elementKind,
                        withReuseIdentifier: SectionHeaderView.identifier)
            $0.register(SeeMoreSectionHeader.self,
                        forSupplementaryViewOfKind: SeeMoreSectionHeader.elementKind,
                        withReuseIdentifier: SeeMoreSectionHeader.identifier)
        }
        
    }
    
    // MARK: - SetUI
    
    private func setUI() {
        view.addSubviews(TvingMainImage, TvingSerchButton, TvingMainIcon, tabCollectionView, collectionView)
    }
    
    // MARK: - SetLayout
    
    private func setLayout() {
        
        TvingMainImage.snp.makeConstraints {
            $0.top.leading.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(78)
            $0.width.equalTo(191)
        }
        
        TvingMainIcon.snp.makeConstraints {
            $0.centerY.equalTo(TvingMainImage)
            $0.trailing.equalToSuperview().inset(11)
            $0.height.width.equalTo(30)
        }
        
        TvingSerchButton.snp.makeConstraints {
            $0.centerY.equalTo(TvingMainImage)
            $0.trailing.equalTo(TvingMainIcon.snp.leading).offset(-10)
            $0.height.width.equalTo(30)
        }
        
        tabCollectionView.snp.makeConstraints {
            $0.top.equalTo(TvingMainImage.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(tabCollectionView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Layout Configuration
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return CompositionalLayoutFactory.create()
    }
    
}


// MARK: - UICollectionViewDelegateFlowLayout : Tabber 관련

extension TivingMainViewController: UICollectionViewDelegateFlowLayout {
    
    // 탭 항목 하나의 사이즈를 계산
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == tabCollectionView {
            let text = tabBarItems[indexPath.item]
            let width = text.size(withAttributes: [.font: UIFont.systemFont(ofSize: 17)]).width + 20 // 여백 20pt를 더해서 동적으로 너비를 지정
            return CGSize(width: width, height: 34)
        }
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == tabCollectionView {
            selectedTabIndex = indexPath.item
            tabCollectionView.reloadData()
            // 실제 콘텐츠 교체 로직은 이후 구성
        }
    }
}

// MARK: - UICollectionViewDataSource

extension TivingMainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        if collectionView == tabCollectionView {
            return 1 // 탭바는 섹션이 하나뿐
        }
        return HomeSectionType.allCases.count // 컴포지셔널은 여러개의 섹션
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == tabCollectionView {
            return tabBarItems.count
        }
        
        guard let sectionType = HomeSectionType(rawValue: section) else { return 0 }
        switch sectionType {
        case .banner: return bannerData.count
        case .toDayTivingTop20: return top20Data.count
        case .popularLive: return popularLiveData.count
        case .popularMovie: return popularMovieData.count
        }
    }
    
    
    // cell 등록및 데이터 바인딩
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == tabCollectionView {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TabBarCell.identifier,
                for: indexPath
            ) as! TabBarCell
            let title = tabBarItems[indexPath.item]
            let isSelected = (indexPath.item == selectedTabIndex)
            cell.configure(title: title, isSelected: isSelected)
            return cell
        }
        
        guard let sectionType = HomeSectionType(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }
        
        switch sectionType {
        case .banner:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: BannerCell.identifier,
                for: indexPath) as! BannerCell
            cell.configure(image: bannerData[indexPath.item])
            return cell
        case .toDayTivingTop20:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TivingTop20Cell.identifier,
                for: indexPath) as! TivingTop20Cell
            cell.configure(rank: top20Data[indexPath.item].top20Rank, image: top20Data[indexPath.item].top20Image)
            return cell
        case .popularLive:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PopularLiveCell.identifier,
                for: indexPath) as! PopularLiveCell
            cell.configure(image: popularLiveData[indexPath.item].Image,
                           rank: popularLiveData[indexPath.item].Rank,
                           channel: popularLiveData[indexPath.item].channel,
                           episode: popularLiveData[indexPath.item].episode,
                           rating: popularLiveData[indexPath.item].rating)
            return cell
        case .popularMovie:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PopularMovieCell.identifier,
                for: indexPath) as! PopularMovieCell
            cell.configure(image: popularMovieData[indexPath.item].Image)
            return cell
        }
    }
    
    // 섹션별 헤더가 필요하다면 헤더 붙이기
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        
        if collectionView == tabCollectionView {
            return UICollectionReusableView()
        }
        
        guard let sectionType = HomeSectionType(rawValue: indexPath.section) else {
            return UICollectionReusableView()
        }
        
        switch sectionType {
        case .banner:
            return UICollectionReusableView()
            
        case .toDayTivingTop20:
            if kind == SectionHeaderView.elementKind {
                let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: SectionHeaderView.identifier,
                    for: indexPath
                ) as! SectionHeaderView
                header.configure(title: "오늘의 티빙 TOP 20")
                return header
            }
            
        case .popularLive:
            if kind == SeeMoreSectionHeader.elementKind {
                let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: SeeMoreSectionHeader.identifier,
                    for: indexPath
                ) as! SeeMoreSectionHeader
                header.configure(title: "실시간 인기 LIVE")
                return header
            }
        case .popularMovie:
            if kind == SeeMoreSectionHeader.elementKind {
                let header = collectionView.dequeueReusableSupplementaryView(
                    ofKind: kind,
                    withReuseIdentifier: SeeMoreSectionHeader.identifier,
                    for: indexPath
                ) as! SeeMoreSectionHeader
                header.configure(title: "실시간 인기 영화")
                return header
            }
        }
        return UICollectionReusableView()
    }
}

