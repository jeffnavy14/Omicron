-----------------------------------
-- func: !updatecmdperm <command> <permission>
-- desc: Updates a GM command permissions
-----------------------------------

local commandObj = {}

commandObj.cmdprops = {
    permission = 5,
    parameters = 'si'
}

function update_permission(file_name, new_permission)

    local directories = {
        "C:\\Server\\LevelDown-LSB\\scripts\\commands\\",
        "C:\\Server\\LevelDown-LSB\\modules\\custom\\commands\\"
    }

    local updated = false

    -- Iterate over both directories
    for _, directory in ipairs(directories) do
        local file_path = directory .. file_name .. ".lua"  -- Always append .lua

        -- Debugging: Print file path to check concatenation
        print("Constructed file path: " .. file_path)

        -- Open the file for reading
        local file = io.open(file_path, "r")
        if file then
            local lines = {}
            for line in file:lines() do
                table.insert(lines, line)
            end
            file:close()

            -- Search and update the permission line
            for i, line in ipairs(lines) do
                if line:match("permission = %d") then
                    lines[i] = "    permission = " .. new_permission .. ","
                    updated = true
                    break
                end
            end

            -- If the permission line was found and updated, write the changes back to the file
            if updated then
                local file = io.open(file_path, "w")
                if not file then
                    print("Error: Unable to open file for writing: " .. file_path)
                    return
                end

                for _, line in ipairs(lines) do
                    file:write(line .. "\n")
                end
                file:close()
                print("File updated successfully in: " .. file_path)
                return  -- Exit once the file is updated
            end
        end
    end

    -- If the file was not found or updated
    if not updated then
        print("Error: permission line not found or file not found in any directory.")
    end
end

commandObj.onTrigger = function(player, file_name, new_permission)
    print("file_name: " .. tostring(file_name))
    print("new_permission: " .. tostring(new_permission))

    if not file_name or not new_permission then
        print("Error: Invalid command usage. Usage: !updatecmdperm <file_name> <new_permission>")
        return
    end

    new_permission = tonumber(new_permission)
    if not new_permission then
        print("Error: Invalid permission value. Please enter a number between 0 and 5.")
        return
    end

    if new_permission < 0 or new_permission > 5 then
        print("Error: permission must be between 0 and 5.")
        return
    end

    update_permission(file_name, new_permission)
end

return commandObj
