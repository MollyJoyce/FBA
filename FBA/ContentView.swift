//
//  ContentView.swift
//  FBA
//
//  Created by Molly Joyce on 11/2/22.
//

import SwiftUI

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
        .init(title: "New Student"),
        .init(title: "Observations"),
        .init(title: "Behavior Plans")
    ]
    
    let students: [Student] = [
        .init(name: "FirstName LastName", DOB: "MM/DD/YYYY", school: "SchoolName", age: 1, grade: 1),
        .init(name: "FirstName LastName", DOB: "MM/DD/YYYY", school: "SchoolName", age: 1, grade: 1)
    ]

    @State var CurrentSelection = 0
    
    var body: some View {
    
        NavigationView{
            
            ListView(
                options: options,
                CurrentSelection: $CurrentOption
                )
            
            switch CurrentOption {
                
            case 1:
                NewStu()
            case 2:
                ObsView()
            case 3:
                PlanView()
            case 4:
                Stu()
            default:
                StuView(
                    CurrentSelection: $CurrentOption,
                    students: students
                    )
            
            }
         
        }
        .frame(minWidth: 600, minHeight: 400)
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        .background(Color.white)
    }
}


struct ObsView: View{
    
    @State private var ObsStu: String = ""
    
    var body: some View{
        Text("Obs")
        
        VStack{
            Form{
                TextField(text: $ObsStu){
                    Text("Student")
                }
            }
        }
    }
}


struct PlanView: View{
    var body: some View{
        Text("Plan")

    }
}




struct NewStu: View{
    
    @State private var FName: String = ""
    
    var body: some View{
        Text("New Student")
        
        Form{
            TextField(text: $FName){
                Text("First Name")
            }
        }
    }
}


struct StuView: View {
    
    @Binding var CurrentSelection: Int
    
    let students: [Student]
    
    var body: some View{
        VStack{
            
            let current = students[CurrentSelection]
            
            ForEach(students, id: \.self){option in
                HStack{
                     Text(option.name)
                    
                        .foregroundColor(current == option ? Color(.black) : Color(.gray))
                }
                
                .onTapGesture{
                   self.CurrentSelection = 4
               }
          //enter text
            /*https://developer.apple.com/documentation/swiftui/textfield  https://developer.apple.com/documentation/swiftui/form
             */
                .padding(5)
            }

        }
        
        Button("New Student") {
            self.CurrentSelection = 1
        }

    }
}

struct Stu: View {
    var body: some View{
        Text("current student")
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
                        } else if (option.title == "New Student"){
                            self.CurrentSelection = 1
                        }
                        else if (option.title == "Observations"){
                            self.CurrentSelection = 2
                        }
                        else if (option.title == "Behavior Plans"){
                            self.CurrentSelection = 3
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

