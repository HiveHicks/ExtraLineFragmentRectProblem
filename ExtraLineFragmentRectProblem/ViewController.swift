import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTextView()
    }

    private func createTextView() {
        
        let textStorage = NSTextStorage()

        let layoutManager = CustomLayoutManager()

        let container = NSTextContainer()
        container.widthTracksTextView = true
        container.heightTracksTextView = true

        layoutManager.addTextContainer(container)
        textStorage.addLayoutManager(layoutManager)

        let textView = UITextView(frame: .zero, textContainer: container)
        textView.backgroundColor = .lightGray
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 11, bottom: 12, right: 13)
        textView.font = UIFont.systemFont(ofSize: 17)

        view.addSubview(textView)

        textView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
        ])

        textView.allowsEditingTextAttributes = true
        textView.becomeFirstResponder()
    }
}

