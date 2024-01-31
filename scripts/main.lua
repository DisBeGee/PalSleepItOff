local utility = StaticFindObject("/Script/Pal.Default__PalUtility")

if not utility:IsValid() then
	print("Could not find utility! Sleep It Off failed to load!")
	return
end

function curePal(characterActor)
	local palParam = utility:GetIndividualCharacterParameterByActor(characterActor)
	
	local catSaveParam = palParam["SaveParameter"]
	
	if (catSaveParam["WorkerSick"] ~= 0) then
		print("Curing %s", characterActor:GetFullName())
		ExecuteWithDelay(5000, function()
			catSaveParam["WorkerSick"] = 0
		end)
	end

end

RegisterHook("/Game/Pal/Blueprint/Controller/AIAction/BaseCamp/BP_AIActionBaseCamp_Sleep.BP_AIActionBaseCamp_Sleep_C:ActionStart", function(self, ControlledPawn)
	curePal(self:get():GetOuter():GetOuter().Character)
end)

RegisterHook("/Game/Pal/Blueprint/Controller/AIAction/BaseCamp/BP_AIActionBaseCamp_InSpa.BP_AIActionBaseCamp_InSpa_C:ActionStart", function(self, ControlledPawn)
	curePal(self:get():GetOuter():GetOuter().Character)
end)

print("Successfully loaded Sleep It Off!")