extends Button

signal reset_data
func _on_pressed() -> void:
	SaveLoad.Data.points = ENum.new(0,0)
	SaveLoad.Data.coolerpoints = ENum.new(0,0)
	reset_data.emit()
