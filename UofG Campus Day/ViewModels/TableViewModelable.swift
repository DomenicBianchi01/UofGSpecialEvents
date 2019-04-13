//
//  TableViewModelable.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2018-11-18.
//  Copyright © 2018 Domenic Bianchi. All rights reserved.
//

import Foundation
import UIKit

protocol TableViewModelable {
    var numberOfSections: Int { get }
    func numberOfRows(in section: Int) -> Int
    func cellForRow(in tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell
    func titleForHeader(in section: Int) -> String?
    func titleForFooter(in section: Int) -> String?
    func heightForHeader(in section: Int) -> CGFloat
}

extension TableViewModelable {
    func titleForHeader(in section: Int) -> String? {
        return nil
    }
    
    func titleForFooter(in section: Int) -> String? {
        return nil
    }
    
    func heightForHeader(in section: Int) -> CGFloat {
        return 30
    }
}
