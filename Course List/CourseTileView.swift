//
//  CourseTileView.swift
//  Course List
//
//  Created by yucian huang on 2024/3/13.
//

import SwiftUI

struct CourseTileView: View {
    
    let course: Course
    
    var body: some View {
        
        ZStack{
            
            AsyncImage(url: URL(string: course.image)) { response in
                
                switch response {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                    
                default:
                    DefaultImageView()
                }
                
            }
         
            VStack {
                Spacer()
                HStack{
                    Text(course.title)
                      .multilineTextAlignment(.leading)
                      .padding(.vertical, 4)
                      .padding(.horizontal)
                      .foregroundStyle(.white)
                      .bold()
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background {
                    Color.purple
                        .opacity(0.5)
                }
                
        }
     
                
        }
            
    }
}

#Preview {
    CourseTileView(course: Course(id: 1, image: "https://zappycode.com/media/course_images/CourseImageTake2NoBorder_A1jzclC.png", title: "iPhone Apps for Complete Beginners - Swift, SwiftUI & iOS17", subtitle: "this is sub"))
        .frame(height: 200)
}
