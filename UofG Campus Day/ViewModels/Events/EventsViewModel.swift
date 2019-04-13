//
//  EventsViewModel.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2018-11-18.
//  Copyright © 2018 Domenic Bianchi. All rights reserved.
//

import UIKit

class EventsViewModel {
    // MARK: - Properties
    private(set) var events: [Event] = []
    private var savedEvents: [Int] = []
    
    func decodeEvents() {
        do {
            events = try JSONService.getData(from: "events", type: Events.self).events
            refreshStarredEvents()
        } catch {
            print(error)
        }
    }
    
    func refreshStarredEvents() {
        guard let savedEvents = UserDefaults.standard.array(forKey: "savedEvents") as? [Int] else {
            return
        }
        
        self.savedEvents = savedEvents.sorted()
    }
    
    func getEvent(in section: Int, at row: Int) -> Event? {
        if numberOfSections == 2 && section == 0 {
            return events.first(where: { $0.id == savedEvents[row] }) ?? nil
        } else {
            return events[row]
        }
    }
}

extension EventsViewModel: TableViewModelable {
    var numberOfSections: Int {
        return savedEvents.count == 0 ? 1 : 2
    }
    
    func numberOfRows(in section: Int) -> Int {
        if savedEvents.count == 0 {
            return events.count
        } else {
            if section == 0 {
                return savedEvents.count
            }
            return events.count
        }
    }
    
    func cellForRow(in tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventReuseIdentifier", for: indexPath)
        
        if var cell = cell as? EventViewModelable {
            if savedEvents.count == 0 {
                cell.viewModel = EventViewModel(event: events[indexPath.row])
            } else {
                if indexPath.section == 0 {
                    cell.viewModel = EventViewModel(event: events[savedEvents[indexPath.row] - 1])
                } else {
                    cell.viewModel = EventViewModel(event: events[indexPath.row])
                }
            }
        }
        
        return cell
    }
    
    func titleForHeader(in section: Int) -> String? {
        if numberOfSections == 1 {
            return "Upcoming Events"
        } else {
            if section == 0 {
                return "Your Events"
            } else {
                return "Upcoming Events"
            }
        }
    }
}
