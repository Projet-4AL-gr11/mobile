//
//  AddPostView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 27/07/2022.
//
import SwiftUI
import PhotosUI

struct AddPostView: View {
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    @StateObject var postViewModel = PostViewModel()
    @State var text: String = ""
    @State var message = ""
    @State private var showToast = false
    @Environment(\.dismiss) var dismiss
       
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            if selectedImage != nil {
                Image(uiImage: selectedImage!)
                    .resizable()
                    .clipShape(Rectangle())
                    .frame(width: 350, height: 250)
                    .cornerRadius(10)
                    .padding()
            }
            TextField("ajouter un pos", text: $text)
                .frame(width: 350, height: 100)
                .border(.gray)
                .cornerRadius(20)
    
            HStack {
                
                Button{
                    self.sourceType = .camera
                    self.isImagePickerDisplay.toggle()
                } label: {
                    Image(systemName: "camera")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                Button{
                    self.sourceType = .photoLibrary
                    self.isImagePickerDisplay.toggle()
                } label: {
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 30, height: 30)
                }.padding()
                
                Spacer()
                Button{
                    if text.count > 0 {
                        guard let selectedImageData = selectedImage?.jpegData(compressionQuality: 0.5) else {
                            postViewModel.makePost(text: text, media: nil)
                            message = "post added without Media"
                            print(message)
                            self.showToast.toggle()
                            return
                        }
                        postViewModel.makePost(text: text, media: selectedImageData)
                        message = "post with media"
                        print(message)
                        self.showToast.toggle()
                    }
                    dismiss()
                } label: {
                    Text("Publier")
                }.alert(isPresented: $showToast) {
                    Alert(title: Text(message))
                }
            }
        }
        .padding()
        .navigationTitle("Ajouter un post")
        .sheet(isPresented: self.$isImagePickerDisplay) {
            ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
        }
    }

struct AddPostView_Previews: PreviewProvider {
    static var previews: some View {
        AddPostView()
    }
    }
}
