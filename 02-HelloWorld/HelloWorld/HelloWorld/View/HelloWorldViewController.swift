import Cocoa

class HelloWorldViewController: NSViewController {
    private let label = NSTextField(labelWithString: "")
    private let presenter = HelloWorldPresenter()
    
    override func loadView() {
        self.view = NSView()
        self.view.frame.size = NSSize(width: 400, height: 300)
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.green.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.stringValue = presenter.textToDisplay
        label.font = NSFont.systemFont(ofSize: 24)
        label.alignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
