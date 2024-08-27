import UIKit
import Then
import SnapKit

class FeedViewController: UIViewController {
    
    private lazy var tableView = UITableView(frame: .zero).then {
        $0.backgroundColor = .systemBackground
        $0.separatorStyle = .none
        $0.dataSource = self
        $0.register(FeedTableViewCell.self, forCellReuseIdentifier: "FeedTableViewCell")
    }
    
    private lazy var imagePickerViewController = UIImagePickerController().then {
        $0.sourceType = .photoLibrary
    }
    
    @objc func didTapUploadButton() {
        present(imagePickerViewController, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setupLayOut()
        setupNavigationBar()
        
        navigationItem.rightBarButtonItem?.action = #selector(didTapUploadButton)
    }
    
    func addView() {
        view.addSubview(tableView)
    }
    func setupLayOut() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

private extension FeedViewController {
    func setupNavigationBar() {
        navigationItem.title = "Instagram"
        
        let uploadButton = UIBarButtonItem(
            image: UIImage(systemName: "plus.app"),
            style: .plain,
            target: self,
            action: nil)
        
        navigationItem.rightBarButtonItem = uploadButton
    }
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell",for: indexPath) as? FeedTableViewCell
        
        cell?.setup()
        return cell ?? UITableViewCell()
    }
}

extension FeedViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        var selectImage: UIImage?
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as?
            UIImage {
            selectImage = editedImage
        } else if let originImage =
                    info[UIImagePickerController.InfoKey.originalImage] as?
                    UIImage {
            selectImage = originImage
        }
        
        print(selectImage)
        
        picker.dismiss(animated: true) { [weak self] in
            let uploadViewController = UploadViewController()
            let navigationController = UINavigationController(rootViewController: UploadViewController())
            navigationController.modalPresentationStyle = .fullScreen
            
            self?.present(navigationController, animated: true)
        }
    }
}



