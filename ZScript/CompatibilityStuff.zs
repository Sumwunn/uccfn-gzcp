// ----------------------------------- //
// ----- PowerTargeter Rewrites ----- //
// --------------------------------- //

// ---------------------------- //
// ----- LEGENDARY STUFF ----- //
// -------------------------- //

class LegendaryPowerSphereEffect : Powerup
{
    Default
    {
        Powerup.Duration -45;
        +INVENTORY.AUTOACTIVATE;
        +INVENTORY.ALWAYSPICKUP;
    }

    override void DoEffect()
    {
        // Delay emulation lololol
        if ((level.totaltime % 5) == 0)
            owner.A_SpawnProjectile("LegendaryYellowSparkleSpawner",0,0,random(0,-360),2,random(0,360));
    }
}

class LegendaryCrystalHealing : Powerup
{
    Default
    {
        Powerup.Duration -30;
        +INVENTORY.AUTOACTIVATE;
        +INVENTORY.ALWAYSPICKUP;
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

class NemesisPowerSphereEffect : Powerup
{
    Default
    {
        Powerup.Duration -60;
        +INVENTORY.AUTOACTIVATE;
        +INVENTORY.ALWAYSPICKUP;
    }

    override void DoEffect()
    {
        if ((level.totaltime % 5) == 0)
            owner.A_SpawnProjectile("NemesisSparkleSpawner2",0,0,random(0,-360),2,random(0,360));
    }
}

class NemesisPowerHealing : Powerup
{
    Default
    {
        Powerup.Duration -60;
        +INVENTORY.AUTOACTIVATE;
        -INVENTORY.ALWAYSPICKUP;
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

class NemesisPowerAmmoGiver : Powerup
{
    Default
    {
        Powerup.Duration -60;
        +INVENTORY.AUTOACTIVATE;
        +INVENTORY.ALWAYSPICKUP;
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

class NCrystalHealing : Powerup
{
    Default
    {
        Powerup.Duration -60;
        +INVENTORY.AUTOACTIVATE;
        +INVENTORY.ALWAYSPICKUP;
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

class ELegendaryCrystalHealing : Powerup
{
    Default
    {
        Powerup.Duration -30;
        +INVENTORY.AUTOACTIVATE;
        +INVENTORY.ALWAYSPICKUP;
    }

    override void DoEffect()
    {
        if ((level.totaltime % 4) == 0)
            owner.A_CustomMissile("RedSparkleSpawner",0,0,random(0,-360),2,random(0,360));
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
        Powerup.Duration -120;
        Powerup.Color "255 0 0", 0.4;
        +INVENTORY.AUTOACTIVATE;
        -INVENTORY.ALWAYSPICKUP;
        -COUNTITEM;
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

// ------------------------- //
// ------ MISC STUFF ------ //
// ----------------------- //

class AscensionHealing : Powerup
{
    Default
    {
        Powerup.Duration -60;
        +INVENTORY.AUTOACTIVATE;
        +INVENTORY.ALWAYSPICKUP;
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
