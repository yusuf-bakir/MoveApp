//
//  FirbaseRepository.swift
//  MovieWorldApp
//
//  Created by yusuf bakır on 28.03.2024.
//

import Foundation

import Firebase



protocol UserNetworkProtolocol {
    func loginUser (email:String ,password:String,complete:@escaping(String?,Error) -> Void)
    func signIn (email:String,password:String,complete:@escaping(String?,Error)-> Void)
}


class FirbaseRepository :UserNetworkProtolocol{
    func signIn(email: String, password: String, complete: @escaping (String?, Error) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            // Kayıt işlemi tamamlandığında bu kısımda işlemler yapılır
            if let error = error {
                // Hata varsa işleme geçin
                print("Kayıt işlemi başarısız oldu: \(error.localizedDescription)")
            } else {
                // Kayıt işlemi başarılı oldu
                print("Kullanıcı başarıyla kaydedildi!")
                // AuthResult nesnesi authResult parametresinde bulunabilir.
                // Kullanıcı oturumu açıldıktan sonra yapılacak işlemleri burada gerçekleştirebilirsiniz.
            }
        }
        
    }
    
    func loginUser(email: String, password: String, complete: @escaping (String?, Error) -> Void) {
//        Auth.auth().signIn(withEmail: email, password: password) { authResult ,error in
//            if let error = error {
//                // Hata varsa işleme geçin
//                print("Kayıt işlemi başarısız oldu: \(error.localizedDescription)")
//                complete(nil,error.localizedDescription )
//                
//            }
//            else {
//                // Kayıt işlemi başarılı oldu
//                print("Kullanıcı başarıyla kaydedildi!")
//                // AuthResult nesnesi authResult parametresinde bulunabilir.
//                // Kullanıcı oturumu açıldıktan sonra yapılacak işlemleri burada gerçekleştirebilirsiniz.
//                complete(authResult,"")
//            }
//            
            
            
        }
        
        
    }
    
    
    
    

    

