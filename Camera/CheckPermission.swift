//
//  CheckPermission.swift
//  Camera
//
//  Created by HechiZan on 2021/08/20.
//

import Foundation
import Photos

//カメラの許可を取る画面

class CheckPermisson{
    
    //ユーザーに許可を促す
    func checkCamera(){
        
        PHPhotoLibrary.requestAuthorization { (status) in
            
            switch(status){
            
            case .authorized:
                
                print("authorized")
                
            case .notDetermined:
                
                print("notDetermined")
                
            case .restricted:
                
                print("restricted")
                
            case .denied:
                
                print("denied")
                
            case .limited:
                
                print("limited")
                
            @unknown default:
                
                break
            }
        }
        
    }
    
    
}
