# Russia-ProtonM-Nauka-kOS-Scripts-01082021

Craft files for the rocket, and a version without the parts needed for kOS, are included.

Link to Youtube video:
https://www.youtube.com/watch?v=PaWnVn5obwE

This is the Kerbal Operating System code for a Proton-M rocket launch, carrying the Nauka module to the ISS.

The code launches the nauka module into a parking orbit.

The docking with the ISS has to be done manually.

The boot.ks file opens the kOS Terminal of the kOS processor directly after launching the vessel. This only works if you right-click one of the two kOS processors attached to the Nauka module, and select boot file "boot.ks". This file has to be placed inside a "Boot" foder in the KSP/Ships/Script directory.

///NOTES///

-> The ISS has a high partcount, and sometimes explodes if you approach it, so make sure to quicksave before you get close to it.

-> The ISS craft file includes the Crew Dragon, Soyuz and Progress vehicles currently docked to the station.

-> The solar panels of the Soyuz and Progress are extremely glitchy, as you can see in the video.

-> You have to stage the payload fairing manually, after second stage separation.

-> Tested in Kerbal Space Program Version 1.12.
