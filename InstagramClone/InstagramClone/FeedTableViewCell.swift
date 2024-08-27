import Foundation
import UIKit
import SnapKit
import Then


final class FeedTableViewCell: UITableViewCell {

    private lazy var postImageView = UIImageView().then {
        $0.backgroundColor = .tertiaryLabel
    }
    
    private lazy var likeButton = UIButton().then {
        $0.setImage(UIImage(systemName: "heart"), for: .normal)
    }
    
    private lazy var commentButton = UIButton().then {
        $0.setImage(UIImage(systemName: "message"), for: .normal)
    }
    
    private lazy var directMessageButton = UIButton().then {
        $0.setImage(UIImage(systemName: "paperplane"), for: .normal)
    }
    
    private lazy var bookMarkButton = UIButton().then {
        $0.setImage(UIImage(systemName: "bookmark"), for: .normal)
    }
    
    private lazy var currentLikeCountLabel = UILabel().then {
        $0.textColor = .label
        $0.font = .systemFont(ofSize: 13, weight: .semibold)
        $0.text = "hy._.s9_님 외 32명이 좋아합니다."
    }
    
    private lazy var contentsLabel = UILabel().then {
        $0.textColor = .label
        $0.font = .systemFont(ofSize: 13, weight: .semibold)
        $0.numberOfLines = 5
        $0.text = "ggain  So keep your head high, keep your chin up, and most importantly, keep smiling, because life’s a beautiful thing and there’s so much to smile about."
    }
    
    private lazy var dateLabel = UILabel().then {
        $0.textColor = .label
        $0.font = .systemFont(ofSize: 11, weight: .medium)
        $0.text = "33분전"
    }
    
    func setup() {
        [
            postImageView,
            likeButton,
            commentButton,
            directMessageButton,
            bookMarkButton,
            currentLikeCountLabel,
            contentsLabel,   // 추가
            dateLabel        // 추가
        ].forEach { addSubview($0) }
        
        // 버튼들의 사이 간격을 동일하게 주기 위해 선언
        let buttonWidth: CGFloat = 24
        let buttonInset: CGFloat = 16
        
        postImageView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(postImageView.snp.width)
        }
        
        likeButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(buttonInset)
            $0.top.equalTo(postImageView.snp.bottom).offset(buttonInset)
            $0.width.height.equalTo(buttonWidth)
        }
        
        commentButton.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.trailing).offset(12)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.height.equalTo(buttonWidth)
        }
        
        directMessageButton.snp.makeConstraints {
            $0.leading.equalTo(commentButton.snp.trailing).offset(12)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.height.equalTo(buttonWidth)
        }
        
        bookMarkButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(buttonInset)
            $0.top.equalTo(likeButton.snp.top)
            $0.width.height.equalTo(buttonWidth)
        }
        
        currentLikeCountLabel.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookMarkButton.snp.trailing)
            $0.top.equalTo(likeButton.snp.bottom).offset(14)
        }
        
        contentsLabel.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookMarkButton.snp.trailing)
            $0.top.equalTo(currentLikeCountLabel.snp.bottom).offset(8)
        }
        
        dateLabel.snp.makeConstraints {
            $0.leading.equalTo(likeButton.snp.leading)
            $0.trailing.equalTo(bookMarkButton.snp.trailing)
            $0.top.equalTo(contentsLabel.snp.bottom).offset(8)
            $0.bottom.equalToSuperview().inset(16)
        }
    }
}
