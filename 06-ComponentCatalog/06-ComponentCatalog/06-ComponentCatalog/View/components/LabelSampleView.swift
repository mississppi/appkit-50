import Cocoa

class LabelSampleView: NSView {
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        let label = NSTextField(labelWithString: "これはラベルです")
        label.alignment = .center
        label.font = NSFont.systemFont(ofSize: 18)
        label.textColor = .labelColor
        label.translatesAutoresizingMaskIntoConstraints = false

        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
