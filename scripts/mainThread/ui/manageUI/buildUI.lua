--- Inca: manageUI.lua
--- @author SirLich

-- Sapiens
local constructable = mjrequire "common/constructable"

local mod = {
    loadOrder = 30,
}

function mod:onload(buildUI)
    local super_createItemList = buildUI.createItemList

    buildUI.createItemList = function()
        super_createItemList()

        table.insert(buildUI.itemList, constructable.types.woodChair.index)
    end
end

return mod