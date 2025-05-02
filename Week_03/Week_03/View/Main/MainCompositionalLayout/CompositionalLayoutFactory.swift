//
//  CompositionalLayoutFactory.swift
//  Week_03
//
//  Created by 정정욱 on 5/1/25.
//

import UIKit

enum HomeSectionType: Int, CaseIterable {
    case banner = 0
    case toDayTivingTop20
    case popularLive
    case popularMovie
}

struct CompositionalLayoutFactory {
    
    static func create() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionNumber, _ in
            let section: NSCollectionLayoutSection
            
            switch HomeSectionType(rawValue: sectionNumber) {
            case .banner:
                section = makeBannerSection()
            case .toDayTivingTop20:
                section = makeTop20Section()
            case .popularLive:
                section = makePopularLiveSection()
            case .popularMovie:
                section = makePopularMovieSection()
            case .none:
                section = makeTop20Section()
            }
            
            return section
        }
    }

    private static func makeBannerSection() -> NSCollectionLayoutSection {
        
        // 아이템 사이즈
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0), // 그룹과, 섹션에 대하여 비율로 설정
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        // 그룹 사이즈
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(400))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        // 섹션 사이즈
        let section = NSCollectionLayoutSection(group: group) // 섹션의 크기는 내부 그룹이 결정
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 9, trailing: 0)
        section.orthogonalScrollingBehavior = .paging
        return section
    }

    private static func makeTop20Section() -> NSCollectionLayoutSection {
        
        // 아이템 사이즈
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(150),
            heightDimension: .estimated(146)) // estimated 자동 cell 높이 지정
        // 반대로 생각했음 숫자에 따라 가로가 동적으로 되어야 한다고 느꼈는데 사용자가 가로 너비가 일정해야 좋게 느껴 고정
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 14) // 뒤랑 여백을 줌 특정 아이템마다 다른 여백을 줘야 할 경우에만 contentInsets를 사용하는 게 좋아요.

        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .estimated(350),
            heightDimension: .estimated(146))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        //group.interItemSpacing = .fixed(18) // 각 아이템 사이 간격을 14pt로 고정

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 10, bottom: 18, trailing: 10)
        /*
         top: 12 → 위쪽 여백 확보 (섹션 헤더와 분리)

         leading/trailing: 10 → 좌우 양 끝 여백

         bottom: 20 → 아래쪽 콘텐츠와 구분
         */
        
        // 4️⃣ 헤더 사이즈 및 SupplementaryItem 설정
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(23)                // 헤더 높이 고정
        )
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: SectionHeaderView.elementKind,   // elementKind는 헤더 등록 시 사용한 값과 동일해야 함
            //    해당 헤더가 어떤 종류인지 식별하는 키. SectionHeaderView.elementKind와 일치해야 함
            alignment: .top // 헤더를 상단에 붙이겠다.
        )

        section.boundarySupplementaryItems = [header] // header를 해당 섹션의 헤더로 연결해주는 역할, 배열인 이유는 풋터도 들어갈 수 있기 때문
        
        return section
    }
    
    private static func makePopularLiveSection() -> NSCollectionLayoutSection {
        
        // 아이템 사이즈
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(167),
            heightDimension: .estimated(130)) // estimated 자동 cell 높이 지정
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 7)

        // 그룹사이즈
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .estimated(334),
            heightDimension: .estimated(130))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 10, bottom: 18, trailing: 10)
      
        
        // 헤더 사이즈 및 SupplementaryItem 설정
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(23)
        )
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: SeeMoreSectionHeader.elementKind,
            alignment: .top
        )

        section.boundarySupplementaryItems = [header] 
        
        return section
    }
    
    private static func makePopularMovieSection() -> NSCollectionLayoutSection {
        
        // 아이템 사이즈
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(98),
            heightDimension: .estimated(160))
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 8)

        // 그룹사이즈
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .estimated(196),
            heightDimension: .estimated(160))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 10, bottom: 18, trailing: 10)
      
        
        // 헤더 사이즈 및 SupplementaryItem 설정
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(23)                // 헤더 높이 고정
        )
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: SeeMoreSectionHeader.elementKind,
            alignment: .top
        )

        section.boundarySupplementaryItems = [header]
        
        return section
    }
}
