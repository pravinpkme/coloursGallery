// ViewController.swift

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var detailViewConstrain: NSLayoutConstraint!
    
    
    
    // MARK: - Main View Setup
    
    //collection view
    @IBOutlet weak var photoCollectionView: PhotosCollectionView! {
        didSet {
            photoCollectionView.layer.cornerRadius = 10
            photoCollectionView.layer.masksToBounds = true
        }
    }
    
    
   //view as button
    @IBOutlet weak var backwordBtnView: UIView!{
            didSet{
                backwordBtnView.makeCircular()
                backwordBtnView.addTapGesture(target: self, action:#selector(onBackwordPress))
            }
        }
        
        
        @IBOutlet weak var forwardBtnView: UIView!{
            didSet{
                forwardBtnView.makeCircular()
                forwardBtnView.addTapGesture(target: self, action:  #selector(onForwardPress))
            }
        }
    //backround for btn
    
    @IBOutlet weak var navBtnBackroundView: UIView!{
        didSet{
            navBtnBackroundView.makeCircular()
        }
    }
    
    
    
// MARK: - Side Pannel Setup
    
    //closebtn
    @IBOutlet weak var detailCloseButton: UIButton!


   //backroundview
    @IBOutlet weak var detailViewBackround: UIView! {
           didSet {
               detailViewBackround.layer.masksToBounds = true
               detailViewBackround.addRoundedBorder(withColor: .lightGray, borderWidth: 1, cornerRadius: 10)
           }
       }
    //show sidepannel in cell
    @IBOutlet weak var detailTableView: DetailsTableView!
    
    
    @IBAction func onCloseBtnPress(_ sender: UIButton) {
        closeSidePanel()
    }
    
    
    // MARK: - num/100Count Status Label
    
    @IBOutlet weak var apiStatusLabel: UILabel!{
        didSet{
            apiStatusLabel.text = "\(viewModel.photoCount)/100 Chosen"
        }
    }

    // MARK: -Variable Dec

    var viewModel = MainViewModel()
    var tapGesture: UITapGestureRecognizer?
    
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        detailViewConstrain.constant = 0
        photoCollectionView.loadCollectionView(inController: self)
        detailTableView.loadTableView(inController: self)
        
        viewModel.makeAPICall(for: viewModel.photoCount) { [weak self] result in
            self?.updateUI(with: result)
        }
    }
    

    
   // MARK: -handle Tap methods
        //outside
    @objc func handleTapOutsideSidePanel() {
        if viewModel.isSidePanelOpen {
            closeSidePanel()
        }
    }
    


    @objc func onForwardPress() {
        viewModel.photoCount += 1
        viewModel.makeAPICall(for: viewModel.photoCount) { [weak self] result in
            self?.updateUI(with: result)
        }
        showToast(message: "\(viewModel.photoCount)/100 Chosen")
        apiStatusLabel.text = "\(viewModel.photoCount)/100 Chosen"
        
    }

    @objc func onBackwordPress() {
        viewModel.photoCount -= 1
        viewModel.makeAPICall(for: viewModel.photoCount) { [weak self] result in
            self?.updateUI(with: result)
        }
        showToast(message: "\(viewModel.photoCount)/100 Chosen")
        apiStatusLabel.text = "\(viewModel.photoCount)/100 Chosen"
    }

    
    // MARK: - API Data Loading

    func updateUI(with result: Result<[PhotoModel], Error>) {
        switch result {
        case .success(let photodata):
            photoCollectionView.photoModel = photodata
            photoCollectionView.reloadData()
        case .failure(let error):
            print(error.localizedDescription)
            showToast(message: error.localizedDescription)
        }
    }
    
    
    
    // MARK: -Open SidePannel
    func openSidePanel(for index: IndexPath) {
        if !viewModel.isSidePanelOpen {
            UIView.animate(withDuration: 0.3) {
                self.detailViewConstrain.constant = 240
                self.view.layoutIfNeeded()
            }
            viewModel.isSidePanelOpen = true

            tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapOutsideSidePanel))
            view.addGestureRecognizer(tapGesture!)
        }

        detailTableView.setupDetailCellwith(data: viewModel.photoModel!, index: index)
    }
    
    // MARK: -Close Side Panel
    func closeSidePanel() {
        viewModel.isSidePanelOpen = false
        UIView.animate(withDuration: 0.3) {
            self.detailViewConstrain.constant = 0
            self.view.layoutIfNeeded()
        }

        if let tapGesture = tapGesture {
            view.removeGestureRecognizer(tapGesture)
            self.tapGesture = nil
        }
    }
}
