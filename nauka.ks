clearscreen.
wait 4.
stage.
wait 3.
lock throttle to 1.
stage.
set target to "Iss".
lock inclination to 90 - (target:orbit:inclination + 3.6).
set runmode to "Liftoff".
set fairing to "n".
set stage1 to "y".
set stage2 to "n".
set tval to 0.
set tes1 to "n".

until runmode = "Done" {
	if runmode = "Liftoff" {
		if ship:apoapsis > target:orbit:apoapsis {
			lock throttle to 0.
			set runmode to "Coastphase".
		}
		turn(inclination).
	}
	
	if ship:apoapsis > 30000  and stage1 = "y" {
		stage.
		wait 1.
		lock throttle to .0003.
		wait 1.
		stage.
		set stage1 to "n".
		set stage2 to "y".
	}
	if ship:stagedeltav(ship:stagenum):current < 20 and stage2 = "y" {
		wait 1.
		lock throttle to 0.
		stage.
		wait 2.
		stage.
		toggle ag1.
		lock throttle to 1.
		set stage2 to "n".
	}
	
	if runmode = "Coastphase" {
		if eta:apoapsis < 21 and tes1 = "n" {
			toggle ag1.
			wait 2.
			lock throttle to 1.
			toggle ag1.
			set tes1 to "y".
		}
		if ship:periapsis > 150000 {
				lock throttle to 0.
				wait 5.
				stage.
				wait 3.
				toggle ag2.
				set runmode to "Done".
		}
	}
	
	printVesselStats().
}

function printVesselStats {
	clearscreen.
	print "Telemetry:" at(1, 4).
	print "Altitude above sea level: " + round(ship:altitude) + "m" at(10, 5).
	print "Current apoapsis: " + round(ship:apoapsis) + "m" at (10, 6).
	print "Current periapsis: " + round(ship:periapsis) + "m" at (10, 7).
	print "Orbital velocity: " + round(ship:velocity:orbit:mag * 3.6) + "km/h" at(10, 9).
	print "Ship longitude: " + round(ship:longitude) + "º" at (10, 10).
	print "Target longitude: " + round(target:longitude) + "º" at (10, 11).
}

function turn {
	parameter heading.
	if alt:radar < 100 {
		lock angle to 90.
		lock steering to heading(heading, angle).
	}
	else if alt:radar < 1000 {
		lock angle to  (-1 * alt:radar) / 90 + 90.
		lock steering to heading(heading, angle).
	}
	else if alt:radar > 60000 {
		lock steering to prograde.
	}
	else{
		lock angle to 94 - 1.03287 * alt:radar^.4.
		lock steering to heading(heading, angle).
	}
}

