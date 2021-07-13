# marvelefc

- Utilización Arquitecura MVVMC en el proyecto.

- CoreData
- Animación
- Catch Error
- LocalNotification
- RxSwift 
- class Box: clase que hace de listener para realizar bind
- Property Wrapper para que los nombres de los personajes sean en mayúsculas
- ArKit (Realidad Aumentada)
- Generic (ViewBase) implementa método según el View del que proviene

		extension ViewBase where T: UIButton {
		    func changeTitle(to title: String) {
		        view.setTitle(title, for: .normal)
		    }
		}

- Método callAsFunction (callable object)

struct MessageDebug {
    let version: String
    
    func callAsFunction(message: String)  {
        debugPrint(message + " \(version)")
    }
    
    func callAsFunction() -> String {
        return "Versión: \(version)"
    }
}
