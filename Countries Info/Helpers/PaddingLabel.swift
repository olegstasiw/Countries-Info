//
//  PaddingLabel.swift
//  Countries Info
//
//  Created by Oleh Stasiv on 11.12.2020.
//

import UIKit

class PaddingLabel: UILabel {

    var edge: UIEdgeInsets

    required init(_ edge: UIEdgeInsets) {
        self.edge = edge
        super.init(frame: CGRect.zero)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: edge.top, left: edge.left, bottom: edge.bottom, right: edge.right)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += edge.top + edge.bottom
            contentSize.width += edge.left + edge.right
            return contentSize
        }
    }
}
