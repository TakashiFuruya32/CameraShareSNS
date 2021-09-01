//
//  ViewController.swift
//  Camera
//
//  Created by HechiZan on 2021/08/20.
//

import UIKit
import Photos

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    
    var checkPermission = CheckPermisson()
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkPermission.checkCamera()
    }

    
    @IBAction func sherButton(_ sender: Any) {
        
        let text = ""
        let image = imageView.image?.jpegData(compressionQuality: 0.5) //圧縮は0~1.0
        let item = [text,image as Any]
        let activityVC = UIActivityViewController(activityItems: item, applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
    }
    
    
    @IBAction func album(_ sender: Any) {
        
        let sourceType:UIImagePickerController.SourceType = .photoLibrary
        createImagePicker(sourceType: sourceType)
        
    }
    
    @IBAction func camera(_ sender: Any) {
        
        let sourceType:UIImagePickerController.SourceType = .camera
        createImagePicker(sourceType: sourceType)
        
        
    }
    
    func createImagePicker(sourceType:UIImagePickerController.SourceType){
        
        let cameraPicker = UIImagePickerController()
        cameraPicker.sourceType = sourceType
        cameraPicker.delegate = self
        cameraPicker.allowsEditing = true //写真の編集を可能にする
        self.present(cameraPicker, animated: true, completion: nil)
        
    }
    
    //撮影やアルバムがキャンセルされた時。
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        //閉じる処理
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    //アルバムから写真が選択された時に呼ばれるメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        if let pickerImage = info[.editedImage] as? UIImage{
            //info[.editedImage] as? UIImage ここに撮影or選択された画像の情報が入っている
            
            imageView.image = pickerImage //それを貼っている
            
            picker.dismiss(animated: true, completion: nil) //閉じる処理
        }
    }
}

