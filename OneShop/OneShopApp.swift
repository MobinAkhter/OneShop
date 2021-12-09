//
//  OneShopApp.swift
//  OneShop
//
//  Created by user198375 on 11/8/21.
//

import SwiftUI
import Firebase

final class AppDelegate: NSObject, UIApplicationDelegate {

  func application(_ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
@main
struct OneShopApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var sessionService = SessionServiceImpl()
    let persistenceController = PersistenceController.shared
    let coreDBHelper = CoreDBHelper(context: PersistenceController.shared.container.viewContext)
   
    var body: some Scene {
        WindowGroup {
            NavigationView{
               // ProductSelection()

                switch sessionService.state {
                case .loggedIn:
                    HomeView()
                        .environmentObject(sessionService)
                        .environmentObject(coreDBHelper)
                case .loggedOut:
                    LoginView()
                }
                
            }
        }
    }
}
