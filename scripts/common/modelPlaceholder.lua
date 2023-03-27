--- BasicBuildables: modelPlaceholder.lua
--- @author SirLich

-- Sapiens
local resource = mjrequire "common/resource"
local model = mjrequire "common/model"
local gameObject = mjrequire "common/gameObject"
local typeMaps = mjrequire "common/typeMaps"

local mod = {
    loadOrder = 1,
}

local seatRemaps = {
    woodCraftingSupplies = "woodSeat",
    pine_woodStock = "woodSeat",
    orangeWoodCraftingSupplies = "orange_woodSeat"
}

local chairLegRemaps = {
    woodCraftingSupplies = "chairLeg",
    pine_woodStock = "chairLeg",
    orangeWoodCraftingSupplies = "orange_chairLeg"
}

local chairBackRemaps = {
    woodCraftingSupplies = "chairBack",
    pine_woodStock = "pine_chairBack",
    orangeWoodCraftingSupplies = "orange_chairBack"
}

-- Takes in a remap table, and returns the 'placeholderModelIndexForObjectTypeFunction' that can handle this data.
--- @param remaps table string->string mapping
local function createIndexFunction(remaps)
    local function inner(placeholderInfo, objectTypeIndex, placeholderContext)
        local objectKey = typeMaps:indexToKey(objectTypeIndex, gameObject.validTypes)
        local remap = remaps[objectKey]

        -- Return a remap if exists
        if remap ~= nil then
            return model:modelIndexForName(remap)
        end

        -- Else, return the default model associated with this resource
        local defaultModel = gameObject.types[objectKey].modelName


        return model:modelIndexForName(defaultModel)
    end

    return inner
end

function mod:onload(modelPlaceholder)
    local super_initRemaps = modelPlaceholder.initRemaps

    mod.modelPlaceholder = modelPlaceholder
    modelPlaceholder.initRemaps = function()
        super_initRemaps()

        modelPlaceholder:addModel("woodChair", {
            { 
                key = "woodCraftingSupplies_1",
                resourceTypeIndex = resource.types.woodCraftingSupplies.index,
                defaultModelName = "woodCraftingSupplies",
                placeholderModelIndexForObjectTypeFunction = createIndexFunction(chairLegRemaps)
            },
            { 
                key = "woodCraftingSupplies_2",
                resourceTypeIndex = resource.types.woodCraftingSupplies.index,
                defaultModelName = "woodCraftingSupplies",
                placeholderModelIndexForObjectTypeFunction = createIndexFunction(chairLegRemaps)
            },
            { 
                key = "woodCraftingSupplies_3",
                resourceTypeIndex = resource.types.woodCraftingSupplies.index,
                defaultModelName = "woodCraftingSupplies",
                placeholderModelIndexForObjectTypeFunction = createIndexFunction(chairLegRemaps)
            },
            { 
                key = "woodCraftingSupplies_4",
                resourceTypeIndex = resource.types.woodCraftingSupplies.index,
                defaultModelName = "woodCraftingSupplies",
                placeholderModelIndexForObjectTypeFunction = createIndexFunction(chairLegRemaps)
            },
            { 
                key = "woodCraftingSupplies_5",
                resourceTypeIndex = resource.types.woodCraftingSupplies.index,
                defaultModelName = "woodCraftingSupplies",
                placeholderModelIndexForObjectTypeFunction = createIndexFunction(seatRemaps)
            },
            { 
                key = "woodCraftingSupplies_6",
                resourceTypeIndex = resource.types.woodCraftingSupplies.index,
                defaultModelName = "woodCraftingSupplies",
                placeholderModelIndexForObjectTypeFunction = createIndexFunction(chairBackRemaps)
            },
            {
                key = "woodCraftingSupplies_store",
                offsetToStorageBoxWalkableHeight = true,
            },
        })
    end
end

return mod