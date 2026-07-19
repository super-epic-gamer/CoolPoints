extends Button

signal on_reset

func _ready() -> void:
	text = "Reset Points for "+ENum.Revformat(ENum.pow(SaveLoad.Data.points, 0.75))+" Cooler Points! 
	Formula:Points^0.75"
	$CoolerPointsLabel.text = "You Have: "+ENum.Revformat(SaveLoad.Data.coolerpoints)+" Cooler Points
	Multiplying Points by "+ENum.Revformat(ENum.pow(ENum.add(SaveLoad.Data.coolerpoints, 1) , 2))+"x
	(x+1)^2"

func _on_points_pressed() -> void:
	text = "Reset Points for "+ENum.Revformat(ENum.pow(SaveLoad.Data.points, 0.75))+" Cooler Points! 
	Formula:Points^0.75"

func _on_pressed() -> void:
	SaveLoad.Data.coolerpoints = ENum.add(SaveLoad.Data.coolerpoints, ENum.pow(SaveLoad.Data.points, 0.75))
	SaveLoad.Data.points = ENum.new(0, 0)
	$CoolerPointsLabel.text = "You Have: "+ENum.Revformat(SaveLoad.Data.coolerpoints)+" Cooler Points
	Multiplying Points by "+ENum.Revformat(ENum.pow(ENum.add(SaveLoad.Data.coolerpoints, 1) , 2))+"x
	(x+1)^2"
	text = "Reset Points for "+ENum.Revformat(ENum.pow(SaveLoad.Data.points, 0.75))+" Cooler Points! 
	Formula:Points^0.75"
	on_reset.emit()

func _on_reset_data() -> void:
	$CoolerPointsLabel.text = "You Have: "+ENum.Revformat(SaveLoad.Data.coolerpoints)+" Cooler Points
	Multiplying Points by "+ENum.Revformat(ENum.pow(ENum.add(SaveLoad.Data.coolerpoints, 1) , 2))+"x
	(x+1)^2"
	text = "Reset Points for "+ENum.Revformat(ENum.pow(SaveLoad.Data.points, 0.75))+" Cooler Points! 
	Formula:Points^0.75"
