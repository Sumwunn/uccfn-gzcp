// ----------------- //
// ----- Misc ----- //
// --------------- //

// Needs implemented
class powerSpread : Powerup
{
}

class PowerQuadDamage : PowerDamage
{
    Default
    {
        DamageFactor "Normal", 4;
    }
}

// ----------------------------------- //
// ----- PowerTargeter Rewrites ----- //
// --------------------------------- //

// ---------------------------- //
// ----- LEGENDARY STUFF ----- //
// -------------------------- //

class PowerLegPowerEffect : Powerup
{
    Default
    {
        Powerup.Duration -45;
    }

    override void DoEffect()
    {
        // Delay emulation lololol
        if ((level.totaltime % 5) == 0)
            owner.A_SpawnProjectile("LegendaryYellowSparkleSpawner",0,0,random(0,-360),2,random(0,360));
    }
}

class PowerLegCrystalHeal : Powerup
{
    Default
    {
        Powerup.Duration -30;
    }

    override void DoEffect()
    {
        if ((level.totaltime % 5) == 0)
        {
            owner.A_SpawnProjectile("LegendaryBlueSparkleSpawner",0,0,random(0,-360),2,random(0,360));
            owner.A_SpawnItemEx("LegendaryBluePowerLine",random(32,-32),random(32,-32),random(8,48),0,0,random(1,4),0,128,0);
        }

        if ((level.totaltime % 2) == 0)
        {
            owner.GiveBody(1, 200);
            owner.A_GiveInventory("LegCrystalArmorGiver",1);
        }
    }
}

// ---------------------------- //
// ------ NEMESIS STUFF ------ //
// -------------------------- //

class PowerNemPowerEffect : Powerup
{
    Default
    {
        Powerup.Duration -60;
    }

    override void DoEffect()
    {
        if ((level.totaltime % 5) == 0)
            owner.A_SpawnProjectile("NemesisSparkleSpawner2",0,0,random(0,-360),2,random(0,360));
    }
}

class PowerNemPowHeal : Powerup
{
    Default
    {
        Powerup.Duration -60;
        -COUNTITEM;
        +NOTIMEFREEZE;
    }

    override void DoEffect()
    {
        if ((level.totaltime % 4) == 0)
            owner.A_SpawnProjectile("NemesisSparkleSpawner2",0,0,random(0,-360),2,random(0,360));

        if ((level.totaltime % 2) == 0)
            owner.GiveBody(5,600);
    }
}

class PowerNemAmmoRegenerate : Powerup
{
    Default
    {
        Powerup.Duration -60;
        -COUNTITEM;
        +NOTIMEFREEZE;
    }

    override void DoEffect()
    {
        if ((level.totaltime % 5) == 0)
            owner.A_SpawnProjectile("NemesisSparkleSpawner2",0,0,random(0,-360),2,random(0,360));

        if ((level.totaltime % 35) == 0)
            owner.A_GiveInventory("SemiNemDemonAmmo", 6);

        if ((level.totaltime % (35 * 2)) == 0)
            owner.A_GiveInventory("SemiNemShell", 3);
    }
}

class PowerNLegCrystalHeal : Powerup
{
    Default
    {
        Powerup.Duration -60;
    }

    override void DoEffect()
    {
        if ((level.totaltime % 2) == 0)
        {
            owner.GiveBody(1,450);
            owner.A_GiveInventory("PhaseArmor");
            owner.A_GiveInventory("NLegCrystalSpeedGiver",1);
            owner.A_GiveInventory("NemArmorBonus",1);
            owner.A_SpawnProjectile("NBlackSparkleSpawner",0,0,random(0,-360),2,random(0,360));
            owner.A_SpawnItemEx("NBlackPowerLineSpawner",random(32,-32),random(32,-32),random(8,48),0,0,random(1,4),0,128,0);
        }
    }
}

// ---------------------------- //
// ------ ENRAGED STUFF ------ //
// -------------------------- //

class PowerELegCrystalHeal : Powerup
{
    Default
    {
        Powerup.Duration -30;
    }

    override void DoEffect()
    {
        if ((level.totaltime % 4) == 0)
            owner.A_SpawnProjectile("RedSparkleSpawner",0,0,random(0,-360),2,random(0,360));
        if ((level.totaltime % 5) == 0)
            owner.A_SpawnItemEx("RedPowerLine",random(32,-32),random(32,-32),random(8,48),0,0,random(1,4),0,128,0);

        if ((level.totaltime % 2) == 0)
        {
            owner.GiveBody(1,250);
            owner.A_GiveInventory("RedArmor");
            owner.A_GiveInventory("ELegCrystalArmorGiver",1);
        }
    }
}

// ------------------------- //
// ------ HEM STUFF ------- //
// ----------------------- //

class AmmoRegenerate : Powerup
{
    Default
    {
        -COUNTITEM;
        +NOTIMEFREEZE;
        Powerup.Duration -120;
    }

    override void DoEffect()
    {
        if ((level.totaltime % 35) == 0)
        {
            if (owner.ACS_ScriptCall("Hem_GetCurrentHealth") > 0)
            {
                owner.A_GiveInventory("BulletMag", 3);
                owner.A_GiveInventory("NewShell", 3);
                owner.A_GiveInventory("Missile", 3);
                owner.A_GiveInventory("NewCell", 3);
                owner.A_GiveInventory("Gas", 3);
                owner.A_GiveInventory("DemonAmmo", 3);
                owner.A_GiveInventory("DustMana", 3);
            }
        }
    }
}

class ArmorRegenerate : Powerup
{
    Default
    {
        +NOTIMEFREEZE;
        Powerup.Duration -99999; // Hmm
    }

    override void DoEffect()
    {
        if ((level.totaltime % 35) == 0)
        {
            owner.TakeInventory("NewCell", 1, true, TIF_NOTAKEINFINITE);
            owner.GiveInventory("ArmorRegeneratorGiver", 3);
        }
    }
}

class HemLightArmorHealing : Powerup
{
    Default
    {
        Powerup.Duration -120;
        +NOTIMEFREEZE;
    }

    override void DoEffect()
    {
        if ((level.totaltime % 2) == 0)
            owner.A_SpawnItemEx("LightNemesisArmorShieldFX",0,0,0,0,0,0,0,SXF_NOCHECKPOSITION,160);

        // At 100/50 Health/Armour:
        // Zandronum = 10.8-ish seconds till full capacity
        // Here = 10.6-ish
        if ((level.totaltime % 7) == 0)
        {
            owner.GiveBody(1,300);
            owner.A_GiveInventory("LightNemesisArmorGiver", 1);
        }
        if ((level.totaltime % 5) == 0)
        {
            owner.GiveBody(2,300);
            owner.A_GiveInventory("LightNemesisArmorGiver", 2);
        }
    }
}

// ------------------------- //
// ------ MISC STUFF ------ //
// ----------------------- //

class PowerAscensionHeal : Powerup
{
    Default
    {
        Powerup.Duration -60;
    }

    override void DoEffect()
    {
        if ((level.totaltime % 2) == 0)
        {
            owner.GiveBody(1,999);
            owner.A_GiveInventory("LegendaryArmor");
            owner.A_GiveInventory("AscensionArmorGiver",1);
            owner.A_SpawnProjectile("AWhiteSparkleSpawner",0,0,random(0,-360),2,random(0,360));
            owner.A_SpawnItemEx("AWhitePowerLineSpawner",random(32,-32),random(32,-32),random(8,48),0,0,random(1,4),0,128,0);
        }
    }
}
