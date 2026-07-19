extends Node

func new(value: float, exponent: float):
	var newvalue
	var neg = false
	if (value == 0):
		return [0, 0]
	if round(exponent) != exponent:
		value *= 10**(exponent-floor(exponent))
		exponent = floor(exponent)
	if value < 0:
		value = -value
		neg = true
	if not exponent:
		exponent = floor(log(value)/log(10.0))
		value /= (10**exponent)
	if value >= 10:
		var exponentadd = floor(log(value)/log(10.0))
		exponent += exponentadd
		value /= (10**exponentadd)
	if value < 1:
		var exponentadd = ceil(log(1/value)/log(10.0))
		exponent -= exponentadd
		value *= (10**exponentadd)
	if neg == true:
		newvalue = [-value, exponent]
	else:
		newvalue = [value, exponent]
	if (newvalue[0] == INF) or (newvalue[0] == INF):
		push_error("Number too large; ", newvalue)
	return newvalue

func fix(value):
	if typeof(value) != TYPE_ARRAY:
		if (typeof(value) == TYPE_FLOAT) or (typeof(value) == TYPE_INT):
			return ENum.new(value, TYPE_NIL)
		else:
			push_error("Attempted to input an invalid type ", value)
			return TYPE_NIL
	else:
		return value

func add(value, value2):
	value = fix(value)
	value2 = fix(value2)
	if value2[1] > value[1]:
		var temp = value
		value = value2
		value2 = temp
	var expdiff = value[1]-value2[1]
	if expdiff >= 15:
		return value
	else:
		var val1 = (value[0]*(10**expdiff)+value2[0])/(10**expdiff)
		value = ENum.new(val1, value[1])
		return value

func sub(value, value2):
	value = fix(value)
	value2 = fix(value2)
	var expdiff = value[1]-value2[1]
	if expdiff >= 15:
		return value
	elif expdiff <= -15:
		return value2
	else:
		var val1 = (value[0]*(10**expdiff)-value2[0])/(10**expdiff)
		value = ENum.new(val1, value[1])
		return value

func mul(value, value2):
	value = fix(value)
	value2 = fix(value2)
	var exponent = value[1]+value2[1]
	var val1 = value[0]*value2[0]
	value = ENum.new(val1, exponent)
	return value

func div(value, value2):
	value = fix(value)
	value2 = fix(value2)
	var exponent = value[1]-value2[1]
	var val1 = value[0]/value2[0]
	value = ENum.new(val1, exponent)
	return value

func pow(value, value2):
	value = fix(value)
	value2 = fix(value2)
	if value[0] == 0:
		return [0, 0]
	elif value2[0] == 0:
		return [1, 0]
	print(value2)
	var exponentiator = Reverse(value2)
	if exponentiator == INF:
		push_error("Exponent way too big! Never do this!")
		return TYPE_NIL
	var base = value[1]+log(value[0])/log(10)
	base *= exponentiator
	var newval = ENum.new(1, base)
	return newval

func log10(value): # Can be modified to work for negatives but I dont really wanna
	value = fix(value)
	if (value[0] < 0) or (value[1] < 0):
		push_error("Negative number inputted into log function! ", value) 
	var num = value[1]
	num += log(value[0])/log(10)
	return num

func log(value, base): # Can be modified to work for negatives but I dont really wanna
	value = fix(value)
	if (value[0] < 0) or (value[1] < 0):
		push_error("Negative number inputted into log function! ", value) 
	var num = value[1]
	num += log(value[0])/log(10)
	return num/(log(base)/log(10))

func sqroot(value):
	value = fix(value)
	value[1] /= 2
	value[0] = sqrt(value[0])
	return ENum.new(value[0], value[1])

func root(value, base):
	value = fix(value)
	value[1] /= base
	value[0] = value[0]**(1.0/base)
	return ENum.new(value[0], value[1])

func Reverse(value: Array):
	if value[1] < 308:
		return value[0]*(10**value[1])
	else:
		push_warning("Attempted to reverse a large number;", value)
		return value[0]*(10**value[1])

func SciNotation(value: Array):
	if value[1] >= 1e10:
		return str(value[0]).pad_decimals(0)+"ee"+str(log(value[1])/log(10)).pad_decimals(4)
	else:
		return str(value[0]).pad_decimals(2)+"e"+str(value[1]).pad_decimals(0)

func Revformat(value: Array):
	if value[1] < 6: ##Change this to change how many 0s it takes to switch to scientific
		return str(value[0]*(10**value[1])).pad_decimals(2)
	else:
		if value[1] >= 1e10:
			return str(value[0]).pad_decimals(0)+"ee"+str(log(value[1])/log(10)).pad_decimals(4)
		else:
			return str(value[0]).pad_decimals(2)+"e"+str(value[1]).pad_decimals(0)
