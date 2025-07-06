import Cocoa

class ClickCounterViewController: NSViewController {
    private let countLabel = NSTextField(labelWithString: "")
    private let countButton = NSButton(title: "カウントアップ", target: nil, action: nil)
    private let presenter = ClickCounterPresenter()
    
    override func loadView() {
        self.view = NSView()
        self.view.frame.size = NSSize(width: 400, height: 300)
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.black.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabel()
        setupButton()
        layoutUI()
        
        updateCountLabel()
    }
    
    private func setupLabel() {
        countLabel.font = NSFont.systemFont(ofSize: 24)
        countLabel.textColor = NSColor.white
        countLabel.alignment = .center
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(countLabel)
    }
    
    private func setupButton() {
        countButton.bezelStyle = .rounded
        countButton.translatesAutoresizingMaskIntoConstraints = false
        countButton.target = self
        countButton.action = #selector(didTapCountButton)
        
        let titleAttr = NSAttributedString(
            string: "カウントアップ",
            attributes: [.foregroundColor: NSColor.white]
        )
        countButton.attributedTitle = titleAttr
        view.addSubview(countButton)
    }
    
    private func layoutUI() {
        NSLayoutConstraint.activate([
            countLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30),
            
            countButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countButton.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 20)
        ])
    }
    
    @objc private func didTapCountButton() {
        presenter.increment()
        updateCountLabel()
    }
    
    private func updateCountLabel() {
        countLabel.stringValue = presenter.countText
    }
}
