return {
    clear = function(tbl)
        return {}
    end,
    
    clone = function(tbl)
        local function cloneFunc(t)
            local clone = {}
            for i, v in pairs(tbl) do
                if type(v) == "table" then
                    clone[i] = cloneFunc(v)
                else
                    clone[i] = v
                end
            end
            return clone
        end

        return cloneFunc(tbl)
    end,

    sort = function(tbl, compareFunc)
        local n = #tbl
        compareFunc = compareFunc or function(a, b)
                return a < b
            end

        for i = 1, n - 1 do
            for j = 1, n - i do
                if compareFunc(tbl[j + 1], tbl[j]) then
                    tbl[j], tbl[j + 1] = tbl[j + 1], tbl[j]
                end
            end
        end
    end,

    insert = function(tbl, value, pos)
        pos = pos or (#tbl + 1)

        for i = #tbl, pos, -1 do
            tbl[i + 1] = tbl[i]
        end

        tbl[pos] = value
    end,

    find = function(tbl, value)
        for i, v in ipairs(tbl) do
            if v == value then
                return i
            end
        end
        return nil
    end,

    remove = function(tbl, pos)
        pos = pos or #tbl

        local removedValue = tbl[pos]

        for i = pos, #tbl - 1 do
            tbl[i] = tbl[i + 1]
        end

        tbl[#tbl] = nil

        return removedValue
    end,

    foreach = function(tbl, callback)
        print("foreach is deprecated, please use pairs loop!!")
        for i, v in pairs(tbl) do
            callback(i, v)
        end
    end,

    foreachi = function(tbl, callback)
        print("foreachi is deprecated, please use ipairs loop!!")
        for i, v in ipairs(tbl) do
            callback(i, v)
        end
    end,

    concat = function(tbl, sep, i, j)
        sep = sep or ""
        i = i or 1
        j = j or #tbl

        local result = ""
        for k = i, j do
            result = result .. tostring(tbl[k]) .. (k < j and sep or "")
        end

        return result
    end,

    pack = function(...)
        local result = {}
        local arg = {...}
        result.n = #arg
        for i = 1, result.n do
            result[i] = arg[i]
        end
        return result
    end,

    unpack = function(tbl, i, j)
        i = i or 1
        j = j or #tbl

        local function unpackHelper(tbl, index, last)
            if index > last then
                return
            else
                return tbl[index], unpackHelper(tbl, index + 1, last)
            end
        end

        return unpackHelper(tbl, i, j)
    end,

    move = function(src, from, to, dest)
        dest = dest or src
        local moved = {}
        local j = 1

        for i = from, to do
            dest[j] = src[i]
            moved[j] = dest[j]
            j = j + 1
        end

        for i = from, to do
            src[i] = nil
        end

        return moved
    end,

    getn = function(tbl)
        print("table.getn is deprecated, please use #tbl to get the length!!")
        return #tbl
    end,

    maxn = function(tbl)
        local maxIndex = 0

        for i, v in pairs(tbl) do
            if type(i) == "number" and i > maxIndex and math.floor(i) == i and i > 0 then
                maxIndex = i
            end
        end

        return maxIndex
    end
}
