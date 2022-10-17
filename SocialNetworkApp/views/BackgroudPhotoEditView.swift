//
//  BackgroudPhotoEditView.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 26/09/2022.
//

import SwiftUI

struct BannerPhotoEditView: View {
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    @StateObject var userViewModel = UserViewModel()
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
                    guard let selectedImageData = selectedImage?.jpegData(compressionQuality: 0.5) else {
                        self.showToast.toggle()
                        dismiss()
                        return
                    }
                    userViewModel.changeBanner(bannerImage: selectedImageData)
                    dismiss()
                } label: {
                    Text("Choisir")
                }.alert(isPresented: $showToast) {
                    Alert(title: Text(message))
                }
            }
        }
        .padding()
        .navigationTitle("Bannier")
        .sheet(isPresented: self.$isImagePickerDisplay) {
            ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
        }
    }
}

struct BackgroudPhotoEditView_Previews: PreviewProvider {
    static var previews: some View {
        BannerPhotoEditView()
    }
}
