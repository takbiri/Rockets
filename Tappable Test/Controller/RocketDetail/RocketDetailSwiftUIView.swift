//
//  RocketDetailSwiftUIView.swift
//  Tappable Test
//
//  Created by Mohammad Takbiri on 6/11/21.
//

import SwiftUI

struct RocketDetailSwiftUIView: View {
    var body: some View {
        
        VStack{
            ZStack(alignment: .topTrailing){
                Image("photo_2020-11-05_21-27-54").resizable()
                    .aspectRatio(contentMode: .fill)
                    .fixedSize(horizontal: false, vertical: false)
                    
                
                Image(systemName: "bookmark.fill")
                    .resizable(resizingMode: .tile)
                    .aspectRatio(contentMode: .fit)
                    .offset(x: -20, y: -9)
                    .frame(width: 60.0, height: 60.0)
                    .foregroundColor(.white)
                
                
            }.ignoresSafeArea()
            
            Spacer()
            
            VStack {
                HStack {
                    Text("Is Active")
                        .padding(.leading)
                    Spacer()
                    Text("Maded by The U.S.A")
                        .padding(.trailing)
                }
                
                HStack {
                    Text("First Flight: 21/03/1996")
                        .padding([.top, .leading])
                    Spacer()
                    Text("Cost: $123M")
                        .padding([.top, .trailing])
                }
                Text("The Falcon 1 was an expendable launch system privately developed and manufactured by SpaceX during 2006-2009. On 28 September 2008, Falcon 1 became the first privately-developed liquid-fuel launch vehicle to go into orbit around the Earth.")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .padding([.top, .leading, .trailing])
                
                Spacer()
                
                
                Button(action: {
                    UIApplication.shared.open(URL(string: "https://en.wikipedia.org/wiki/Falcon_1")!, options: [:], completionHandler: nil)
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
            
        }.ignoresSafeArea()
        
        
    }
}

struct RocketDetailSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RocketDetailSwiftUIView()
                .previewLayout(.device)
                .previewDevice("iPhone 11")
        }
    }
}
