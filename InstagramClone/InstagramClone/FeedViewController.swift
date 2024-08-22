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

    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setupLayOut()
        setupNavigationBar()
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



