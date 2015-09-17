//
//  GameButton.swift
//  Wording
//
//  Created by Jacob Apenes on 9/6/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class GameButton : CCNode {
    var Aparticle : CCParticleSystem!
    var Bparticle : CCParticleSystem!
    var Cparticle : CCParticleSystem!
    var Dparticle : CCParticleSystem!
    var Eparticle : CCParticleSystem!
    var Fparticle : CCParticleSystem!
    var Gparticle : CCParticleSystem!
    var Hparticle : CCParticleSystem!
    var Iparticle : CCParticleSystem!
    var Jparticle : CCParticleSystem!
    var Kparticle : CCParticleSystem!
    var Lparticle : CCParticleSystem!
    var Mparticle : CCParticleSystem!
    var Nparticle : CCParticleSystem!
    var Oparticle : CCParticleSystem!
    var Pparticle : CCParticleSystem!
    var Qparticle : CCParticleSystem!
    var Rparticle : CCParticleSystem!
    var Sparticle : CCParticleSystem!
    var Tparticle : CCParticleSystem!
    var Uparticle : CCParticleSystem!
    var Vparticle : CCParticleSystem!
    var Wparticle : CCParticleSystem!
    var Xparticle : CCParticleSystem!
    var Yparticle : CCParticleSystem!
    var Zparticle : CCParticleSystem!
    var AAparticle : CCParticleSystem!
    var ABparticle : CCParticleSystem!
    var ACparticle : CCParticleSystem!
    var ADparticle : CCParticleSystem!
    var AEparticle : CCParticleSystem!
    var AFparticle : CCParticleSystem!
    var AGparticle : CCParticleSystem!
    var AHparticle : CCParticleSystem!
    var AIparticle : CCParticleSystem!
    var AJparticle : CCParticleSystem!
    var AKparticle : CCParticleSystem!
    var ALparticle : CCParticleSystem!
    var AMparticle : CCParticleSystem!
    var ANparticle : CCParticleSystem!
    var AOparticle : CCParticleSystem!
    var APparticle : CCParticleSystem!
    var AQparticle : CCParticleSystem!
    var ARparticle : CCParticleSystem!
    var ASparticle : CCParticleSystem!
    var ATparticle : CCParticleSystem!
    var AUparticle : CCParticleSystem!
    var AVparticle : CCParticleSystem!
    var AWparticle : CCParticleSystem!
    var AXparticle : CCParticleSystem!
    var AYparticle : CCParticleSystem!
    var AZparticle : CCParticleSystem!
    var BAparticle : CCParticleSystem!
    var BBparticle : CCParticleSystem!
    var BCparticle : CCParticleSystem!
    var BDparticle : CCParticleSystem!
    var BEparticle : CCParticleSystem!
    var BFparticle : CCParticleSystem!
    var BGparticle : CCParticleSystem!
    var BHparticle : CCParticleSystem!
    var BIparticle : CCParticleSystem!
    var BJparticle : CCParticleSystem!
    var BKparticle : CCParticleSystem!
    var BLparticle : CCParticleSystem!
    var BMparticle : CCParticleSystem!
    var BNparticle : CCParticleSystem!
    var BOparticle : CCParticleSystem!
    var BPparticle : CCParticleSystem!
    var BQparticle : CCParticleSystem!
    var BRparticle : CCParticleSystem!
    var BSparticle : CCParticleSystem!
    var BTparticle : CCParticleSystem!
    var BUparticle : CCParticleSystem!
    var BVparticle : CCParticleSystem!
    var BWparticle : CCParticleSystem!
    var BXparticle : CCParticleSystem!
    var BYparticle : CCParticleSystem!
    var BZparticle : CCParticleSystem!
    var CAparticle : CCParticleSystem!
    var CBparticle : CCParticleSystem!
    var CCparticle : CCParticleSystem!
    var CDparticle : CCParticleSystem!
    var CEparticle : CCParticleSystem!
    var CFparticle : CCParticleSystem!
    var CGparticle : CCParticleSystem!
    var CHparticle : CCParticleSystem!
    var CIparticle : CCParticleSystem!
    var CJparticle : CCParticleSystem!
    var CKparticle : CCParticleSystem!
    var CLparticle : CCParticleSystem!
    var CMparticle : CCParticleSystem!
    var CNparticle : CCParticleSystem!
    var COparticle : CCParticleSystem!
    var CPparticle : CCParticleSystem!
    var CQparticle : CCParticleSystem!
    var CRparticle : CCParticleSystem!
    var CSparticle : CCParticleSystem!
    var CTparticle : CCParticleSystem!
    var CUparticle : CCParticleSystem!
    var CVparticle : CCParticleSystem!
    var CWparticle : CCParticleSystem!
    var CXparticle : CCParticleSystem!
    var CYparticle : CCParticleSystem!
    var CZparticle : CCParticleSystem!
    var DAparticle : CCParticleSystem!
    var DBparticle : CCParticleSystem!
    var DCparticle : CCParticleSystem!
    var DDparticle : CCParticleSystem!
    var DEparticle : CCParticleSystem!
    var DFparticle : CCParticleSystem!
    var DGparticle : CCParticleSystem!
    var DHparticle : CCParticleSystem!
    var DIparticle : CCParticleSystem!
    var DJparticle : CCParticleSystem!
    var DKparticle : CCParticleSystem!
    var DLparticle : CCParticleSystem!
    var DMparticle : CCParticleSystem!
    var DNparticle : CCParticleSystem!
    var DOparticle : CCParticleSystem!
    var DPparticle : CCParticleSystem!
    var DQparticle : CCParticleSystem!
    var DRparticle : CCParticleSystem!
    var DSparticle : CCParticleSystem!
    var DTparticle : CCParticleSystem!
    var DUparticle : CCParticleSystem!
    var DVparticle : CCParticleSystem!
    var DWparticle : CCParticleSystem!
    var DXparticle : CCParticleSystem!
    var particleArray : [CCParticleSystem] = []
    
    func loadParticles() {
        particleArray += [
            Aparticle,
            Bparticle,
            Cparticle,
            Dparticle,
            Eparticle,
            Fparticle,
            Gparticle,
            Hparticle,
            Iparticle,
            Jparticle,
            Kparticle,
            Lparticle,
            Mparticle,
            Nparticle,
            Oparticle,
            Pparticle,
            Qparticle,
            Rparticle,
            Sparticle,
            Tparticle,
            Uparticle,
            Vparticle,
            Wparticle,
            Xparticle,
            Yparticle,
            Zparticle,
            AAparticle,
            ABparticle,
            ACparticle,
            ADparticle,
            AEparticle,
            AFparticle,
            AGparticle,
            AHparticle,
            AIparticle,
            AJparticle,
            AKparticle,
            ALparticle,
            AMparticle,
            ANparticle,
            AOparticle,
            APparticle,
            AQparticle,
            ARparticle,
            ASparticle,
            ATparticle,
            AUparticle,
            AVparticle,
            AWparticle,
            AXparticle,
            AYparticle,
            AZparticle,
            BAparticle,
            BBparticle,
            BCparticle,
            BDparticle,
            BEparticle,
            BFparticle,
            BGparticle,
            BHparticle,
            BIparticle,
            BJparticle,
            BKparticle,
            BLparticle,
            BMparticle,
            BNparticle,
            BOparticle,
            BPparticle,
            BQparticle,
            BRparticle,
            BSparticle,
            BTparticle,
            BUparticle,
            BVparticle,
            BWparticle,
            BXparticle,
            BYparticle,
            BZparticle,
            CAparticle,
            CBparticle,
            CCparticle,
            CDparticle,
            CEparticle,
            CFparticle,
            CGparticle,
            CHparticle,
            CIparticle,
            CJparticle,
            CKparticle,
            CLparticle,
            CMparticle,
            CNparticle,
            COparticle,
            CPparticle,
            CQparticle,
            CRparticle,
            CSparticle,
            CTparticle,
            CUparticle,
            CVparticle,
            CWparticle,
            CXparticle,
            CYparticle,
            CZparticle,
            DAparticle,
            DBparticle,
            DCparticle,
            DDparticle,
            DEparticle,
            DFparticle,
            DGparticle,
            DHparticle,
            DIparticle,
            DJparticle,
            DKparticle,
            DLparticle,
            DMparticle,
            DNparticle,
            DOparticle,
            DPparticle,
            DQparticle,
            DRparticle,
            DSparticle,
            DTparticle,
            DUparticle,
            DVparticle,
            DWparticle,
            DXparticle
        ]
    }
    
    func moveParticles(amount: CGFloat) {
        for particle in particleArray {
            if particle.position.x > 0 && particle.position.x < 128 {
                if particle.position.y == 0 {
                    particle.position = ccp(particle.position.x - amount, particle.position.y)
                }
                else {
                    particle.position = ccp(particle.position.x + amount, particle.position.y)
                }
            }
            else if particle.position.y > 0 && particle.position.y < 128 {
                if particle.position.x == 0 {
                    particle.position = ccp(particle.position.x, particle.position.y + amount)
                }
                else {
                    particle.position = ccp(particle.position.x, particle.position.y - amount)
                }
            }
            else {
                if particle.position.x == 0 && particle.position.y == 0 {
                    particle.position = ccp(particle.position.x, particle.position.y + amount)
                }
                else if particle.position.x == 0 && particle.position.y == 128 {
                    particle.position = ccp(particle.position.x + amount, particle.position.y)
                }
                else if particle.position.x == 128 && particle.position.y == 128 {
                    particle.position = ccp(particle.position.x, particle.position.y - amount)
                }
                else {
                    particle.position = ccp(particle.position.x - amount, particle.position.y)
                }
            }
            
            if particle.position.x < 0 {
                particle.position = ccp(0, particle.position.y)
            }
            else if particle.position.x > 128 {
                particle.position = ccp(128, particle.position.y)
            }
            
            if particle.position.y < 0 {
                particle.position = ccp(particle.position.x, 0)
            }
            else if particle.position.y > 128 {
                particle.position = ccp(particle.position.x, 128)
            }
        }
    }
}