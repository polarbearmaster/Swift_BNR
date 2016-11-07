//: Playground - noun: a place where people can play

import Cocoa

protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func labelForRow(row: Int) -> String
    func labelForColumn(column: Int) -> String
    func itemForRow(row: Int, column: Int) -> Int
}

func padding(amount: Int) -> String {
    var paddingString = ""
    for _ in 0 ..< amount {
        paddingString += " "
    }
    return paddingString
}

func printTable(dataSource: protocol<TabularDataSource, CustomStringConvertible>) {
    print("Table: \(dataSource.description)")
    let rowLabels = (0 ..< dataSource.numberOfRows).map { dataSource.labelForRow($0) }
    //print("rowLabels: \(rowLabels)")
    let columnLabels = (0 ..< dataSource.numberOfColumns).map {
        dataSource.labelForColumn($0)
    }
    //print("columnLabels: \(columnLabels)")
    
    var ageLabels = (0 ..< dataSource.numberOfRows).map {
        "\(dataSource.itemForRow($0, column: 0))"
    }
    ageLabels.append(dataSource.labelForColumn(0))
    //print("ageLabels: \(ageLabels)")
    
    guard let maxAgeLabelWidth = ageLabels.maxElement({$1.characters.count > $0.characters.count}) else {
        return
    }
    //print(maxAgeLabelWidth)
    
    //Create an array of the width of each row label
    let rowLabelWidths = rowLabels.map{ $0.characters.count }
    
    //Determine length of longest row label
    guard let maxRowLabelWidth = rowLabelWidths.maxElement() else {
        return
    }
    
    //Create first row containing column headers
    var firstRow: String = padding(maxRowLabelWidth) + " |"
    
    var columnWidths = [Int]()
    
    for (i,columnLabel) in columnLabels.enumerate() {
        var columnHeader = ""
        if i==0 {
            let itemString = "\(columnLabel) |"
            let paddingAmount = maxAgeLabelWidth.characters.count - columnLabel.characters.count
            columnHeader += padding(paddingAmount) + itemString
        } else {
            columnHeader = "\(columnLabel) |"
        }
        //let columnHeader = "\(columnLabel) |"
        firstRow += columnHeader
        columnWidths.append(columnHeader.characters.count)
    }
//    print(columnWidths)
//    print("\n")
    print(firstRow)
    
    for i in 0 ..< dataSource.numberOfRows {
        // Pad the tow label out so they are all the same length
        let paddingAmount = maxRowLabelWidth - rowLabelWidths[i]
        var out = rowLabels[i] + padding(paddingAmount) + " |"
        
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemForRow(i, column: j)
            let itemString = "\(item) |"
            let paddingAmount = columnWidths[j] - itemString.characters.count
            out += padding(paddingAmount) + itemString
        }
        print(out)
    }
}

struct Person {
    let name: String
    let age : Int
    let yearsOfExperience: Int
}

struct Department: TabularDataSource, CustomStringConvertible {
    let name: String
    var people = [Person]()
    
    var description: String {
        return "Department (\(name))"
    }
    
    init(name: String) {
        self.name = name
    }
    
    mutating func addPerson(person: Person) {
        people.append(person)
    }
    
    var numberOfRows: Int {
        return people.count
    }
    
    var numberOfColumns: Int {
        return 2
    }
    
    func labelForRow(row: Int) -> String {
        return people[row].name
    }
    
    func labelForColumn(column: Int) -> String {
        switch column {
        case 0:
            return "Age"
        case 1:
            return "Years of Experience"
        default:
            fatalError("Invalud column!")
        }
    }
    
    func itemForRow(row: Int, column: Int) -> Int {
        let person = people[row]
        switch column {
        case 0:
            return person.age
        case 1:
            return person.yearsOfExperience
        default:
            fatalError("Invalid column!")
        }
    }
}

var department = Department(name: "Engineering")
department.addPerson(Person(name: "Joe", age: 10000, yearsOfExperience: 6))
department.addPerson(Person(name: "Karen", age: 40, yearsOfExperience: 18))
department.addPerson(Person(name: "Fred", age: 50, yearsOfExperience: 20))

printTable(department)

