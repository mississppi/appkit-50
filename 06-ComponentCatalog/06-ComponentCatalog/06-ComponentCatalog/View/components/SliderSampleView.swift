import Cocoa

class SliderSampleView: NSView {
    private let sliderValueLabel = NSTextField(labelWithString: "値: 50")
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    private func setup() {
        let slider = NSSlider(value: 50, minValue: 0, maxValue: 100, target: self, action: #selector(sliderValueChanged(_:)))

        slider.translatesAutoresizingMaskIntoConstraints = false
        
        sliderValueLabel.font = .systemFont(ofSize: 14)
        sliderValueLabel.translatesAutoresizingMaskIntoConstraints = false

        addSubview(slider)
        addSubview(sliderValueLabel)

        NSLayoutConstraint.activate([
            slider.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            slider.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            slider.widthAnchor.constraint(equalToConstant: 200),

            sliderValueLabel.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 12),
            sliderValueLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    @objc private func sliderValueChanged(_ sender: NSSlider) {
        let value = Int(sender.doubleValue)
        sliderValueLabel.stringValue = "値: \(value)"
    }
}
