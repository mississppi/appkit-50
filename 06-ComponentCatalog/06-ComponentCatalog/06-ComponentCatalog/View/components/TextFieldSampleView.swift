import Cocoa

class TextFieldSampleView: NSView {
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        let textField = NSTextField()
        textField.placeholderString = "ここに入力してください"
        textField.font = NSFont.systemFont(ofSize: 16)
        textField.translatesAutoresizingMaskIntoConstraints = false

        addSubview(textField)

        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            textField.widthAnchor.constraint(equalToConstant: 240)
        ])
    }
}
