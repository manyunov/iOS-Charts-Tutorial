//
//  ViewController.swift
//  Charts-Tutorial
//
//  Created by Abhimanyu Das on 7/22/21.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    @IBOutlet weak var LineChartBox: LineChartView!
    
    @IBOutlet weak var PieChartBox: PieChartView!
    
    @IBOutlet weak var BarChartBox: BarChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // let data = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3]
        let country = ["China", "Japan", "USA", "South Korea", "ROC", "Italy"]
        let medals = [6, 5, 4, 2, 1, 1]
        //  graphLineChart(dataArray: data)
        graphPieChart(country: country, medals: medals)
        //  graphBarChart(dataArray: data)
    }
    
    func graphLineChart(dataArray: [Int]){
        //define LineChartBox frame origin (screen top left) and dimensions
        LineChartBox.frame = CGRect(x: 0, y: 0,
                                    width: self.view.frame.size.width,
                                    height: self.view.frame.size.width/2)
        
        //center the LineChartBox horizontally and 240 points away from the origin (up)
        LineChartBox.center.x = self.view.center.x
        LineChartBox.center.y = self.view.center.y - 240
        
        //settings when chart has no data
        LineChartBox.noDataText = "No data available"
        LineChartBox.noDataTextColor = UIColor.black
        
        //Initialilze array that will be eventually displayed on the graph
        var entries = [ChartDataEntry]()
        
        //for every element in given dataset, set the X and Y coordinates in a Chart Data entry and append to the list
        for i in 0...dataArray.count-1 {
            let value = ChartDataEntry(x: Double(i), y: Double(dataArray[i]))
            entries.append(value)
        }
        
        //use the entries object and a label string to make a LineChartDataSet object
        let dataSet = LineChartDataSet(entries: entries, label: "Line Chart")
        
        //customize the graph color settings
        dataSet.colors = ChartColorTemplates.colorful()
        
        //make object that will be added to the chart and set it to variable in the storyboard
        let data =  LineChartData(dataSet: dataSet)
        LineChartBox.data = data
        
        //add settings for the ChartBox
        LineChartBox.chartDescription?.text = "Pi values"
        
        //Animations
        LineChartBox.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .linear)
    }
    
    
    func graphPieChart(country: [String], medals: [Int]){
        //define LineChartBox frame origin (screen top left) and dimensions
        PieChartBox.frame = CGRect(x: 0, y: 0,
                                    width: self.view.frame.size.width,
                                    height: self.view.frame.size.width )
        
        //center the LineChartBox horizontally and 240 points away from the origin (up)
        PieChartBox.center.x = self.view.center.x
        PieChartBox.center.y = self.view.center.y
        
        //settings when chart has no data
        PieChartBox.noDataText = "No data available"
        PieChartBox.noDataTextColor = UIColor.black
        
        //Initialilze array that will be eventually displayed on the graph
        var entries = [ChartDataEntry]()
        
        //for every element in given dataset, set the X and Y coordinates in a Chart Data entry and append to the list
        
        for i in 0...country.count-1 {
            let value = PieChartDataEntry(value: Double(medals[i]), label: String(country[i]))
            entries.append(value)
        }
        
        //use the entries object and a label string to make a LineChartDataSet object
//        let dataSet = PieChartDataSet(entries: entries, label: "Pie Chart")
        let dataSet = PieChartDataSet(entries: entries)
        
        //customize the graph color settings
        dataSet.colors = ChartColorTemplates.colorful()
        
        //make object that will be added to the chart and set it to variable in the storyboard
        let data = PieChartData(dataSet: dataSet)
        PieChartBox.data = data
        
        //add settings for the ChartBox
        PieChartBox.chartDescription?.text = "Olympics 2021 medal count"
        
        //Animations
        PieChartBox.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .linear)
    }
    
    func graphBarChart(dataArray: [Int]){
        //define LineChartBox frame origin (screen top left) and dimensions
        BarChartBox.frame = CGRect(x: 0, y: 0,
                                    width: self.view.frame.size.width,
                                    height: self.view.frame.size.width/2 )
        
        //center the LineChartBox horizontally and 240 points away from the origin (up)
        BarChartBox.center.x = self.view.center.x
        BarChartBox.center.y = self.view.center.y + 240
        
        //settings when chart has no data
        BarChartBox.noDataText = "No data available"
        BarChartBox.noDataTextColor = UIColor.black
        
        //Initialilze array that will be eventually displayed on the graph
        var entries = [BarChartDataEntry]()
        
        //for every element in given dataset, set the X and Y coordinates in a Chart Data entry and append to the list
        
        for i in 0...dataArray.count - 1{
            let value = BarChartDataEntry(x: Double(i), y: Double(dataArray[i]))
            entries.append(value)
        }
        
        //use the entries object and a label string to make a LineChartDataSet object
        let dataSet = BarChartDataSet(entries: entries, label: "Bar Chart")
        
        //customize the graph color settings
        dataSet.colors = ChartColorTemplates.joyful()
        
        //make object that will be added to the chart and set it to variable in the storyboard
        let data =  BarChartData(dataSet: dataSet)
        BarChartBox.data = data
        
        //add settings for the ChartBox
        BarChartBox.chartDescription?.text = "Pi values"
        
        //Animations
        BarChartBox.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .linear)
    }
}
