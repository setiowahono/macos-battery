repeat
	set chargeState to do shell script "pmset -g batt"
	set percentLeft to do shell script "pmset -g batt | egrep -ow '([0-9]{1,3})[%]' | egrep -ow '[0-9]{1,3}'"
	considering numeric strings
		if chargeState contains "Battery Power" and percentLeft ≤ 40 then
			display notification "🪫 Time to plug me in" with title "Battery Charge Boundary"
		else if chargeState contains "AC Power" and percentLeft ≥ 80 then
			display notification "🔋 Time to unplug me" with title "Battery Charge Boundary"
		end if
	end considering
	delay 60
end repeat