extends Control


func _on_Vehicle_fuel_updated(fuel):
	$FuelInfo.value = fuel
