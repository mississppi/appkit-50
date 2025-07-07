import Cocoa

extension LanguageInfoViewController {
    func setupPopUpButton() {
        popupButton.addItems(withTitles: presenter.availableLanguages)
        popupButton.target = self
        popupButton.action = #selector(languageSelected(_:))
        popupButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(popupButton)
    }
    
    func setupDescriptionLabel() {
        descriptionLabel.font = .systemFont(ofSize: 14)
        descriptionLabel.textColor = .black
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
    }
    
    func layoutUI() {
        NSLayoutConstraint.activate([
            popupButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            popupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: popupButton.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
}
