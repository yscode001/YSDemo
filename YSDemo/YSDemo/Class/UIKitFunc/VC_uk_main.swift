//
//  VC_uk_main.swift
//  YSDemo
//
//  Created by 姚帅 on 2021/1/23.
//

class VC_uk_main: VC_base {
    
    private lazy var tbv:UITableView = UITableView.ys.create(bgc: .clear, frame: .zero, style: .plain, cells: [CellID.id: Cell_uk_main.self])
    
    private lazy var vm:VM_uk_main = VM_uk_main()
    
    override func viewDidLoad(firstTime: Bool) {
        super.viewDidLoad(firstTime: firstTime)
        setupUI()
        bindVM()
    }
    
    private func setupUI(){
        view.ys.addSubviews(tbv)
        tbv.snp.makeConstraints { (make) in
            make.top.equalTo(UIScreen.ys.statusBarFrame.height)
            make.bottom.leading.trailing.equalTo(0)
        }
    }
    
    private func bindVM(){
        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, M_uk_main>>(configureCell: { (dataSource, tv, indexPath, element) in
            let cell = UITableView.ys.createCell(tv, indexPath, CellID.id) as! Cell_uk_main
            cell.setupData(model: element)
            return cell
        })
        dataSource.titleForHeaderInSection = { ds, index in
            return ds.sectionModels[index].model
        }
        vm.list.bind(to: tbv.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
    }
}
