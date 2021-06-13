//
//  RocketDetailSwiftUIView.swift
//  Tappable Test
//
//  Created by Mohammad Takbiri on 6/11/21.
//

import SwiftUI
import SwURL

struct RocketDetailSwiftUIView: View {
    
    @ObservedObject var rocketDetailViewModel = RocketDetailViewModel()

    
    init(rocketID: String) {
        rocketDetailViewModel.rocketID = rocketID
    }
    
    
    
    var body: some View {
        
        VStack{
            if rocketDetailViewModel.dataHasBeenLoaded {
                
                ZStack(alignment: .topTrailing){
                    
                    RemoteImageView(url: URL(string: "\(self.rocketDetailViewModel.detail.flickr_images[0])")!, placeholderImage: Image(systemName: "photo"))
                        .aspectRatio(contentMode: .fill)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Image(systemName: "bookmark.fill")
                        .resizable(resizingMode: .tile)
                        .aspectRatio(contentMode: .fit)
                        .offset(x: -20, y: -9)
                        .frame(width: 60.0, height: 60.0)
                        .foregroundColor(self.rocketDetailViewModel.getColorFromSuccessRate(self.rocketDetailViewModel.detail.success_rate_pct))
                    
                    
                }.ignoresSafeArea()
                
                Spacer()
                
                VStack {
                    HStack {
                        Text("\(self.rocketDetailViewModel.detail.active ? "Active" : "Deactive")")
                            .padding(.leading)
                        Spacer()
                        Text("Maded by \(self.rocketDetailViewModel.detail.country)")
                            .padding(.trailing)
                    }
                    
                    HStack {
                        Text("First Flight: \(self.rocketDetailViewModel.detail.first_flight)")
                            .padding([.top, .leading])
                        Spacer()
                        Text("Cost: \(self.rocketDetailViewModel.detail.cost_per_launch)")
                            .padding([.top, .trailing])
                    }
                    Text("\(self.rocketDetailViewModel.detail.description)")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)
                        .padding([.top, .leading, .trailing])
                    
                    Spacer()
                    
                    
                    Button(action: {
                        UIApplication.shared.open(URL(string: "\(self.rocketDetailViewModel.detail.wikipedia)")!, options: [:], completionHandler: nil)
                    }, label: {
                        Text("Wikipedia")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal, 120)
                            .padding(.vertical, 20)
                            .background(Color(red: 115 / 255, green: 252 / 255, blue: 214 / 255))
                            .foregroundColor(Color(red: 0, green: 84 / 255, blue: 147 / 255))
                            .cornerRadius(15.0)
                        
                    })
                    
                }
                .padding(.bottom)
                
                Spacer()
            }
        }
        .onAppear {
            rocketDetailViewModel.fetchRocket(completion: nil)
        }
        
    }
}

struct RocketDetailSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
        }
        .previewDevice("iPhone 11")
    }
}
