extends Node

const FILE_PATH: String = "user://TESTSaveFile.json"

var Data

func _save() -> void:
	var file: FileAccess = FileAccess.open(FILE_PATH, FileAccess.WRITE)
	file.store_var(Data)
	file.close()

func _load() -> void:
	if FileAccess.file_exists(FILE_PATH):
		var file: FileAccess = FileAccess.open(FILE_PATH, FileAccess.READ)
		var items: Dictionary = file.get_var()
		for i in items:
			if Data.has(i):
				Data[i] = items[i]
		file.close 

func _ready() -> void:
	Data = {
		"points": ENum.new(0, 0),
		"coolerpoints": ENum.new(0, 0),
	}
	_load()
	while true:
		await GFuncs.wait(2)
		_save()
