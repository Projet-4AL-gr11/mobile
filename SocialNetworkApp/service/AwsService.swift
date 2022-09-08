//
//  AwsService.swift
//  SocialNetworkApp
//
//  Created by Ahamad Ben on 01/09/2022.
//

import Foundation
import AWSS3
import ClientRuntime
import AWSClientRuntime

class AwsService: ObservableObject{
    let bucket = "pa-lsa-bucket"
    
    public func getImageFromS3(key: String) async throws -> Data {
        let s3Client = try S3Client(region: "us-east-2")
        
            let input = GetObjectInput(
                bucket: self.bucket,
                key: key
            )
            let output = try await s3Client.getObject(input: input)

            // Get the stream and return its contents in a `Data` object. If
            // there is no stream, return an empty `Data` object instead.
            guard let body = output.body else {
                return "".data(using: .utf8)!
            }
            let data = body.toBytes().toData()
            return data
        }
}
