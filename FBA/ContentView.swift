//
//  ContentView.swift
//  FBA
//
//  Created by Molly Joyce on 11/2/22.
//

import SwiftUI

//test

struct Option: Hashable {
    let title: String
}

struct Student: Hashable {
    let name: String
    let DOB: String
    let school: String
    let age: Int
    let grade: Int
}

struct ContentView: View {
    
    @State var CurrentOption = 0
    
    let options: [Option] = [
        .init(title: "Students"),
        .init(title: "Observations"),
        .init(title: "Behavior Plans")
    ]
    
    let students: [Student] = [
        .init(name: "FirstName LastName", DOB: "MM/DD/YYYY", school: "SchoolName", age: 1, grade: 1),
        .init(name: "FirstName LastName", DOB: "MM/DD/YYYY", school: "SchoolName", age: 1, grade: 1)
    ]

    
    
    
    var body: some View {
        
        
        NavigationView{
            
            ListView(
                options: options,
                CurrentSelection: $CurrentOption
            )
            
            switch CurrentOption {
            case 1:
                ObsView()
            case 2:
                PlanView()
            default:
                StuView(students: students)
            
            }
        }
        .frame(minWidth: 600, minHeight: 400)
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        .background(Color.white)
    }
}

struct ObsView: View{
    var body: some View{
        Text("Obs")
    }
}

struct PlanView: View{
    var body: some View{
        Text("Plan")
    }
}

struct StuView: View {
    
    let students: [Student]
    
    var body: some View{
        VStack{
            ForEach(students, id: \.self){option in
                HStack{
                     Text(option.name)
                    
                }
                .padding(5)
            }
           // Spacer()
            //   .frame(height: 200)
        }
    }
}
    
    struct ListView: View {
        
        let options: [Option]
        
        @Binding var CurrentSelection: Int
        
        var body: some View{
            VStack{
                let current = options[CurrentSelection]
                ForEach(options, id: \.self) {option in
                    HStack {
                        Text(option.title)
                        
                            .foregroundColor(current == option ? Color(.black) : Color(.gray))
                        
                        Spacer()
                    }
                    .padding(12)
                    .onTapGesture {
                        if(option.title == "Students") {
                            CurrentSelection = 0
                        } else if (option.title == "Observations"){
                            self.CurrentSelection = 1
                        }
                        else if (option.title == "Behavior Plans"){
                            self.CurrentSelection = 2
                        }
                    }
                }
                Spacer()
            }
            .background(Color.white)
        }
    }
    

    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

