import Cocoa

class ButtonSampleView: NSView {
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        let button = NSButton(title: "Click ME", target: self, action: #selector(buttonClicked))
        button.bezelStyle = .rounded
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    @objc private func buttonClicked() {
        print("Button was clicked!")
    }
}
