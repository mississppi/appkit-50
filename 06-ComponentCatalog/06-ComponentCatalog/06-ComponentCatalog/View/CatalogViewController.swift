import Cocoa

class CatalogViewController: NSViewController {
    private let componentList = ["Button", "Label", "TextField", "ImageView", "Slider"]
    private var presenter: CatalogPresenter!
    
    private let listView = NSStackView()
    private let contentView = NSView()
    
    override func loadView() {
        self.view = NSView()
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.windowBackgroundColor.cgColor
        
        setupLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CatalogPresenter(viewController: self)
        setupList()
    }
    
    private func setupLayout() {
        let mainStack = NSStackView()
        mainStack.orientation = .horizontal
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.spacing = 16
        mainStack.edgeInsets = NSEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)

        listView.orientation = .vertical
        listView.spacing = 8
        listView.translatesAutoresizingMaskIntoConstraints = false

        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.wantsLayer = true
        contentView.layer?.backgroundColor = NSColor.lightGray.cgColor

        mainStack.addArrangedSubview(listView)
        mainStack.addArrangedSubview(contentView)

        view.addSubview(mainStack)

        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.topAnchor),
            mainStack.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            listView.widthAnchor.constraint(equalToConstant: 120),
        ])
    }
    
    private func setupList() {
        for name in componentList {
            let button = NSButton(title: name, target: self, action: #selector(componentSelected(_:)))
            button.bezelStyle = .rounded
            button.setButtonType(.momentaryPushIn)
            listView.addArrangedSubview(button)
        }
    }
    
    @objc private func componentSelected(_ sender: NSButton) {
        presenter.didSelectComponent(name: sender.title)
    }
    
    func displayComponentView(_ view: NSView) {
        contentView.subviews.forEach {$0.removeFromSuperview()}
        view.frame = contentView.bounds
        view.autoresizingMask = [.width, .height]
        contentView.addSubview(view)
    }
}
