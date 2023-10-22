N = 8  -- board size

-- print("Board size is ", N)

-- check whether position (n,c) is free from attacks
function isplaceok (a, n, c)
    for i = 1, n-1 do   -- for each queen already placed
        if (a[i] == c) or       -- same column?
            (a[i] - i == c - n) or      -- same diagonal?
            (a[i] + i == c + n) then    -- same diagonal as well?\
            return false
        end
    end
    return true     -- no attacks; place is OK
end


-- print a board
function printsolution (a)
    for i = 1, N do     -- for each row
        for j = 1, N do -- for each column
            -- write "X" or "-" plus a space
            io.write(a[i] == j and "x" or "-", " ")
        end 
        io.write("\n")
    end
    io.write("\n")
end

-- add to board 'a' all queens from 'n' to 'N'
function addqueen (a, n)
    if n > N then    -- all queens have been placed?
        printsolution(a)
    else    -- try to place n-the queen
        for c = 1, N do
            if isplaceok(a, n, c) then
                a[n] = c     -- place n-th queen at column 'c'
                addqueen(a, n + 1)
            end
        end
    end
end

-- run the main program
addqueen({}, 1)