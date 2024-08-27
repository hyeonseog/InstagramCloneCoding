import Foundation
import UIKit
import SnapKit
import Then

final class ProfileDataView: UIView {
    
    private let title: String
    private let count: Int
    
    private lazy var titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14, weight: .medium)
        $0.text = title
    }
    
    private lazy var countLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.text = "\(count)"
    }
    
    init(title: String, count: Int) {
        self.title = title
        self.count = count
        
        super.init(frame: .zero)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ProfileDataView {
    func setupLayout() {
        let stackView = UIStackView(arrangedSubviews: [countLabel, titleLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 4
        
        addSubview(stackView)
        stackView.snp.makeConstraints {$0.edges.equalToSuperview()}
    }
}
