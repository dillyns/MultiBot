-- REWARD UI INITIALIZATION --

MultiBot.Reward.UI = MultiBot.newFrame(MultiBot, -754, 238, 28, 384, 512)
MultiBot.Reward.UI:SetMovable(true)
MultiBot.Reward.UI:Hide()

local tFrame = MultiBot.Reward.UI.addFrame("Icon", -313, 443, 28, 64, 64)
tFrame.addTexture("Interface\\AddOns\\MultiBot\\Textures\\Reward.blp")
tFrame:SetFrameLevel(0)

local tFrame = MultiBot.Reward.UI.addFrame("TopLeft", -128, 256, 28, 256, 256)
tFrame.addTexture("Interface/ItemTextFrame/UI-ItemText-TopLeft")
tFrame:SetFrameLevel(1)

local tFrame = MultiBot.Reward.UI.addFrame("TopRight", -0, 256, 28, 128, 256)
tFrame.addTexture("Interface/Spellbook/UI-SpellbookPanel-TopRight")
tFrame:SetFrameLevel(2)

local tFrame = MultiBot.Reward.UI.addFrame("BottomLeft", -128, 0, 28, 256, 256)
tFrame.addTexture("Interface/ItemTextFrame/UI-ItemText-BotLeft")
tFrame:SetFrameLevel(3)

local tFrame = MultiBot.Reward.UI.addFrame("BottomRight", -0, 0, 28, 128, 256)
tFrame.addTexture("Interface/Spellbook/UI-SpellbookPanel-BotRight")
tFrame:SetFrameLevel(4)

local tOverlay = MultiBot.Reward.UI.addFrame("Overlay", -48, 97, 28, 310, 330)
tOverlay.addText("Title", MultiBot.info.reward, "CENTER", 16, 226, 13)
tOverlay.addText("Pages", "0/0", "CENTER", 16, 196, 13)
tOverlay:SetFrameLevel(5)

tOverlay.movButton("Move", -270, 354, 50, MultiBot.tips.move.reward, MultiBot.Reward.UI)

tOverlay.wowButton("<", -182, 351, 15, 18, 13)
.doLeft = MultiBot.Reward.pageLeft

tOverlay.wowButton(">", -82, 351, 15, 18, 11)
.doLeft = MultiBot.Reward.pageRight

tOverlay.wowButton("X", 13, 381, 17, 20, 11)
.doLeft = function ()
	MultiBot.Reward.UI:Hide()
end

-- BOT REWARD UI GROUPS --
-- Each group (U01-U12) represents a bot unit in the reward window
-- Each unit displays:
--   - Unit name and class
--   - Six reward buttons (R1-R6) for available rewards
--   - An inspector button to examine the unit
-- Up to 12 units can be displayed per page, with pagination via < > buttons

-- GROUP:U01 --

