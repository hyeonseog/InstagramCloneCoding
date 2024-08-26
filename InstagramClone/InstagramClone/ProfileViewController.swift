import Foundation
import SnapKit
import Then
import UIKit

final class ProfileViewController: UIViewController {
    
    private let photoDataView = ProfileDataView(title: "게시물", count: 1)
    private let followerDataView = ProfileDataView(title: "팔로워", count: 999)
    private let followingDataView = ProfileDataView(title: "팔로잉", count: 1)
    
    private lazy var profileImageView = UIImageView().then {
        $0.layer.cornerRadius = 40
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.quaternaryLabel.cgColor
    }
    
    private lazy var nameLabel = UILabel().then {
        $0.text = "ggain"
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
    }
    
    private lazy var descriptionLabel = UILabel().then {
        $0.text = "하 코드 날라감"
        $0.font = .systemFont(ofSize: 14, weight: .medium)
        $0.numberOfLines = 0
    }
    
    private lazy var followButton = UIButton().then {
        $0.setTitle("팔로우", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 5
    }
    
    private lazy var messageButton = UIButton().then {
        $0.setTitle("메시지", for: .normal)
        $0.setTitleColor(.label, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.backgroundColor = .white
        
        $0.layer.cornerRadius = 5
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = UIColor.tertiaryLabel.cgColor
    }
    

    let width: CGFloat = UIScreen.main.bounds.width / 3
    //    lazy var width: CGFloat = (collectionView.bounds.width / 3) - 1.0
    private lazy var collectionViewFlow = UICollectionViewFlowLayout().then {
        $0.itemSize = .init(width: width, height: width)
        $0.scrollDirection = .vertical
    }
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: collectionViewFlow
    ).then {
        $0.backgroundColor = .systemBackground
        $0.register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
        $0.delegate = self
        $0.dataSource = self
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItems()
        setupLayout()
        
    }
    func setupLayout() {
        let buttonStackView = UIStackView(arrangedSubviews: [followButton, messageButton])
        buttonStackView.spacing = 4
        buttonStackView.distribution = .fillEqually
        
        let dataStackView = UIStackView(arrangedSubviews: [photoDataView, followerDataView, followingDataView])
        dataStackView.spacing = 4
        dataStackView.distribution = .fillEqually
        
        [
            profileImageView, nameLabel, descriptionLabel, buttonStackView, dataStackView, collectionView
        ].forEach {view.addSubview($0)}
        
        let inset: CGFloat = 16.0
        
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(inset)
            $0.leading.equalToSuperview().inset(inset)
            $0.width.equalTo(80.0)
            $0.height.equalTo(profileImageView.snp.width)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(12.0)
            $0.leading.equalTo(profileImageView.snp.leading)
            $0.trailing.equalToSuperview().inset(inset)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(12.0)
            $0.leading.equalTo(nameLabel.snp.leading)
            $0.trailing.equalTo(nameLabel.snp.trailing)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(12.0)
            $0.leading.equalTo(nameLabel.snp.leading)
            $0.trailing.equalTo(nameLabel.snp.trailing)
        }
        
        dataStackView.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(inset)
            $0.trailing.equalToSuperview().inset(inset)
            $0.centerY.equalTo(profileImageView.snp.centerY) // 중앙 정렬
        }
        
        collectionView.snp.makeConstraints {
//            $0.edges.equalTo(dataStackView.snp.bottom).offset(inset)
            $0.top.equalTo(buttonStackView.snp.bottom).offset(inset)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

private extension ProfileViewController {
    func setupNavigationItems() {
        navigationItem.title = "UserName"
        
        let rightBarButton = UIBarButtonItem(
            image: UIImage(systemName: "ellipsis"),
            style: .plain,
            target: self,
            action: nil
        )
        navigationItem.rightBarButtonItem = rightBarButton
    }
}

extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
}

