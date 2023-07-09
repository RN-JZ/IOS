
import Foundation
import UIKit


class UploadPostControllers:UIViewController
{
    // MARK: - PROPERTIES
    var selectedImage:UIImage?
    {
        didSet
        {
            PhotoImageView.image = selectedImage
        }
    }
    private let PhotoImageView:UIImageView =
    {
        let iv = UIImageView()
        iv.image  = UIImage(named: "venom-7")
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private lazy var captionTextView:InputTextView =
    {
        let tv = InputTextView()
        tv.PlaceHolderText = "Enter Label ..."
        tv.font = UIFont.systemFont(ofSize: 16)
        tv.delegate = self
        return tv
    }()
    
    private let characterCountLabel:UILabel =
    {
        let tv = UILabel()
        tv.textColor = .lightGray
        tv.font = UIFont.systemFont(ofSize: 14)
        tv.text = "0/100"
        return tv
    }()
    
    // MARK: - LIFE-CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureUI()
        style()
        layout()
       
        
    }
    
    // MARK: - ACTION
    @objc func didTabCancel()
    {
          self.dismiss(animated: true , completion: nil)
    }
    @objc func didTabDone()
    {
        guard let image = selectedImage else {return}
        guard let caption = captionTextView.text else {return}
        
        PostService.uploadPost(caption: caption, image: image) { error in
            if let error = error
            {
                print("FAILD TO UPLOAD POST \(error.localizedDescription)")
                return
            }
            self.dismiss(animated: true, completion: nil)
            print("DEBUG I AM PRINTED")
            NotificationCenter.default.post(name: Notification.Name("SendData"), object: nil)
        }
    }
    
    
    // MARK: - HELPERS
    func checkMaxLength(_ textView:UITextView)
    {
        if(textView.text.count) > 100
        {
            textView.deleteBackward()
        }
        
    }
    func configureUI()
    {
        navigationItem.title = "Upload Post"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel , target: self, action: #selector(didTabCancel))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .done, target: self, action: #selector(didTabDone))
    }
    
    func style()
    {
        PhotoImageView.translatesAutoresizingMaskIntoConstraints = true
        view.addSubview(PhotoImageView)
        captionTextView.translatesAutoresizingMaskIntoConstraints = true
        view.addSubview(captionTextView)
        characterCountLabel.translatesAutoresizingMaskIntoConstraints = true
        view.addSubview(characterCountLabel)
        
        
    }
    func layout()
    {
        
        PhotoImageView.setDimensions(height: 180, width: 180)
        PhotoImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor , paddingTop: 8)
        PhotoImageView.centerX(inView: view)
        PhotoImageView.layer.cornerRadius = 10
        
        captionTextView.anchor(top: PhotoImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop:16, paddingLeft: 12, paddingRight: 12, height: 64)
        
        characterCountLabel.anchor(bottom: captionTextView.bottomAnchor , right: view.rightAnchor, paddingRight: 12)
    }
    
    
}
extension UploadPostControllers:UITextViewDelegate
{
    func textViewDidChange(_ textView: UITextView) {
        checkMaxLength(textView)
        let count = textView.text.count
        characterCountLabel.text = "\(count) /100"
    }
}

