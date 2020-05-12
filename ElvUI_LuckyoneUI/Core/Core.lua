local E, L, V, P, G = unpack(ElvUI)
local MyPluginName = "LuckyoneUI"
local L1UI = E:GetModule("LuckyoneUI");

local IsAddOnLoaded = IsAddOnLoaded

--Setup AddOns
function L1UI:AddonSetup(addon)

    --BigWigs
    if IsAddOnLoaded('BigWigs') then
        L1UI:GetBigWigsProfile()
        E:Print('BigWigs profile has been set.')
    end

    --ProjectAzilroka
    if IsAddOnLoaded('ProjectAzilroka') then
        L1UI:GetPAProfile()
        E:Print('ProjectAzilroka profile has been set.')
    end

    E:StaggeredUpdateAll(nil, true)

    PluginInstallStepComplete.message = "AddOn profiles have been set"
    PluginInstallStepComplete:Show()
end
