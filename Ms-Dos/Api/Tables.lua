function Concat(t1, t2)
    for i=1,#t2 do
        t1[#t1+1] = t2[i]
    end
    return t1
end

function Unpack(t)
    local String = ""
    for i=1,#t do
        if i == #t then
            String = String..t[i]
        else
            String = String..t[i].." "
        end
    end
    return String
end

return { Concat = Concat, Unpack = Unpack }
