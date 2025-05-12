import UIKit
import SnapKit

final class BoxOfficeMovieCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = BoxOfficeMovieCell.className
    
    // MARK: - UI Components
    
    private let rankLabel = UILabel()
    private let movieNmLabel = UILabel()
    private let openDtLabel = UILabel()
    private let salesAccLabel = UILabel()
    private let audiAccLabel = UILabel()
    
    private lazy var infoStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            rankLabel,
            movieNmLabel,
            openDtLabel,
            salesAccLabel,
            audiAccLabel
        ])
        stack.axis = .vertical
        stack.spacing = 6
        stack.alignment = .leading
        return stack
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetUI
    
    private func setUI() {
        contentView.addSubview(infoStackView)
        
        [rankLabel, movieNmLabel, openDtLabel, salesAccLabel, audiAccLabel].forEach {
            $0.font = .systemFont(ofSize: 8, weight: .regular)
            $0.textColor = .white
            $0.numberOfLines = 1
        }
    }
    
    // MARK: - SetLayout
    
    private func setLayout() {
        infoStackView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview().inset(12)
        }
    }
}

extension BoxOfficeMovieCell {
    
    // MARK: - Configure
    
    func configure(model: DailyBoxOfficeList) {
        rankLabel.text = "순위: \(model.rank)"
        movieNmLabel.text = "영화명: \(model.movieNm)"
        openDtLabel.text = "개봉일: \(model.openDt)"
        salesAccLabel.text = "누적 매출: \(model.salesAcc)"
        audiAccLabel.text = "누적 관객: \(model.audiAcc)"
    }
}
