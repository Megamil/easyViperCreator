//
//  HomePresenter.swift
//  MegamilAppAdmin
//
//  Created by Eduardo dos santos on 02/09/21.
//

import Foundation

class HomePresenter {
    
    let fileManager = FileManager.default
    
    func createViperFiles(moduleName: String, path: String, typeView: String?, callBack: @escaping (Bool?, String?) -> Void) {
        
        print(ConstantsStrings.buttonTitleCreateViper.rawValue)
        print(moduleName)
        
        let docURL = URL(string: path)!
        let dataPath = docURL.appendingPathComponent(moduleName)
        
        if !fileManager.fileExists(atPath: dataPath.absoluteString){
            do {
                
                //Path
                try fileManager.createDirectory(atPath: dataPath.absoluteString, withIntermediateDirectories: true, attributes: nil)
                
                let mockExample = MockFiles().getExampleContent(name: moduleName)
                let ExURL = docURL.appendingPathComponent("\(moduleName)_How_to_use.txt", isDirectory: false)
                self.addFile(content: mockExample, URL: ExURL)
                
                //View
                let pathView = dataPath.appendingPathComponent("View")
                try fileManager.createDirectory(atPath: pathView.absoluteString, withIntermediateDirectories: true, attributes: nil)
                switch(typeView) {
                    case "Com Scroll":
                        let mockView = MockFiles().getViewContent(name: moduleName)
                        let vURL = pathView.appendingPathComponent("\(moduleName)VC.swift", isDirectory: false)
                        self.addFile(content: mockView, URL: vURL)
                        
                        let mockStory = MockFiles().getStoryboardScrollContent(name: moduleName)
                        let sURL = pathView.appendingPathComponent("\(moduleName)VC.storyboard", isDirectory: false)
                        self.addFile(content: mockStory, URL: sURL)
                    break
                    case "TableView":
                        let mockView = MockFiles().getViewTableContent(name: moduleName)
                        let vURL = pathView.appendingPathComponent("\(moduleName)VC.swift", isDirectory: false)
                        self.addFile(content: mockView, URL: vURL)
                        
                        let mockStory = MockFiles().getStoryboardTableContent(name: moduleName)
                        let sURL = pathView.appendingPathComponent("\(moduleName)VC.storyboard", isDirectory: false)
                        self.addFile(content: mockStory, URL: sURL)
                    break
                default:
                        let mockView = MockFiles().getViewContent(name: moduleName)
                        let vURL = pathView.appendingPathComponent("\(moduleName)VC.swift", isDirectory: false)
                        self.addFile(content: mockView, URL: vURL)
                        
                        let mockStory = MockFiles().getStoryboardContent(name: moduleName)
                        let sURL = pathView.appendingPathComponent("\(moduleName)VC.storyboard", isDirectory: false)
                        self.addFile(content: mockStory, URL: sURL)
                    break
                }
                
                
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
    
    func createKotlinFiles(moduleName: String, path: String, typeView: String?, callBack: @escaping (Bool?, String?) -> Void) {
        
        print(ConstantsStrings.buttonTitleCreateViper.rawValue)
        print(moduleName)
        var fileModuleName = moduleName.prefix(1).capitalized + moduleName.dropFirst()
        
        let docURL = URL(string: path)!
        let dataPath = docURL
            .appendingPathComponent("com")
            .appendingPathComponent("empresa") //@todo adicione o nome correto
            .appendingPathComponent(moduleName)
        
        if !fileManager.fileExists(atPath: dataPath.absoluteString){
            do {
                
                //Path
                try fileManager.createDirectory(atPath: dataPath.absoluteString, withIntermediateDirectories: true, attributes: nil)
                
                let mockXML = MockFilesKotlin().getMockXML(name: moduleName)
                let XMLURL = docURL.appendingPathComponent("activity_\(moduleName.lowercased()).xml", isDirectory: false)
                self.addFile(content: mockXML, URL: XMLURL)
                
                // Domain
                let pathDomain = dataPath.appendingPathComponent("domain")
                try fileManager.createDirectory(atPath: pathDomain.absoluteString, withIntermediateDirectories: true, attributes: nil)
                
                // -> Models
                let pathModels = pathDomain.appendingPathComponent("models")
                try fileManager.createDirectory(atPath: pathModels.absoluteString, withIntermediateDirectories: true, attributes: nil)
                
                let mockModel = MockFilesKotlin().getMockModel(name: moduleName)
                let responseModel = pathModels.appendingPathComponent("\(fileModuleName)Model.kt", isDirectory: false)
                self.addFile(content: mockModel, URL: responseModel)
                
                // -> Repositories
                let pathRepositories = pathDomain.appendingPathComponent("repositories")
                try fileManager.createDirectory(atPath: pathRepositories.absoluteString, withIntermediateDirectories: true, attributes: nil)
                
                let mockRepository = MockFilesKotlin().getMockRepository(name: moduleName)
                let responseRepository = pathRepositories.appendingPathComponent("\(fileModuleName)Repository.kt", isDirectory: false)
                self.addFile(content: mockRepository, URL: responseRepository)
                
                // -> Use Cases
                let pathUseCases = pathDomain.appendingPathComponent("useCases")
                try fileManager.createDirectory(atPath: pathUseCases.absoluteString, withIntermediateDirectories: true, attributes: nil)
                
                let mockUseCase = MockFilesKotlin().getMockUseCase(name: moduleName)
                let responseUseCase = pathUseCases.appendingPathComponent("\(fileModuleName)UseCase.kt", isDirectory: false)
                self.addFile(content: mockUseCase, URL: responseUseCase)
                
                
                //Data
                let pathData = dataPath.appendingPathComponent("data")
                try fileManager.createDirectory(atPath: pathData.absoluteString, withIntermediateDirectories: true, attributes: nil)
                
                let mockRepositoryImpl = MockFilesKotlin().getMockRepositoryImpl(name: moduleName)
                let responseRI = pathData.appendingPathComponent("\(fileModuleName)RepositoryImpl.kt", isDirectory: false)
                self.addFile(content: mockRepositoryImpl, URL: responseRI)
                
                let mockEndPoints = MockFilesKotlin().getMockEndPoints(name: moduleName)
                let responseEP = pathData.appendingPathComponent("\(fileModuleName)EndPoints.kt", isDirectory: false)
                self.addFile(content: mockEndPoints, URL: responseEP)
                

                // -> Mappers
                let pathDataMappers = pathData.appendingPathComponent("mappers")
                try fileManager.createDirectory(atPath: pathDataMappers.absoluteString, withIntermediateDirectories: true, attributes: nil)
                
                let mockResponseToModel = MockFilesKotlin().getMockMapperResponseToModel(name: moduleName)
                let responseToModel = pathDataMappers.appendingPathComponent("\(fileModuleName)ResponseToModel.kt", isDirectory: false)
                self.addFile(content: mockResponseToModel, URL: responseToModel)
                
                let mockRequestToModel = MockFilesKotlin().getMockMapperRequestToModel(name: moduleName)
                let requestToModel = pathDataMappers.appendingPathComponent("\(fileModuleName)RequestToModel.kt", isDirectory: false)
                self.addFile(content: mockRequestToModel, URL: requestToModel)
                
                // -> Requests
                let pathDataRequests = pathData.appendingPathComponent("requests")
                try fileManager.createDirectory(atPath: pathDataRequests.absoluteString, withIntermediateDirectories: true, attributes: nil)
                
                let mockRequests = MockFilesKotlin().getMockRequest(name: moduleName)
                let request = pathDataRequests.appendingPathComponent("\(fileModuleName)Request.kt", isDirectory: false)
                self.addFile(content: mockRequests, URL: request)
                
                // -> Responses
                let pathDataResponses = pathData.appendingPathComponent("responses")
                try fileManager.createDirectory(atPath: pathDataResponses.absoluteString, withIntermediateDirectories: true, attributes: nil)
                
                let mockResponse = MockFilesKotlin().getMockResponse(name: moduleName)
                let Response = pathDataResponses.appendingPathComponent("\(fileModuleName)Response.kt", isDirectory: false)
                self.addFile(content: mockResponse, URL: Response)
                
                // UI
                let pathUI = dataPath.appendingPathComponent("UI")
                try fileManager.createDirectory(atPath: pathUI.absoluteString, withIntermediateDirectories: true, attributes: nil)
                
                let mockExt = MockFilesKotlin().getMockExt(name: moduleName)
                let responseExt = pathUI.appendingPathComponent("\(fileModuleName)Ext.kt", isDirectory: false)
                self.addFile(content: mockExt, URL: responseExt)
                
                let mockActivity = MockFilesKotlin().getMockActivity(name: moduleName)
                let responseActivity = pathUI.appendingPathComponent("\(fileModuleName)Activity.kt", isDirectory: false)
                self.addFile(content: mockActivity, URL: responseActivity)
                
                let mockViewModel = MockFilesKotlin().getMockViewModel(name: moduleName)
                let responseVM = pathUI.appendingPathComponent("\(fileModuleName)ViewModel.kt", isDirectory: false)
                self.addFile(content: mockViewModel, URL: responseVM)
                
                // Path
                let mockDI = MockFilesKotlin().getMockDI(name: moduleName)
                let responseDI = dataPath.appendingPathComponent("\(fileModuleName)DI.kt", isDirectory: false)
                self.addFile(content: mockDI, URL: responseDI)
                
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
