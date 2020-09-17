
function randomize_mul()
	local x = math.random(1, upper_num_limit)
	local y = math.random(1, upper_num_limit)
	task.text = (tostring(x) .. " * " .. tostring(y))
    li = {x * y}
    repeat
        li[2] = math.random(1, upper_num_limit * upper_num_limit)
    until li[2] ~= li[1]
    repeat
        li[3] = math.random(1, upper_num_limit * upper_num_limit)
    until li[3] ~= li[1] or li[3] ~= li[2]
    if (math.random(1, 2) == 1) then li[1], li[2] = li[2], li[1] end
    if (math.random(1, 2) == 1) then li[3], li[2] = li[2], li[3] end
    if (math.random(1, 2) == 1) then li[1], li[3] = li[3], li[1] end
    t1.text = li[1]
    t2.text = li[2]
    t3.text = li[3]
	if (li[1] == x * y) then answer = 1 end
	if (li[2] == x * y) then answer = 2 end
	if (li[3] == x * y) then answer = 3 end
end
