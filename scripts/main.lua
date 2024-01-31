RegisterHook("Function /Game/Pal/Blueprint/Controller/AIAction/BaseCamp/BP_AIActionBaseCamp_Sleep.BP_AIActionBaseCamp_Sleep_C:ActionStart", function(self, ControlledPawn)
	local characterActor = self:get():GetOuter():GetOuter().Character
	
	local palParam = utility:GetIndividualCharacterParameterByActor(characterActor)
	
	local catSaveParam = palParam["SaveParameter"]
	
	if (catSaveParam["WorkerSick"] ~= 0) then
		print("Curing %s", characterActor:GetFullName())
		ExecuteWithDelay(5000, function()
			catSaveParam["WorkerSick"] = 0
		end)
	end
end)

print("Successfully loaded Sleep It Off!")