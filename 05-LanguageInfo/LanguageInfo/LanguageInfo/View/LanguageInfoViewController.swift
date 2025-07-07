import Cocoa

class LanguageInfoViewController: NSViewController {
    let popupButton = NSPopUpButton()
    let descriptionLabel = NSTextField(labelWithString: "")
    let presenter = LanguageInfoPresenter()
    
    override func loadView() {
        self.view = NSView()
        self.view.setFrameSize(NSSize(width: 400, height: 200))
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = NSColor.white.cgColor
        
        setupPopUpButton()
        setupDescriptionLabel()
        layoutUI()
    }
    
    @objc func languageSelected(_ sender: NSPopUpButton) {
        let selectedLanguage = sender.titleOfSelectedItem ?? ""
        let feature = presenter.getFeature(for: selectedLanguage)
        descriptionLabel.stringValue = feature
    }
}
