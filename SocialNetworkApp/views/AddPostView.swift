//
//  AddPostView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 27/07/2022.
//
import SwiftUI
import PhotosUI

struct AddPostView: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    @StateObject var postViewModel = PostViewModel()
    @State var text: String = ""
    @State var message = ""
    @State private var showToast = false
    @Environment(\.dismiss) var dismiss
       
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            
            TextField("ajouter un pos", text: $text)
                .frame(width: 350, height: 100)
                .border(.gray)
                .cornerRadius(20)
    
            HStack {
                
                PhotosPicker(
                    selection: $selectedItem,
                    matching: .images,
                    photoLibrary: .shared()) {
                        Image(systemName: "photo")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    .onChange(of: selectedItem) { newItem in
                        Task {
                            // Retrieve selected asset in the form of Data
                            if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                selectedImageData = data
                            }
                        }
                    }
                }
                Button{
                    self.sourceType = .camera
                    self.isImagePickerDisplay.toggle()
                } label: {
                    Image(systemName: "camera")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                
                Spacer()
                Button{
                    if text.count > 0{
                        message = postViewModel.makePost(text: text) ? "Poste ajouté" : "erreur"
                        postViewModel.getTimeline()
                        self.showToast.toggle()
                    }
                    dismiss()
                } label: {
                    Text("Publier")
                }.alert(isPresented: $showToast) {
                    Alert(title: Text(message))
                }
            if selectedImageData != nil {
                let uiImage = UIImage(data: selectedImageData)
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250)
                }
            }
        }
        .navigationTitle("Ajouter un post")
    }


struct AddPostView_Previews: PreviewProvider {
    static var previews: some View {
        AddPostView()
    }
}

