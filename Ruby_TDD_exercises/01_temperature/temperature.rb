def ftoc(ftemp)
	val = Float(ftemp)
	val = (val - 32) / 1.8
	return val.round
end

def ctof(ctemp)
	val = Float(ctemp)
	val = val * 9 / 5 + 32
	if val > 97 && val < 100
		return val.round(1)
	else
	return val.round
	end
end