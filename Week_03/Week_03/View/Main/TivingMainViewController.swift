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

    private let bannerData = [ImageLiterals.tiving_Benner1, ImageLiterals.tiving_Benner2, ImageLiterals.tiving_Benner3]
    private let top20Data = Top20Model.mockData()


    // MARK: - UI Components

    lazy var collectionView = UICollectionView(
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
        
        collectionView.do {
            $0.backgroundColor = .black
            $0.dataSource = self
            $0.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.identifier)
            $0.register(TivingTop20Cell.self, forCellWithReuseIdentifier: TivingTop20Cell.identifier)
            $0.register(SectionHeaderView.self,
                        forSupplementaryViewOfKind: SectionHeaderView.elementKind,
                        withReuseIdentifier: SectionHeaderView.identifier)
        }
        
    }

    // MARK: - SetUI

    private func setUI() {
        view.addSubview(collectionView)
    }

    // MARK: - SetLayout

    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    // MARK: - Layout Configuration

    // MARK: - Layout Configuration
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return CompositionalLayoutFactory.create()
    }

}

// MARK: - UICollectionViewDataSource

extension TivingMainViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return HomeSectionType.allCases.count  // 몇개의 섹션이 존재하는지 반환
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sectionType = HomeSectionType(rawValue: section) else { return 0 }
        switch sectionType {
        case .banner:
            return bannerData.count
        case .toDayTivingTop20:
            return top20Data.count
        }
    }
    
    // cell 등록및 데이터 바인딩
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
            cell.configure(rank: top20Data[indexPath.item].Top20Rank, image: top20Data[indexPath.item].Top20Image)
            return cell
        }
    }

    // 섹션별 헤더가 필요하다면 헤더 붙이기
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == SectionHeaderView.elementKind,
              let sectionType = HomeSectionType(rawValue: indexPath.section) else {
            return UICollectionReusableView()
        }

        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: SectionHeaderView.identifier,
            for: indexPath
        ) as! SectionHeaderView

        switch sectionType {
        case .banner:
            break
        case .toDayTivingTop20:
            header.configure(title: "오늘의 티빙 TOP 20")
        }

        return header
    }
}

