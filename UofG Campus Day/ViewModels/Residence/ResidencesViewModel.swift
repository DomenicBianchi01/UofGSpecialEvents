//
//  ResidencesViewModel.swift
//  UofG Campus Day
//
//  Created by Domenic Bianchi on 2018-11-20.
//  Copyright © 2018 Domenic Bianchi. All rights reserved.
//

import UIKit

final class ResidencesViewModel {
    // MARK: - Properties
    private(set) var residenceInfo: Residences? = nil
    
    // MARK: - Lifecycle Function
    init() {
        do {
            residenceInfo = try JSONService.getData(from: "residences", type: Residences.self)
        } catch {
            print(error)
        }
    }
}

// MARK: - TableViewModelable
extension ResidencesViewModel: TableViewModelable {
    var numberOfSections: Int {
        return 3
    }
    
    func numberOfRows(in section: Int) -> Int {
        guard let residenceInfo = residenceInfo else {
            return 0
        }
        
        if section == 0 {
            return residenceInfo.residences.filter({ $0.location == .south }).count
        } else if section == 1 {
            return residenceInfo.residences.filter({ $0.location == .north }).count
        } else {
            return residenceInfo.residences.filter({ $0.location == .east }).count
        }
    }
    
    func titleForHeader(in section: Int) -> String? {
        if section == 0 {
            return "South Residences"
        } else if section == 1 {
            return "North Residences"
        } else {
            return "East Residences"
        }
    }
    
    func titleForFooter(in section: Int) -> String? {
        if section == 2, let residenceInfo = residenceInfo {
            return residenceInfo.traditionalDefinition + "\n\n" + residenceInfo.suiteDefinition + "\n\n" + residenceInfo.apartmentDefinition
        }
        return nil
    }
    
    func cellForRow(in tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "residenceReuseIdentifier", for: indexPath)
        
        if var cell = cell as? ResidenceViewModelable, let residenceInfo = residenceInfo {
            
            if indexPath.section == 0 {
                cell.viewModel = ResidenceViewModel(residence: residenceInfo.residences[indexPath.row])
            } else if indexPath.section == 1 {
                cell.viewModel = ResidenceViewModel(residence: residenceInfo.residences[indexPath.row + numberOfRows(in: 0)])
            } else if indexPath.section == 2 {
                cell.viewModel = ResidenceViewModel(residence: residenceInfo.residences[indexPath.row + numberOfRows(in: 0) + numberOfRows(in: 1)])
            }
        }
        
        return cell
    }

    // MARK: SwiftUI

    func residenceName(for location: Residence.ResidenceLocation) -> String {
        switch location {
        case .south:
            return "South Residences"
        case .north:
            return "North Residences"
        case .east:
            return "East Residences"
        default:
            return ""
        }
    }

    func sectionFooter(for location: Residence.ResidenceLocation) -> String {
        if location == .east, let residenceInfo = residenceInfo {
            return residenceInfo.traditionalDefinition + "\n\n" + residenceInfo.suiteDefinition + "\n\n" + residenceInfo.apartmentDefinition
        }

        return ""
    }


    func residences(in location: Residence.ResidenceLocation) -> [Residence] {
        return residenceInfo?.residences.filter { $0.location == location } ?? []
    }
}
