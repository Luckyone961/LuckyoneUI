local E, L, V, P, G = unpack(ElvUI)
local MyPluginName = "LuckyoneUI"
local LUI = E:GetModule("LuckyoneUI");

local IsAddOnLoaded = IsAddOnLoaded

--Setup AddOns
function LUI:AddonSetup(addon)

    --BigWigs
    if IsAddOnLoaded('BigWigs') then
        LUI:GetBigWigsProfile()
        E:Print('BigWigs profile has been set.')
    end

    --ProjectAzilroka
    if IsAddOnLoaded('ProjectAzilroka') then
        LUI:GetPAProfile()
        E:Print('ProjectAzilroka profile has been set.')
    end

    E:StaggeredUpdateAll(nil, true)

    PluginInstallStepComplete.message = "AddOn profiles have been set"
    PluginInstallStepComplete:Show()
end
