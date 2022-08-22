//
// UIViewController+Extension.swift
// NewsFeed

//  Created by Emmanuel Omokagbo on 21/08/2022
//  Copyright © 2022 Emmanuel Omokagbo. All rights reserved.


import UIKit

extension UIViewController {
    func showAlert(title: String, message: String, type: LogType, action: NoParamHandler?) {
        var title = title
        switch type {
        case .success:
            title = "🟢🟢🟢   " + title + "   🟢🟢🟢"
        case .error:
            title = "🛑🛑🛑   " + title + "   🛑🛑🛑"
        case .info:
            title = "🟡🟡🟡   " + title + "   🟡🟡🟡"
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in action?() }))
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.present(alert, animated: true)
        }
    }
}
