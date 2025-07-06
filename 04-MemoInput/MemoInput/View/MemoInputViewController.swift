import Cocoa

class MemoInputViewController: NSViewController {
    private let presenter = MemoInputPresenter()
    
    private let inputField = NSTextField()
    private let addButton = NSButton()
    private let stackView = NSStackView()
    
    override func loadView() {
        self.view = NSView()
        self.view.frame.size = NSSize(width: 400, height: 300)
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.black.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInputField()
        setupAddButton()
        setupStackView()
        layoutUI()
    }
    
    private func layoutUI() {
        NSLayoutConstraint.activate([
            inputField.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            inputField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            inputField.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -10),
            inputField.heightAnchor.constraint(equalToConstant: 28),
            
            addButton.centerYAnchor.constraint(equalTo: inputField.centerYAnchor),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            stackView.topAnchor.constraint(equalTo: inputField.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    private func setupInputField() {
        inputField.placeholderString = "メモを入力"
        inputField.textColor = .white
        inputField.backgroundColor = .darkGray
        inputField.isBordered = false
        inputField.focusRingType = .none
        inputField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(inputField)
    }
    
    private func setupAddButton() {
        addButton.title = "追加"
        addButton.bezelStyle = .rounded
        addButton.target = self
        addButton.action = #selector(addButtonTapped)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addButton)
    }
    
    private func setupStackView() {
        stackView.orientation = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
    }
    
    @objc private func addButtonTapped() {
        let text = inputField.stringValue.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty else { return }
        
        presenter.addMemo(text: text)
        inputField.stringValue = ""
        reloadMemos()
    }
    
    private func reloadMemos() {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for memo in presenter.memos {
            let label = NSTextField(labelWithString: memo)
            label.textColor = .white
            label.font = .systemFont(ofSize: 16)
            stackView.addArrangedSubview(label)
        }
    }
}
