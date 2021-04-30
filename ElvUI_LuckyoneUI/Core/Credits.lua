local L1UI, E, L, V, P, G = unpack(select(2, ...))

local sort = sort
local tinsert = table.insert
local tconcat = table.concat

local AUTHORS = {
	'|cffFF7D0ALuckyone|r (EU) - LaughingSkull',
}

local CODING = {
	'|cff0070DEAzilroka|r',
	'|cFF8866ccSimpy|r',
	'|cffF58CBARepooc|r',
	'|cffFF7D0AMerathilis|r',
}

local TESTERS = {
	'|cff00FF96AltBridge|r',
	'|cff69CCF0Sniefer|r',
	'|cffABD473Xyf|r',
	'|cffC41F3BKringel|r',
	'|cffF58CBAIllusion|r',
}

local SUPPORT = {
	'|cffe6cc80Badbrain|r',
	'|cffe6cc80Calmcacil|r',
	'|cffe6cc80DaPaKnat|r',
	'|cffe6cc80Debeleus|r',
	'|cffe6cc80DevinDog|r',
	'|cffe6cc80Dukes|r',
	'|cffe6cc80Fooseq|r',
	'|cffe6cc80Garbar|r',
	'|cffe6cc80Kenneth|r',
	'|cffe6cc80Liam|r',
	'|cffe6cc80Littlesack|r',
	'|cffe6cc80Lox|r',
	'|cffe6cc80Midnatt|r',
	'|cffe6cc80MonkeyHack|r',
	'|cffe6cc80ShowNoMercy|r',
	'|cffe6cc80Treelyté|r',
	'|cffe6cc80Triplebeamdreams|r',
}

local function SortList(a, b)
	return E:StripString(a) < E:StripString(b)
end

sort(AUTHORS, SortList)
sort(CODING, SortList)
sort(TESTERS, SortList)
sort(SUPPORT, SortList)

for _, name in pairs(AUTHORS) do
	tinsert(L1UI.CreditsList, name)
end
L1UI.AUTHORS_STRING = tconcat(AUTHORS, '|n')

for _, name in pairs(CODING) do
	tinsert(L1UI.CreditsList, name)
end
L1UI.CODING_STRING = tconcat(CODING, '|n')

for _, name in pairs(TESTERS) do
	tinsert(L1UI.CreditsList, name)
end
L1UI.TESTER_STRING = tconcat(TESTERS, '|n')

for _, name in pairs(SUPPORT) do
	tinsert(L1UI.CreditsList, name)
end
L1UI.SUPPORT_STRING = tconcat(SUPPORT, '|n')
