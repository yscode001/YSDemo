//
//  VC_sk_main.swift
//  YSDemo
//
//  Created by 姚帅 on 2021/1/23.
//

class VC_sk_main: VC_base {
   
    private lazy var tbv:UITableView = UITableView.ys.create(bgc: .clear, frame: .zero, style: .plain, cells: [CellID.id: Cell_sk_main.self])
    
    private lazy var vm:VM_sk_main = VM_sk_main()
    
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
        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, M_sk_main>>(configureCell: { (dataSource, tv, indexPath, element) in
            let cell = UITableView.ys.createCell(tv, indexPath, CellID.id) as! Cell_sk_main
            cell.setupData(model: element)
            return cell
        })
        dataSource.titleForHeaderInSection = { ds, index in
            return ds.sectionModels[index].model
        }
        vm.list.bind(to: tbv.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
        
        tbv.rx.modelSelected(M_sk_main.self).bind(onNext: { [weak self] (element) in
            guard let `self` = self else{ return }
            switch element.identifier{
            case "id1-1":
                self.ys.push(VC_sk_action(scene: SKScene_position()), animated: true)
            case "id1-2":
                self.ys.push(VC_sk_action(scene: SKScene_textureAtlas()), animated: true)
            case "id1-3":
                self.ys.push(VC_sk_action(scene: SKScene_transition1()), animated: true)
            case "id2-1":
                self.ys.push(VC_sk_action(scene: SKScene_physics()), animated: true)
            default:
                break
            }
        }).disposed(by: disposeBag)
    }
}
