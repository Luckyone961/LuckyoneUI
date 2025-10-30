-- Addon namespace
local _, Private = ...

local L = Private.ElvUI and ElvUI[1].Libs.ACL:NewLocale('ElvUI', 'zhTW') or LibStub('AceLocale-3.0'):NewLocale('LuckyoneUI', 'zhTW')
if not L then return end

-- Copy the enUS.lua file here and replace the strings with the translated ones
-- Please contact me on Discord if you contributed to the translation of LuckyoneUI
-- I will verify your Pull Request on GitHub and add you to the AddOn credits
