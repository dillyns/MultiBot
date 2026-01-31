MultiBot.Reward = MultiBot.Reward or {}
MultiBot.Reward.rewards = {}
MultiBot.Reward.units = {}
MultiBot.Reward.currentPage = 1
MultiBot.Reward.maxPages = 1
MultiBot.Reward.pageSize = 12
MultiBot.Reward.state = false

MultiBot.Reward.openRewards = function()
	if(MultiBot.Reward.state == false) then return end
	local rewardsCount = MultiBot.IF(GetNumQuestChoices() > 6, 6, GetNumQuestChoices())
	MultiBot.Reward.rewards = {}
	MultiBot.Reward.units = {}

	-- Collect eligible raid or party members (bots)
	if(GetNumRaidMembers() > 0) then
		for i = 1, 40 do
			local tUnit = UnitName("raid" .. i)
			if(tUnit ~= nil) then
				local tBot = MultiBot.getBot(tUnit)
				if(tBot ~= nil and tBot.name ~= UnitName("player")) then
					tBot.rewarded = false
					table.insert(MultiBot.Reward.units, tBot)
				end
			end
		end
	elseif(GetNumPartyMembers() > 0) then
		for i = 1, 5 do
			local tUnit = UnitName("party" .. i)
			if(tUnit ~= nil) then
				local tBot = MultiBot.getBot(tUnit)
				if(tBot ~= nil and tBot.name ~= UnitName("player")) then
					tBot.rewarded = false
					table.insert(MultiBot.Reward.units, tBot)
				end
			end
		end
	end

	local unitsCount = #MultiBot.Reward.units

	-- Display rewards for eligible bots with pagination
	if(unitsCount > 0 and rewardsCount > 0) then
		-- Populate quest rewards (max 6 choices)
		for i = 1, rewardsCount do
			local tLink = GetQuestItemLink("CHOICE", i)
			local tName, tIcon = GetQuestItemInfo("CHOICE", i)
			MultiBot.Reward.rewards[i] = { tLink, tName, tIcon }
		end

		MultiBot.Reward.resetUISlots()

		local tOverlay = MultiBot.Reward.UI.frames["Overlay"]

		MultiBot.Reward.maxPages = math.ceil(unitsCount / MultiBot.Reward.pageSize)
		tOverlay.setText("Pages", MultiBot.Reward.currentPage .. "/" .. MultiBot.Reward.maxPages)
		tOverlay.buttons["<"]:Show()
		tOverlay.buttons[">"]:Show()

		if(MultiBot.Reward.currentPage == 1) then tOverlay.buttons["<"]:Hide() end
		if(MultiBot.Reward.currentPage == MultiBot.Reward.maxPages) then tOverlay.buttons[">"]:Hide() end

		MultiBot.Reward.displayPage()
		MultiBot.Reward.UI:Show()
	end
end

MultiBot.Reward.resetUISlots = function()
	-- Reset and hide all UI reward slots (U01-U12)
	for i = 1, MultiBot.Reward.pageSize do
		local tID = "U" .. MultiBot.IF(i < 10, "0", "") .. i
		local tUnit = MultiBot.Reward.UI.frames["Overlay"].frames[tID]
		for j = 1, 6 do tUnit.buttons["R" .. j]:Hide() end
		tUnit:Hide()
	end
end

MultiBot.Reward.displayPage = function()
	MultiBot.Reward.resetUISlots()
	local rewardsCount = #MultiBot.Reward.rewards
	local unitsCount = #MultiBot.Reward.units
	local tPageStart = ((MultiBot.Reward.currentPage - 1) * MultiBot.Reward.pageSize) + 1
	local unitsToDisplay = math.min(MultiBot.Reward.pageSize, unitsCount - tPageStart + 1)

	for i = 1, unitsToDisplay do
		local tBot = MultiBot.Reward.units[tPageStart + i - 1]
		if not tBot.rewarded then
			local tUnit = MultiBot.Reward.setUnitRewards(i, tBot)
			-- Set up reward buttons for the unit
			for j = 1, rewardsCount do
				local tReward = tUnit.buttons["R" .. j]
				tReward:Show()
				tReward.link = MultiBot.Reward.rewards[j][1]
				tReward.setButton(MultiBot.Reward.rewards[j][3], MultiBot.Reward.rewards[j][1])
				tReward.doLeft = MultiBot.Reward.chooseReward
			end
		end
	end
end

MultiBot.Reward.setUnitRewards = function(pIndex, pBot)
	local tID = "U" .. MultiBot.IF(pIndex < 10, "0", "") .. pIndex
	local tUnit = MultiBot.Reward.UI.frames["Overlay"].frames[tID]
	tUnit.setText(tID, "|cffffcc00" .. pBot.name .. " - " .. pBot.class .. "|r")
	tUnit.class = pBot.class
	tUnit.name = pBot.name
	tUnit:Show()
	return tUnit
end

MultiBot.Reward.inspectUnit = function(pButton)
	InspectUnit(pButton.getName())
end

MultiBot.Reward.chooseReward = function(pButton)
	pButton.parent:Hide()
	SendChatMessage("r " .. pButton.link, "WHISPER", nil, pButton.getName())

	local allRewarded = true
	for _, unit in pairs(MultiBot.Reward.units) do
		if unit.name == pButton.getName() then
			unit.rewarded = true
		elseif not unit.rewarded then
			allRewarded = false
		end
	end

	if allRewarded then
		MultiBot.Reward.UI:Hide()
	end
end

MultiBot.Reward.pageLeft = function(pButton)
	local tOverlay = MultiBot.Reward.UI.frames["Overlay"]
	local tReward = MultiBot.Reward

	tReward.currentPage = tReward.currentPage - 1
	tOverlay.setText("Pages", tReward.currentPage .. "/" .. tReward.maxPages)
	tOverlay.buttons[">"].doShow()

	if(tReward.currentPage == 1) then pButton.doHide() end

	MultiBot.Reward.displayPage()
end

MultiBot.Reward.pageRight = function(pButton)
	local tOverlay = MultiBot.Reward.UI.frames["Overlay"]
	local tReward = MultiBot.Reward

	tReward.currentPage = tReward.currentPage + 1
	tOverlay.setText("Pages", tReward.currentPage .. "/" .. tReward.maxPages)
	tOverlay.buttons["<"].doShow()

	if(tReward.currentPage == tReward.maxPages) then pButton.doHide() end

	MultiBot.Reward.displayPage()
end