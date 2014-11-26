img2braille.m
=============

Because redrawing black and white images using Unicode Braille characters is... useful?

It's in Matlab code right now, it doesn't really need to be, so I should change it to something that's less Matlab.

What is...
----------
###character table.txt
Giant list of all 256 Unicode Braille characters, their names, and corresponding 8-bit binary represnetaion of their pattern.
The number of each dot in the Braille characters is as follows.

	[1] [4]
	[2] [5]
	[3] [6]
	[7] [8]

The binary and hex representations treat 1 as the MSB and 8 as LSB. For example, `⢭` would be represented by `0b10110101` or `0xB5`. 

###test.tif
A wonderfully crafted test image.
![So good.](https://github.com/matthewcarr/img2braille/blob/master/test.tif "Such a beautiful image")

###test.tif.html.raw
Sample raw output from the test image.

###test.tif.html
Sample output after a bit of love.
