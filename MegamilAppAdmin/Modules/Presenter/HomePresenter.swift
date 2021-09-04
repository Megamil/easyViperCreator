//
//  HomePresenter.swift
//  MegamilAppAdmin
//
//  Created by Eduardo dos santos on 02/09/21.
//

import Foundation

class HomePresenter {
    
    let fileManager = FileManager.default
    
    func createViperFiles(moduleName: String, path: String, callBack: @escaping (Bool?, String?) -> Void) {
        
        print(ConstantsStrings.buttonTitleCreateViper.rawValue)
        print(moduleName)
        
        let docURL = URL(string: path)!
        let dataPath = docURL.appendingPathComponent(moduleName)
        
        if !fileManager.fileExists(atPath: dataPath.absoluteString){
            do {
                
                //Path
                try fileManager.createDirectory(atPath: dataPath.absoluteString, withIntermediateDirectories: true, attributes: nil)
                
                //View
                let pathView = dataPath.appendingPathComponent("View")
                try fileManager.createDirectory(atPath: pathView.absoluteString, withIntermediateDirectories: true, attributes: nil)
                
                let mockView = MockFiles().getViewContent(name: moduleName)
                let vURL = pathView.appendingPathComponent("\(moduleName)VC.swift", isDirectory: false)
                self.addFile(content: mockView, URL: vURL)
                
                let mockStory = MockFiles().getStoryboardContent(name: moduleName)
                let sURL = pathView.appendingPathComponent("\(moduleName)VC.storyboard", isDirectory: false)
                self.addFile(content: mockStory, URL: sURL)

                //Interactor
                let pathInteractor = dataPath.appendingPathComponent("Interactor")
                try fileManager.createDirectory(atPath: pathInteractor.absoluteString, withIntermediateDirectories: true, attributes: nil)
                
                let mockInteractor = MockFiles().getInteractorContent(name: moduleName)
                let iURL = pathInteractor.appendingPathComponent("\(moduleName)Interactor.swift", isDirectory: false)
                self.addFile(content: mockInteractor, URL: iURL)
                
                //Presenter
                let pathPresenter = dataPath.appendingPathComponent("Presenter")
                try fileManager.createDirectory(atPath: pathPresenter.absoluteString, withIntermediateDirectories: true, attributes: nil)
                
                let mockPresenter = MockFiles().getPresenterContent(name: moduleName)
                let pURL = pathPresenter.appendingPathComponent("\(moduleName)Presenter.swift", isDirectory: false)
                self.addFile(content: mockPresenter, URL: pURL)
                
                //Entity
                let pathEntity = dataPath.appendingPathComponent("Entity")
                try fileManager.createDirectory(atPath: pathEntity.absoluteString, withIntermediateDirectories: true, attributes: nil)
                
                let mockEntity = MockFiles().getEntityContent(name: moduleName)
                let eURL = pathEntity.appendingPathComponent("\(moduleName)Entity.swift", isDirectory: false)
                self.addFile(content: mockEntity, URL: eURL)
                
                //Router
                let pathRouter = dataPath.appendingPathComponent("Router")
                try fileManager.createDirectory(atPath: pathRouter.absoluteString, withIntermediateDirectories: true, attributes: nil)
                
                let mockRouter = MockFiles().getRouterContent(name: moduleName)
                let rURL = pathRouter.appendingPathComponent("\(moduleName)Router.swift", isDirectory: false)
                self.addFile(content: mockRouter, URL: rURL)
                
                let mockExample = MockFiles().getExampleContent(name: moduleName)
                let ExURL = dataPath.appendingPathComponent("\(moduleName)_How_to_use.txt", isDirectory: false)
                self.addFile(content: mockExample, URL: ExURL)
                
                callBack(true, ConstantsStrings.labelSuccessDir.rawValue)
                
            } catch {
                
                callBack(false, error.localizedDescription)
                
            }
            
        } else {
            
            callBack(false, ConstantsStrings.labelErrorDir.rawValue)
            
        }
        
//        if FileManager.SearchPathDirectory.desktopDirectory.createSubFolder(named: moduleName) {
//            print("folder successfully created")
//        }
        
    }
    
    func addFile(content: String? , URL: URL) {
        if !FileManager.default.fileExists(atPath: URL.absoluteString) {
            FileManager.default.createFile(atPath: URL.absoluteString, contents: content?.data(using: .utf8), attributes: nil)
        }
    }
    
}
