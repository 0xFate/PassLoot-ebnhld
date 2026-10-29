# PassLoot-3-3-5a

A refreshed **vibecoded** version of [PassLoot](http://www.wowace.com/projects/pass-loot/) — a WoW Wrath of the Lich King (3.3.5a) addon that automates loot rolling (need/greed/pass/disenchant) based on configurable rules.

## Original Author

PassLoot was originally created by **Odlaw** (WoW Ace project `pass-loot`, WoWI ID 6124). The original addon targeted WoW patch 4.0.0.0 with an Interface version of 30300.

This version (`passloot-ebnhld`) is a refreshed, vibecoded fork maintained by **0xFate** (`jp <0xfate@gmail.com>`) for use on the **Ebonhold** WoW WotLK server.

## What This Does

PassLoot automatically decides how to roll on loot based on rules you configure. Each rule can match items by name, type, subtype, equip slot, quality, level, binding, and more, and then automatically rolls need, greed, disenchant, or passes accordingly.

## Auto Leave Party (New Feature)

Added in this refreshed version: a global **Auto Leave Party** toggle under General Options. When enabled:

1. PassLoot tracks every item you roll on (need/greed/disenchant) via `START_LOOT_ROLL`.
2. It watches `CHAT_MSG_LOOT` for `LOOT_ROLL_WON` / `LOOT_ROLL_ALL_PASSED` messages to know when each roll resolves.
3. Once the **Frozen Orb** is looted (the Random Dungeon Finder end signal) and every item you rolled on has been resolved, PassLoot automatically leaves the party.
4. State resets only after you actually leave the party — another member leaving mid-run won't wipe tracking.

This prevents you from being stuck in an RDF group after all relevant loot is resolved.

## Translations

`Frozen Orb` translations verified against wotlk.evowow.com for all 8 supported locales:
- enUS: Frozen Orb
- deDE: Gefrorene Kugel
- esES: Orbe congelado
- frFR: Orbe gelé
- ruRU: Ледяной шар
- koKR: 얼어붙은 보주
- zhCN: 冰冻宝珠
- zhTW: 冰凍寶珠

## Credits

- **Odlaw** — Original author of PassLoot
- **0xFate** — Refreshed vibecoded version, Auto Leave Party feature, and maintenance for Ebonhold
- **Ace3 library authors** — Embedded libraries (AceAddon, AceDB, AceLocale, AceConfig, AceGUI, LibSink, etc.)
- **LibBabble-Inventory-3.0 / LibBabble-TalentTree-3.0** — Item and talent tree localization

## Interface Version

30300 (WoW Wrath of the Lich King 3.3.5a)
