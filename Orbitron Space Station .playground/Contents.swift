import UIKit

class ControlCenter {
    var isLockedDown: Bool
    var securityCode: String
    
    init(isLockedDown: Bool, securityCode: String) {
        self.isLockedDown = isLockedDown
        self.securityCode = securityCode
    }
    
    func lockdown(withPassword password: String) {
        if password == securityCode {
            isLockedDown = true
        }
    }
    
    func printLockdownInfo() {
        print("Lockdown Status: \(isLockedDown ? "Locked" : "Unlocked")")
    }
}





class ResearchLab {
    var samples: [String] = []
    
    func addSample(_ sample: String) {
        samples.append(sample)
    }
}





class LifeSupportSystem {
    var oxygenLevel: Int
    
    init(oxygenLevel: Int) {
        self.oxygenLevel = oxygenLevel
    }
    
    func checkOxygenStatus() {
        print("Oxygen Level: \(oxygenLevel)%")
    }
}



class StationModule {
    var moduleName: String
    var drone: Drone?
    
    init(moduleName: String) {
        self.moduleName = moduleName
    }
    
    func assignTaskToDrone(_ task: String) {
        drone?.task = task
    }
}



class OrbitronSpaceStation {
    var controlCenter: ControlCenter
    var researchLab: ResearchLab
    var lifeSupportSystem: LifeSupportSystem
    
    init(controlCenter: ControlCenter, researchLab: ResearchLab, lifeSupportSystem: LifeSupportSystem) {
        self.controlCenter = controlCenter
        self.researchLab = researchLab
        self.lifeSupportSystem = lifeSupportSystem
    }
}



class Drone {
    var task: String?
    unowned var assignedModule: StationModule
    weak var missionControlLink: MissionControl?
    
    init(assignedModule: StationModule) {
        self.assignedModule = assignedModule
    }
    
    func checkTaskStatus() {
        if let task = task {
            print("Task Status: \(task)")
        }
    }
}



class MissionControl {
    var spaceStation: OrbitronSpaceStation?
    
    func connectToSpaceStation(_ spaceStation: OrbitronSpaceStation) {
        self.spaceStation = spaceStation
    }
    
    func requestControlCenterStatus() {
        spaceStation?.controlCenter.printLockdownInfo()
    }
    
    func requestOxygenStatus() {
        spaceStation?.lifeSupportSystem.checkOxygenStatus()
    }
    
    func requestDroneStatus() {
        if let station = spaceStation, let module = station.controlCenter.Drone?.assignedModule {
            module.drone?.checkTaskStatus()
        }
    }
}

//ver vxvdebi errors ratom agdebs (bevri viwvale agar shemidzlia, xval leqciamde gadavxedav da tu mivxvdi 10is mere davahandineb meored
//p.s shabati kvira orshabati vapireb tavidan gadavxedo wina leqciebs da davalebebs, vtvli rom sapudzvlianad ar mesmis da cota vnerviulob, amitom tavs mivcem uplebas shegawuxot kitxvebit <3
