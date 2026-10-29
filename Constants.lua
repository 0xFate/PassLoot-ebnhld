local L = LibStub("AceLocale-3.0"):GetLocale("PassLoot");
local PassLoot = LibStub("AceAddon-3.0"):GetAddon("PassLoot");

PassLoot.DefaultTemplate = {
  { "Desc", L["Temp Description"] },
  { "Loot", {  -- Choices: "de", "pass", "greed", "need", disabled is an empty table
    -- [1] = "de",
    -- [2] = "need",
    -- [3] = "greed",
  } },
};
PassLoot.FontGold = "|cffffcc00";
PassLoot.FontWhite = "|cffffffff";
PassLoot.FontRed = "|cffff0000";
PassLoot.NumRuleListLines = 6;
PassLoot.NumItemListLines = 5;
PassLoot.RuleListLineHeight = 16;
PassLoot.ItemListLineHeight = 16;
PassLoot.DebugVar = false;
PassLoot.NumFilterLines = 8;
PassLoot.FilterLineHeight = 16;
PassLoot.RollOrder = { "need", "de", "greed", "pass" };
PassLoot.RollOrderToIndex = {};
for Key, Value in pairs(PassLoot.RollOrder) do
  PassLoot.RollOrderToIndex[Value] = Key;
end
-- PassLoot.RollMsg = {
  -- ["need"] = L["Rolling need on %item% (%rule%)"],
  -- ["greed"] = L["Rolling greed on %item% (%rule%)"],
  -- ["de"] = L["Rolling disenchant on %item% (%rule%)"],
  -- ["pass"] = L["Rolling pass on %item% (%rule%)"],
  -- ["ignore"] = L["Ignoring %item% (%rule%)"],
-- };
PassLoot.RollMethod = {
  ["need"] = 1,
  ["greed"] = 2,
  ["de"] = 3,
  ["pass"] = 0,
};

-- WoW build-version feature flags (TOC targets Interface 30300 / WotLK).
PassLoot.WoW30 = select(4, GetBuildInfo()) >= 30000;
PassLoot.WoW302 = select(4, GetBuildInfo()) >= 30200;
PassLoot.WoW400 = select(4, GetBuildInfo()) >= 40000;

-- Set the width of a UIDropDownMenu, abstracting the argument-order change between WoW 2.x and 3.x+.
function PassLoot:SetDropdownWidth(Frame, Width)
  if ( self.WoW30 ) then
    UIDropDownMenu_SetWidth(Frame, Width);
  else
    UIDropDownMenu_SetWidth(Width, Frame);
  end
end

-- Wrap a dropdown OnClick/initialize handler so the `this` vs first-argument difference is hidden.
function PassLoot:DropdownHandler(Func)
  if ( self.WoW30 ) then
    return function(...) Func(...) end;
  else
    return function(...) Func(this, ...) end;
  end
end
