//
//  EventInfoViewModel.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2018-11-18.
//  Copyright © 2018 Domenic Bianchi. All rights reserved.
//

import UIKit

class EventInfoViewModel {
    // MARK: - Properties
    var event: Event? = nil
    var isStarred: Bool = false
    
    // MARK: - Functions
    func eventStarred() {
        guard let event = event else {
            return
        }
        
        var savedEvents = UserDefaults.standard.array(forKey: "savedEvents") as? [Int] ?? []
        
        if savedEvents.contains(event.id) {
            savedEvents.removeAll(where: { $0 == event.id })
            isStarred = false
        } else {
            savedEvents.append(event.id)
            isStarred = true
        }
        
        UserDefaults.standard.set(savedEvents, forKey: "savedEvents")
    }
    
    func initStarred() {
        guard let event = event, let savedEvents = UserDefaults.standard.array(forKey: "savedEvents") as? [Int] else {
            return
        }
        
        isStarred = savedEvents.contains(event.id)
    }
}

extension EventInfoViewModel: TableViewModelable {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return 3
    }
    
    func cellForRow(in tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier: String
        if indexPath.row == 0 {
            reuseIdentifier = "eventTitleReuseIdentifier"
        } else if indexPath.row == 1 {
            reuseIdentifier =  "eventDescriptionReuseIdentifier"
        } else {
            reuseIdentifier =  "eventMapReuseIdentifier"
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
        if var cell = cell as? EventViewModelable, let event = event {
            cell.viewModel = EventViewModel(event: event)
        }
        
        return cell
    }
}
