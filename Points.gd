extends Button

func _ready() -> void:
	$PointsLabel.text = "You Have: "+ENum.Revformat(SaveLoad.Data.points)+" Points"

func _on_pressed() -> void:
	SaveLoad.Data.points = ENum.add(SaveLoad.Data.points, ENum.mul(1, ENum.pow(ENum.add(SaveLoad.Data.coolerpoints, 1), 2)))
	$PointsLabel.text = "You Have: "+ENum.Revformat(SaveLoad.Data.points)+" Points"

func _on_cooler_points_reset() -> void:
	$PointsLabel.text = "You Have: "+ENum.Revformat(SaveLoad.Data.points)+" Points"

func _on_reset_data() -> void:
	$PointsLabel.text = "You Have: "+ENum.Revformat(SaveLoad.Data.points)+" Points"
