﻿img2braille
===========

Because redrawing images in black and white using Unicode Braille characters is... useful?

It's in Matlab code right now, it doesn't really need to be, so I should change it to something that's less Matlab.

What is...
----------
###img2braille.m
Matlab code, takes the name of an image file as an input and returns an array of HTML character entities that 'draw' that image. This array is also written to `img_name.html` with added tags to generate a viewable HTML document. 
Also has the option to to crop or extend an image that isn't divisible into the 2×4 “pixel” Braille characters.

###character table.txt
Giant list of all 256 Unicode Braille characters, their names, and corresponding 8-bit binary represnetaion of their pattern. 
The number of each dot in the Braille characters is as follows.

	[1] [4]
	[2] [5]
	[3] [6]
	[7] [8]

The binary and hex representations treat 1 as the MSB and 8 as LSB. For example, `⢭` would be represented by `0b10110101` or `0xB5`. 
[This list](http://symbolcodes.tlt.psu.edu/bylanguage/braillechart.html) was very useful in making this part easy for me.

###test.png
![So good.](./test.png "Such a beautiful image.")

A wonderful hand (MS Paint) crafted test image.

###test.png.html
[Sample output](./test.png.html "Still a beautiful image.") from test image.

Why is the output HTML?
-----------------------
Matlab didn't like use of the actual Braille characters in script and this is an nice, easy way of making the output renderable without using any special characters.
