import Foundation
import Then
import SnapKit
import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProfileCollectionViewCell"
    private let imageView = UIImageView()
    
    public override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubview(imageView)
        imageView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        imageView.backgroundColor = .tertiaryLabel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
