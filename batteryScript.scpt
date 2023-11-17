repeat
	set chargeState to do shell script "pmset -g batt"
	set percentLeft to do shell script "pmset -g batt | egrep -ow '([0-9]{1,3})[%]' | egrep -ow '[0-9]{1,3}'"
	considering numeric strings
		if chargeState contains "Battery Power" and percentLeft ≤30 then
			display notification "🪫 Battery is LOW. Time to plug me in!" with title "Battery Alert"
		else if chargeState contains "AC Power" and percentLeft ≥90 then
			display notification "🔋 Battery is FULL. Time to un-plug me!" with title "Battery Alert"
		end if
	end considering
	delay 60
end repeat