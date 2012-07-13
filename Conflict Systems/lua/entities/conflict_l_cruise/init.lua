include("shared.lua");
AddCSLuaFile("shared.lua");

-- ----- --- ----- -- ----- --- ----- -- ----- --- ----- -- ----- --- ----- -- ----- --- ----- -- ----- --- ----- --
-- Turret's Initialization Function: Define common variables here.                                                --
-- ----- --- ----- -- ----- --- ----- -- ----- --- ----- -- ----- --- ----- -- ----- --- ----- -- ----- --- ----- --
function ENT:Initialize()   

	self:SetDisplayName ("S.W.A.R.M. Launcher")	-- Display Name of the Weapon
	self:SetFlavourText ("Famous for its use in capitol ships, ", "the swarm is a devistating weapon.")
	self.ReloadTime	   	= 30			-- Time, in seconds, between shots fired
	self.ClipSize		= 3 			-- how many shots per clip?
	self.ClipReload     = 60            -- Time, in seconds, it takes to reload the primary clip
	self.TargetLockTime	= 5.5			-- Time it takes, in seconds, for the turret to aquire a new target
	self.Accuracy	   	= 0.5 			-- Accuracy of turret, maximum degree of deviation before it will autofire.  Usually want to keep this low.
	self.TrackingSpeed 	= 35			-- Tracking speed in degrees per second
	self.OptimumRange	= 3000			-- Distance where the turret is most accurate
	self.FalloffRange	= 3000			-- OptimumRange +/- FalloffRange = 50% added inaccuracy
	
	self:FireSound("PropAPC.FireRocket")	
	
	self:AddResource("energy",50)		-- use this amount of the defined resource per shot.
	self:AddResource("coolant",10)		-- can be used multiple times to define multiple resources


	--Setup the base class
	self:Setup()
	
	--Always add the turret AFTER the setup, only one per base.
	--Calling this function twice will overwrite the first call.
	--            (         Model Name               ,    Texture        ,Size)
	self:AddTurret( "models/conflict_small_laser.mdl", "conflict_default", 23 )
end

-- ----- --- ----- -- ----- --- ----- -- ----- --- ----- -- ----- --- ----- -- ----- --- ----- -- ----- --- ----- --
-- OnAttack(): Called every time the weapon fires.                                                                --
-- ----- --- ----- -- ----- --- ----- -- ----- --- ----- -- ----- --- ----- -- ----- --- ----- -- ----- --- ----- --
function ENT:OnAttack()
	self:LaunchMissile("conflict_missile_cruise")
end

-- ----- --- ----- -- ----- --- ----- -- ----- --- ----- -- ----- --- ----- -- ----- --- ----- -- ----- --- ----- --
-- OnReload(): Called every time the weapon reloads it's clip                                                     --
-- ----- --- ----- -- ----- --- ----- -- ----- --- ----- -- ----- --- ----- -- ----- --- ----- -- ----- --- ----- --
function ENT:OnReload()
end

