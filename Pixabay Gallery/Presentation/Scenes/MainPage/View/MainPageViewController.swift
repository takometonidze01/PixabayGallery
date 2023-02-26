//
//  MainPageViewController.swift
//  Pixabay Gallery
//
//  Created by CodergirlTM on 17.08.22.
//

import UIKit

class MainPageViewController: UIViewController {

    
    private let tableView = UITableView()
    private var viewModel: MainPageViewModelProtocol
    private var dataSource: MainPageDataSource!
    private let presentationAssembly: PresentationAssembly

    init(viewModel: MainPageViewModelProtocol,
         presentationAssembly: PresentationAssembly) {
        self.viewModel = viewModel
        self.presentationAssembly = presentationAssembly
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        setup()
        setupConstraints()
        configureViewModel()
        addNavButton()
    }
    
    func addNavButton() {
        let cancelButton = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(logOutBtn))
        navigationItem.leftBarButtonItem = cancelButton
    }

    func setup() {
        view.addSubview(self.tableView)
        
        tableView.registerNib(class: MainCell.self)
    }

    func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view).offset(50 * Constraints.yCoeff)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
            make.bottom.equalTo(view)
        }
    }
    
    func configureViewModel() {
        dataSource = MainPageDataSource(with: tableView,
                                        viewModel: viewModel,
                                        viewController: self,
                                        presentationAssembly: presentationAssembly)
        
        dataSource.refresh()
    }
    
    @objc func logOutBtn(){
        navigationController?.popToRootViewController(animated: true)
    }
}
