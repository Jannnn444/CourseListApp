//
//  ContentView.swift
//  Course List
//
//  Created by yucian huang on 2024/3/13.
//

import SwiftUI

struct CourseListView: View {
    
    @State var courses: [Course] = []
    
    var body: some View {
        NavigationStack{
            if courses.count == 0 {
                VStack{
                    ProgressView()
                        .padding()
                    Text("Loading the course...'")
                }
                .foregroundStyle(.purple)
                .onAppear { getCourses() }
            } else {
                ScrollView{
                    VStack(spacing: 1) {
                        ForEach(courses) { course in
                            CourseTileView(course: course)
                            //-> List can be replaced by ForEach, remember wrapped by Vstack, wrapped byScrollView
                        }
                    }
                }
                .navigationTitle("ZappyCode Courses")
            }
        }
        // course present the singular we want to display from course

    }
    
    func getCourses() {
        
        // the url is optional, use if let
        if let apiURL = URL(string: "https://zappycode.com/api/courses?format=json") {
            var request = URLRequest(url: apiURL)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let courseData = data {
              // print(String(data: courseData, encoding: .utf8 ) ?? "ERROR")
                    
                    
                    if let coursesFromAPI = try? JSONDecoder().decode([Course].self, from: courseData) {
                        
                        courses = coursesFromAPI
                        print(courses)
                        // fetch data from api, sort them into the Course object and put them inside array.
                        
                    }
                    
                    
                
                }
            }.resume()
        }
      
        
    }
}

#Preview {
    CourseListView()
}
