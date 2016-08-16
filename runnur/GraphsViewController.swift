//
//  GraphsViewController.swift
//  runnur
//
//  Created by Archana Vetkar on 16/08/16.
//  Copyright © 2016 Sonali. All rights reserved.
//

import UIKit
import Charts

class GraphsViewController: UIViewController {

    @IBOutlet weak var speedCharts: LineChartView!
    @IBOutlet weak var maxElevatinoChart: LineChartView!
    @IBOutlet weak var heartRateChart: LineChartView!
    
    
    var dataPoints = [String]()
    


    func setChart(valuesForSpeed: [Double],valuesForMaxElevation:[Double],valuesForHeartRate:[Double]) {
     //   barChartView.noDataText = "You need to provide data for the chart."
        
      
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<valuesForSpeed.count {
            let dataEntry = ChartDataEntry(value: valuesForSpeed[i], xIndex: i)
            dataEntries.append(dataEntry)
            dataPoints.append("");
        }
        
        let lineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "SPEED")
        let lineChartData = LineChartData(xVals: dataPoints, dataSet: lineChartDataSet)
        lineChartDataSet.circleColors = [colorCode.BlueColor];
        lineChartDataSet.circleRadius = 0.0;
        lineChartDataSet.lineWidth = 2;
        lineChartDataSet.drawCubicEnabled = true;
        lineChartDataSet.drawFilledEnabled = true;
        lineChartDataSet.colors = [colorCode.BlueColor]

        lineChartDataSet.drawCirclesEnabled = false
        //remove xAxis line
        speedCharts.xAxis.drawGridLinesEnabled = false
        speedCharts.xAxis.drawAxisLineEnabled = false

        
        speedCharts.data = lineChartData
        speedCharts.leftAxis.labelTextColor = colorCode.BlueColor;
        speedCharts.xAxis.labelTextColor = colorCode.BlueColor;
        speedCharts.rightAxis.labelTextColor = UIColor.clearColor();
        
        let ll = ChartLimitLine(limit: 10.5, label: "Avg Speed")
        speedCharts.rightAxis.addLimitLine(ll)
        speedCharts.noDataText = "No Avg Speed Data Available"
        
        
        for i in 0..<valuesForMaxElevation.count {
            let dataEntry = ChartDataEntry(value: valuesForMaxElevation[i], xIndex: i)
            dataEntries.append(dataEntry)
            dataPoints.append("");
        }
        let lineChartDataSet2 = LineChartDataSet(yVals: dataEntries, label: "ELEVATION")
        let lineChartData2 = LineChartData(xVals: dataPoints, dataSet: lineChartDataSet2)
        lineChartDataSet2.circleColors = [colorCode.RedColor];
        lineChartDataSet2.circleRadius = 0.0;
        lineChartDataSet2.lineWidth = 2;
        lineChartDataSet2.fillColor = UIColor.orangeColor();
        lineChartDataSet2.drawCubicEnabled = true;
        lineChartDataSet2.drawFilledEnabled = true;
        lineChartDataSet2.colors = [colorCode.RedColor]
        
        lineChartDataSet2.drawCirclesEnabled = false
        //remove xAxis line
        maxElevatinoChart.xAxis.drawGridLinesEnabled = false
        maxElevatinoChart.xAxis.drawAxisLineEnabled = false
        
        maxElevatinoChart.data = lineChartData2
        maxElevatinoChart.leftAxis.labelTextColor = colorCode.RedColor;
        maxElevatinoChart.xAxis.labelTextColor = colorCode.RedColor;
        maxElevatinoChart.rightAxis.labelTextColor = UIColor.clearColor();


        
        
        maxElevatinoChart.noDataText = "No Max Elevation Data Available"
        
        
        for i in 0..<valuesForHeartRate.count {
            let dataEntry = ChartDataEntry(value: valuesForHeartRate[i], xIndex: i)
            dataEntries.append(dataEntry)
            dataPoints.append("");
        }
        let lineChartDataSet3 = LineChartDataSet(yVals: dataEntries, label: "ELEVATION")
        let lineChartData3 = LineChartData(xVals: dataPoints, dataSet: lineChartDataSet3)
        lineChartDataSet3.circleColors = [colorCode.RedColor];
        lineChartDataSet3.circleRadius = 0.0;
        lineChartDataSet3.lineWidth = 2;
        lineChartDataSet3.fillColor = UIColor.orangeColor();
        lineChartDataSet3.drawCubicEnabled = true;
        lineChartDataSet3.drawFilledEnabled = true;
        lineChartDataSet3.colors = [colorCode.RedColor]
        
        lineChartDataSet3.drawCirclesEnabled = false
        //remove xAxis line
        maxElevatinoChart.xAxis.drawGridLinesEnabled = false
        maxElevatinoChart.xAxis.drawAxisLineEnabled = false
        
        maxElevatinoChart.data = lineChartData3
        maxElevatinoChart.leftAxis.labelTextColor = colorCode.RedColor;
        maxElevatinoChart.xAxis.labelTextColor = colorCode.RedColor;
        maxElevatinoChart.rightAxis.labelTextColor = UIColor.clearColor();
        

        heartRateChart.noDataText = "No Heart Rate Data Available"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

         let unitsSold = [10.0,10.2,10,8,11.0,12.1,12.6,12.8,13.9,20.5,20.9,25,4,28,9,30.0,30.1,30.50,10.5,10.5,10.5,10.5,10.0];
        
        
       
        setChart(unitsSold, valuesForMaxElevation: unitsSold, valuesForHeartRate: [0.0])
        
             // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
