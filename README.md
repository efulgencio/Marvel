# marvelefc

- Utilización Arquitecura MVVMC en el proyecto.

- CoreData
- Animación
- Catch Error
- LocalNotification
- RxSwift 
- class Box: clase que hace de listener para realizar bind
- ArKit (Realidad Aumentada)
- Generic (ViewBase) implementa método según el View del que proviene

		extension ViewBase where T: UIButton {
		    func changeTitle(to title: String) {
		        view.setTitle(title, for: .normal)
		    }
		}