local tFrame = tOverlay.addFrame("U01", -156, 282, 23, 154, 48)
tFrame.addText("U01", "|cffffcc00NAME - CLASS|r", "BOTTOMLEFT", 20, 28, 13)
tFrame.addButton("R1", -130, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R2", -104, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R3", -78, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R4", -52, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R5", -26, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R6", -0, 0, "inv_misc_questionmark", "Text")
tFrame.addFrame("Inspector", -137, 26, 16)
.addButton("Inspect", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp", "Inspect")
.doLeft = MultiBot.Reward.inspectUnit

-- GROUP:U02 --

local tFrame = tOverlay.addFrame("U02", 0, 282, 23, 154, 48)
tFrame.addText("U02", "|cffffcc00NAME - CLASS|r", "BOTTOMLEFT", 20, 28, 13)
tFrame.addButton("R1", -130, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R2", -104, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R3", -78, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R4", -52, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R5", -26, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R6", -0, 0, "inv_misc_questionmark", "Text")
tFrame.addFrame("Inspector", -137, 26, 16)
.addButton("Inspect", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp", "Inspect")
.doLeft = MultiBot.Reward.inspectUnit

-- GROUP:U03 --

local tFrame = tOverlay.addFrame("U03", -156, 228, 23, 154, 48)
tFrame.addText("U03", "|cffffcc00NAME - CLASS|r", "BOTTOMLEFT", 20, 28, 13)
tFrame.addButton("R1", -130, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R2", -104, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R3", -78, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R4", -52, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R5", -26, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R6", -0, 0, "inv_misc_questionmark", "Text")
tFrame.addFrame("Inspector", -137, 26, 16)
.addButton("Inspect", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp", "Inspect")
.doLeft = MultiBot.Reward.inspectUnit

-- GROUP:U04 --

local tFrame = tOverlay.addFrame("U04", 0, 228, 23, 154, 48)
tFrame.addText("U04", "|cffffcc00NAME - CLASS|r", "BOTTOMLEFT", 20, 28, 13)
tFrame.addButton("R1", -130, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R2", -104, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R3", -78, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R4", -52, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R5", -26, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R6", -0, 0, "inv_misc_questionmark", "Text")
tFrame.addFrame("Inspector", -137, 26, 16)
.addButton("Inspect", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp", "Inspect")
.doLeft = MultiBot.Reward.inspectUnit

-- GROUP:U05 --

local tFrame = tOverlay.addFrame("U05", -156, 174, 23, 154, 48)
tFrame.addText("U05", "|cffffcc00NAME - CLASS|r", "BOTTOMLEFT", 20, 28, 13)
tFrame.addButton("R1", -130, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R2", -104, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R3", -78, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R4", -52, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R5", -26, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R6", -0, 0, "inv_misc_questionmark", "Text")
tFrame.addFrame("Inspector", -137, 26, 16)
.addButton("Inspect", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp", "Inspect")
.doLeft = MultiBot.Reward.inspectUnit

-- GROUP:U06 --

local tFrame = tOverlay.addFrame("U06", 0, 174, 23, 154, 48)
tFrame.addText("U06", "|cffffcc00NAME - CLASS|r", "BOTTOMLEFT", 20, 28, 13)
tFrame.addButton("R1", -130, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R2", -104, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R3", -78, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R4", -52, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R5", -26, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R6", -0, 0, "inv_misc_questionmark", "Text")
tFrame.addFrame("Inspector", -137, 26, 16)
.addButton("Inspect", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp", "Inspect")
.doLeft = MultiBot.Reward.inspectUnit

-- GROUP:U07 --

local tFrame = tOverlay.addFrame("U07", -156, 120, 23, 154, 48)
tFrame.addText("U07", "|cffffcc00NAME - CLASS|r", "BOTTOMLEFT", 20, 28, 13)
tFrame.addButton("R1", -130, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R2", -104, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R3", -78, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R4", -52, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R5", -26, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R6", -0, 0, "inv_misc_questionmark", "Text")
tFrame.addFrame("Inspector", -137, 26, 16)
.addButton("Inspect", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp", "Inspect")
.doLeft = MultiBot.Reward.inspectUnit

-- GROUP:U08 --

local tFrame = tOverlay.addFrame("U08", 0, 120, 23, 154, 48)
tFrame.addText("U08", "|cffffcc00NAME - CLASS|r", "BOTTOMLEFT", 20, 28, 13)
tFrame.addButton("R1", -130, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R2", -104, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R3", -78, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R4", -52, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R5", -26, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R6", -0, 0, "inv_misc_questionmark", "Text")
tFrame.addFrame("Inspector", -137, 26, 16)
.addButton("Inspect", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp", "Inspect")
.doLeft = MultiBot.Reward.inspectUnit

-- GROUP:U09 --

local tFrame = tOverlay.addFrame("U09", -156, 66, 23, 154, 48)
tFrame.addText("U09", "|cffffcc00NAME - CLASS|r", "BOTTOMLEFT", 20, 28, 13)
tFrame.addButton("R1", -130, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R2", -104, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R3", -78, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R4", -52, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R5", -26, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R6", -0, 0, "inv_misc_questionmark", "Text")
tFrame.addFrame("Inspector", -137, 26, 16)
.addButton("Inspect", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp", "Inspect")
.doLeft = MultiBot.Reward.inspectUnit

-- GROUP:U10 --

local tFrame = tOverlay.addFrame("U10", 0, 66, 23, 154, 48)
tFrame.addText("U10", "|cffffcc00NAME - CLASS|r", "BOTTOMLEFT", 20, 28, 13)
tFrame.addButton("R1", -130, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R2", -104, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R3", -78, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R4", -52, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R5", -26, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R6", -0, 0, "inv_misc_questionmark", "Text")
tFrame.addFrame("Inspector", -137, 26, 16)
.addButton("Inspect", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp", "Inspect")
.doLeft = MultiBot.Reward.inspectUnit

-- GROUP:U11 --

local tFrame = tOverlay.addFrame("U11", -156, 12, 23, 154, 48)
tFrame.addText("U11", "|cffffcc00NAME - CLASS|r", "BOTTOMLEFT", 20, 28, 13)
tFrame.addButton("R1", -130, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R2", -104, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R3", -78, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R4", -52, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R5", -26, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R6", -0, 0, "inv_misc_questionmark", "Text")
tFrame.addFrame("Inspector", -137, 26, 16)
.addButton("Inspect", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp", "Inspect")
.doLeft = MultiBot.Reward.inspectUnit

-- GROUP:U12 --

local tFrame = tOverlay.addFrame("U12", 0, 12, 23, 154, 48)
tFrame.addText("U12", "|cffffcc00NAME - CLASS|r", "BOTTOMLEFT", 20, 28, 13)
tFrame.addButton("R1", -130, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R2", -104, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R3", -78, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R4", -52, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R5", -26, 0, "inv_misc_questionmark", "Text")
tFrame.addButton("R6", -0, 0, "inv_misc_questionmark", "Text")
tFrame.addFrame("Inspector", -137, 26, 16)
.addButton("Inspect", 0, 0, "Interface\\AddOns\\MultiBot\\Icons\\filter_none.blp", "Inspect")
.doLeft = MultiBot.Reward.inspectUnit
