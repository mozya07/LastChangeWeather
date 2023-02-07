//
//  WeatherSheetView.swift
//  OneCallOpenWeather
//
//  Created by cmStudent on 2023/01/17.
//

import SwiftUI
import CoreLocation

struct WeatherSheetView: View {
        
    @ObservedObject var weatherSheetViewModel = WeatherSheetViewModel.sharedsheet
    
    let dateFormatter = DateFormatter()
    init() {
        //dateFormatter.dateFormat = "E MMM d" + "日"
        dateFormatter.dateFormat = "MMMd日（E）"
    }
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ZStack {
            
            Image("sora")
                .resizable()
                           .aspectRatio(contentMode: .fill)
                           .edgesIgnoringSafeArea(.all)
            
        
            VStack {
                Text("\(weatherSheetViewModel.selectPlaceName)")
                    .foregroundColor(Color.white)
                if let forecast = weatherSheetViewModel.eightWeatherStructure {
                    List(forecast.daily, id: \.dt) { day in
                        
                        Section {
                            VStack(alignment: .leading) {
                                
                                    VStack(alignment: .leading) {
                                        
                                        HStack {
                                            Text("天気：")
                                            Text("\(day.weather[0].description.capitalized)").bold()
                                        }
                                        
                                        
                                        
                                        Text("ーーーーーーー")
                                        
                                        ScrollView(.horizontal) {
                                            
                                           
                                            
                                            HStack {
                                                
                                             
                                                Group {
                                             Spacer(minLength: 20)
                                                        
                                            VStack {
                                                
                                                Text("朝")
                                                Text("\(day.temp.morn - 273.15, specifier: "%.0f")°C").bold()
                                                
                                            }
                                                    
                                                
                                                
                                                    Spacer(minLength: 20)
                                                
                                            
                                              
                                            VStack {
                                                Text("日中")
                                                Text("\(day.temp.day - 273.15, specifier: "%.0f")°C").bold()
                                            }
                                                    Spacer(minLength: 20)
                                                }
                                               
                                            
                                                
                                                Group {
                                            VStack {
                                                Text("夕方")
                                                Text("\(day.temp.eve - 273.15, specifier: "%.0f")°C").bold()
                                            }
                                                    Spacer(minLength: 20)
                                                
                                            VStack {
                                                Text("夜")
                                                Text("\(day.temp.night - 273.15, specifier: "%.0f")°C").bold()
                                            }
                                                    Spacer(minLength: 20)
                                            VStack {
                                                Text("最高")
                                                Text("\(day.temp.max - 273.15, specifier: "%.0f")°C").bold()
                                            }
                                                    Spacer(minLength: 20)
                                            VStack {
                                                Text("最低")
                                                Text("\(day.temp.min - 273.15, specifier: "%.0f")°C").bold()
                                                
                                            }
                                                    Spacer(minLength: 20)
                                            }
                                                
                                                    
                                                
                                            }
                                        }//
                                        //.frame(width: 300, height: 100)
                                        
                                        
                                        Text("ーーーーーーーーー")
                                        
                                        HStack {
                                            Text("降水確率：")
                                            Text("\(day.pop * 100, specifier: "%.1f")%").bold()
                                        }
                                            
        
            
                                    }//
                                
                            }
                        } header: {
                            Text(dateFormatter.string(from: day.dt))
                                .foregroundColor(Color.white)
                                .fontWeight(.bold)
                        }
                        
                       
                    }
                    .listStyle(PlainListStyle())
                    
                } else {
                    Spacer()
                }
                
                Button(action: {
                   dismiss()
              
            }) {
               Text("閉じる")
                    .foregroundColor(Color.white)
                    .font(.system(size: 20))
                    .underline()

            }
            }//
            .padding(.horizontal)
       
            
        }
        //.interactiveDismissDisabled() // タッチで戻らないようにする
        
    }
    
 
}

struct WeatherSheetView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherSheetView()
    }
}
