function randomize_mul()
	local x = math.random(LEFT_BOUND, RIGHT_BOUND)
	local y = math.random(LEFT_BOUND, RIGHT_BOUND)
	task.text = (tostring(x) .. " * " .. tostring(y))
  answer = math.random(1, 3)
	print(answer)
	if answer == 3 then
		t3.text = x * y
	end
	if answer == 2 then
		t2.text = x * y
	end
	if answer == 1 then
		t1.text = x * y
	end
	if answer ~= 3 then
		t3.text = math.random(LEFT_BOUND * LEFT_BOUND, RIGHT_BOUND * RIGHT_BOUND)
	end
	if answer ~= 2 then
		t2.text = math.random(LEFT_BOUND * LEFT_BOUND, RIGHT_BOUND * RIGHT_BOUND)
	end
	if answer ~= 1 then
		t1.text = math.random(LEFT_BOUND * LEFT_BOUND, RIGHT_BOUND * RIGHT_BOUND)
	end
end
