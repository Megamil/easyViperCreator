//
//  HomeView.swift
//  MegamilAppAdmin
//
//  Created by Eduardo dos santos on 02/09/21.
//

import SwiftUI

extension FileManager.SearchPathDirectory {
    func createSubFolder(named: String, withIntermediateDirectories: Bool = false) -> Bool {
        guard let url = FileManager.default.urls(for: self, in: .userDomainMask).first else { return false }
        do {
            try FileManager.default.createDirectory(at: url.appendingPathComponent(named), withIntermediateDirectories: withIntermediateDirectories, attributes: nil)
            return true
        } catch {
            print(error)
            return false
        }
    }
}

struct HomeView: View {
    var body: some View {
        HomeSetupView()
            .navigationTitle(ConstantsStrings.titleApp.rawValue)
    }
}

struct HomeSetupView: View {
    
    @State var path: String? //= "/Users/" + NSUserName() + "/Desktop"
    //@State var path: String = (NSSearchPathForDirectoriesInDomains(.desktopDirectory, .userDomainMask, true) as [String]).first ?? ""
    @State var moduleName: String = ""
    @State var showAlert = false
    
    let presenter = HomePresenter()
    @State var msgPresenter = ""
    
    init() {
    }
    
    var body: some View {
        
        VStack {
        
            //Title
            Text(ConstantsStrings.titleHome.rawValue)
                .font(.title)
            
            //Input
            TextField(ConstantsStrings.placeHolderInput.rawValue, text: $moduleName, onEditingChanged: { (changed) in
                print("Username onEditingChanged \(moduleName)")
            }) {
                print("Username \(moduleName)")
            }
            .textFieldStyle(DefaultTextFieldStyle())
            .frame(width: 300, height: 40, alignment: .center)
            
            //Button
            Button(ConstantsStrings.buttonTitleCreateViper.rawValue) {
                if(!(path?.isEmpty ?? true)) {
                    self.presenter.createViperFiles(moduleName: moduleName, path: path!) { status, msg in
                        
                        self.msgPresenter = msg ?? ""
                        self.showAlert.toggle()
                        
                        if(status ?? false) {
                            NSWorkspace.shared.selectFile("\(path!)/\(moduleName)", inFileViewerRootedAtPath: "")

                        }
                        
                    }
                }
            }
            .buttonStyle(MegamilButton(isActive: !(self.path?.isEmpty ?? true)))
            .alert(isPresented: $showAlert) { () -> Alert in
                Alert(
                    title: Text(ConstantsStrings.labelTitleAlert.rawValue),
                    message: Text(msgPresenter),
                    dismissButton: .default(Text(ConstantsStrings.labelCloseAlert.rawValue))
                )
            }
            
            HStack {
                Text("[\(path ?? "")]")
                Button(ConstantsStrings.buttonChangePath.rawValue, action: {
                    showPanel()
                })
            }
            
        }
    }
}

extension HomeSetupView {
    
    func showPanel() {
        let dialog = NSOpenPanel();

        dialog.title                    = ConstantsStrings.textSelectPath.rawValue;
        dialog.showsResizeIndicator     = true;
        dialog.showsHiddenFiles         = false;
        dialog.allowsMultipleSelection  = false;
        dialog.canChooseDirectories     = true;
        dialog.canCreateDirectories     = true

        if (dialog.runModal() ==  NSApplication.ModalResponse.OK) {
            let result = dialog.url // Pathname of the file

            if (result != nil) {
                self.path = result!.path
                
                // path contains the file path e.g
                // /Users/ourcodeworld/Desktop/file.txt
            }
            
        } else {
            // User clicked on "Cancel"
            return
        }

    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
