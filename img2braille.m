% Args   img_name = filename of image
% Usage  img_name = 'test.png';
%        braille = img2braille(img_name);
function braille = img2braille(img_name)
    img = imread(img_name);
    if (size(img, 3) == 3)  % if RGB image
        img = rgb2gray(img);  % convert to greyscale intensity map
    end
    if (isnumeric(img))  % if greyscale image
        img = dither(img);  % dither greyscale to b&w
    end

    [y_max, x_max] = size(img);
    x = 1;  % columns
    x_max = x_max - 2;  % some edge pixels lost when size isn't divisible without remainder
    y = 1;  % rows
    y_max = y_max - 4;
    braille = zeros(floor(y_max ./ 4), floor(x_max ./ 2), 'uint16');
    %braille = char(zeros(floor(y_max ./ 4), floor(x_max ./ 2))); % works for single chars but not string
    %braille = cell(floor(y_max ./ 4), floor(x_max ./ 2)); % might work for strings
    while (y < y_max)
        while (x < x_max)
            temp1 = img(y + 0, x + 0) .* 10 ^ 7 + img(y + 0, x + 1) .* 10 ^ 6 + img(y + 0, x + 2) .* 10 ^ 5 + img(y + 0, x + 3) .* 10 ^ 4 + img(y + 1, x + 0) .* 10 ^ 3 + img(y + 1, x + 1) .* 10 ^ 2 + img(y + 1, x + 2) .* 10 ^ 1 + img(y + 1, x + 3) .* 10 ^ 0;  % todo: change this, it's terrible
            switch temp1
            case 00000000  % todo: invert matching patterns
                temp2 = 10240; % html character code (i.e. "&#10240;")
            case 10000000
                temp2 = 10241;
            case 11000000
                temp2 = 10243;
            case 11100000
                temp2 = 10247;
            case 11110000
                temp2 = 10255;
            case 11111000
                temp2 = 10271;
            case 11111100
                temp2 = 10303;
            case 11111110
                temp2 = 10367;
            case 11111111
                temp2 = 10495;
            case 11111101
                temp2 = 10431;
            case 11111010
                temp2 = 10335;
            case 11111011
                temp2 = 10463;
            case 11111001
                temp2 = 10399;
            case 11110100
                temp2 = 10287;
            case 11110110
                temp2 = 10351;
            case 11110111
                temp2 = 10479;
            case 11110101
                temp2 = 10415;
            case 11110010
                temp2 = 10319;
            case 11110011
                temp2 = 10447;
            case 11110001
                temp2 = 10383;
            case 11101000
                temp2 = 10263;
            case 11101100
                temp2 = 10295;
            case 11101110
                temp2 = 10359;
            case 11101111
                temp2 = 10487;
            case 11101101
                temp2 = 10423;
            case 11101010
                temp2 = 10327;
            case 11101011
                temp2 = 10455;
            case 11101001
                temp2 = 10391;
            case 11100100
                temp2 = 10279;
            case 11100110
                temp2 = 10343;
            case 11100111
                temp2 = 10471;
            case 11100101
                temp2 = 10407;
            case 11100010
                temp2 = 10311;
            case 11100011
                temp2 = 10439;
            case 11100001
                temp2 = 10375;
            case 11010000
                temp2 = 10251;
            case 11011000
                temp2 = 10267;
            case 11011100
                temp2 = 10299;
            case 11011110
                temp2 = 10363;
            case 11011111
                temp2 = 10491;
            case 11011101
                temp2 = 10427;
            case 11011010
                temp2 = 10331;
            case 11011011
                temp2 = 10459;
            case 11011001
                temp2 = 10395;
            case 11010100
                temp2 = 10283;
            case 11010110
                temp2 = 10347;
            case 11010111
                temp2 = 10475;
            case 11010101
                temp2 = 10411;
            case 11010010
                temp2 = 10315;
            case 11010011
                temp2 = 10443;
            case 11010001
                temp2 = 10379;
            case 11001000
                temp2 = 10259;
            case 11001100
                temp2 = 10291;
            case 11001110
                temp2 = 10355;
            case 11001111
                temp2 = 10483;
            case 11001101
                temp2 = 10419;
            case 11001010
                temp2 = 10323;
            case 11001011
                temp2 = 10451;
            case 11001001
                temp2 = 10387;
            case 11000100
                temp2 = 10275;
            case 11000110
                temp2 = 10339;
            case 11000111
                temp2 = 10467;
            case 11000101
                temp2 = 10403;
            case 11000010
                temp2 = 10307;
            case 11000011
                temp2 = 10435;
            case 11000001
                temp2 = 10371;
            case 10100000
                temp2 = 10245;
            case 10110000
                temp2 = 10253;
            case 10111000
                temp2 = 10269;
            case 10111100
                temp2 = 10301;
            case 10111110
                temp2 = 10365;
            case 10111111
                temp2 = 10493;
            case 10111101
                temp2 = 10429;
            case 10111010
                temp2 = 10333;
            case 10111011
                temp2 = 10461;
            case 10111001
                temp2 = 10397;
            case 10110100
                temp2 = 10285;
            case 10110110
                temp2 = 10349;
            case 10110111
                temp2 = 10477;
            case 10110101
                temp2 = 10413;
            case 10110010
                temp2 = 10317;
            case 10110011
                temp2 = 10445;
            case 10110001
                temp2 = 10381;
            case 10101000
                temp2 = 10261;
            case 10101100
                temp2 = 10293;
            case 10101110
                temp2 = 10357;
            case 10101111
                temp2 = 10485;
            case 10101101
                temp2 = 10421;
            case 10101010
                temp2 = 10325;
            case 10101011
                temp2 = 10453;
            case 10101001
                temp2 = 10389;
            case 10100100
                temp2 = 10277;
            case 10100110
                temp2 = 10341;
            case 10100111
                temp2 = 10469;
            case 10100101
                temp2 = 10405;
            case 10100010
                temp2 = 10309;
            case 10100011
                temp2 = 10437;
            case 10100001
                temp2 = 10373;
            case 10010000
                temp2 = 10249;
            case 10011000
                temp2 = 10265;
            case 10011100
                temp2 = 10297;
            case 10011110
                temp2 = 10361;
            case 10011111
                temp2 = 10489;
            case 10011101
                temp2 = 10425;
            case 10011010
                temp2 = 10329;
            case 10011011
                temp2 = 10457;
            case 10011001
                temp2 = 10393;
            case 10010100
                temp2 = 10281;
            case 10010110
                temp2 = 10345;
            case 10010111
                temp2 = 10473;
            case 10010101
                temp2 = 10409;
            case 10010010
                temp2 = 10313;
            case 10010011
                temp2 = 10441;
            case 10010001
                temp2 = 10377;
            case 10001000
                temp2 = 10257;
            case 10001100
                temp2 = 10289;
            case 10001110
                temp2 = 10353;
            case 10001111
                temp2 = 10481;
            case 10001101
                temp2 = 10417;
            case 10001010
                temp2 = 10321;
            case 10001011
                temp2 = 10449;
            case 10001001
                temp2 = 10385;
            case 10000100
                temp2 = 10273;
            case 10000110
                temp2 = 10337;
            case 10000111
                temp2 = 10465;
            case 10000101
                temp2 = 10401;
            case 10000010
                temp2 = 10305;
            case 10000011
                temp2 = 10433;
            case 10000001
                temp2 = 10369;
            case 01000000
                temp2 = 10242;
            case 01100000
                temp2 = 10246;
            case 01110000
                temp2 = 10254;
            case 01111000
                temp2 = 10270;
            case 01111100
                temp2 = 10302;
            case 01111110
                temp2 = 10366;
            case 01111111
                temp2 = 10494;
            case 01111101
                temp2 = 10430;
            case 01111010
                temp2 = 10334;
            case 01111011
                temp2 = 10462;
            case 01111001
                temp2 = 10398;
            case 01110100
                temp2 = 10286;
            case 01110110
                temp2 = 10350;
            case 01110111
                temp2 = 10478;
            case 01110101
                temp2 = 10414;
            case 01110010
                temp2 = 10318;
            case 01110011
                temp2 = 10446;
            case 01110001
                temp2 = 10382;
            case 01101000
                temp2 = 10262;
            case 01101100
                temp2 = 10294;
            case 01101110
                temp2 = 10358;
            case 01101111
                temp2 = 10486;
            case 01101101
                temp2 = 10422;
            case 01101010
                temp2 = 10326;
            case 01101011
                temp2 = 10454;
            case 01101001
                temp2 = 10390;
            case 01100100
                temp2 = 10278;
            case 01100110
                temp2 = 10342;
            case 01100111
                temp2 = 10470;
            case 01100101
                temp2 = 10406;
            case 01100010
                temp2 = 10310;
            case 01100011
                temp2 = 10438;
            case 01100001
                temp2 = 10374;
            case 01010000
                temp2 = 10250;
            case 01011000
                temp2 = 10266;
            case 01011100
                temp2 = 10298;
            case 01011110
                temp2 = 10362;
            case 01011111
                temp2 = 10490;
            case 01011101
                temp2 = 10426;
            case 01011010
                temp2 = 10330;
            case 01011011
                temp2 = 10458;
            case 01011001
                temp2 = 10394;
            case 01010100
                temp2 = 10282;
            case 01010110
                temp2 = 10346;
            case 01010111
                temp2 = 10474;
            case 01010101
                temp2 = 10410;
            case 01010010
                temp2 = 10314;
            case 01010011
                temp2 = 10442;
            case 01010001
                temp2 = 10378;
            case 01001000
                temp2 = 10258;
            case 01001100
                temp2 = 10290;
            case 01001110
                temp2 = 10354;
            case 01001111
                temp2 = 10482;
            case 01001101
                temp2 = 10418;
            case 01001010
                temp2 = 10322;
            case 01001011
                temp2 = 10450;
            case 01001001
                temp2 = 10386;
            case 01000100
                temp2 = 10274;
            case 01000110
                temp2 = 10338;
            case 01000111
                temp2 = 10466;
            case 01000101
                temp2 = 10402;
            case 01000010
                temp2 = 10306;
            case 01000011
                temp2 = 10434;
            case 01000001
                temp2 = 10370;
            case 00100000
                temp2 = 10244;
            case 00110000
                temp2 = 10252;
            case 00111000
                temp2 = 10268;
            case 00111100
                temp2 = 10300;
            case 00111110
                temp2 = 10364;
            case 00111111
                temp2 = 10492;
            case 00111101
                temp2 = 10428;
            case 00111010
                temp2 = 10332;
            case 00111011
                temp2 = 10460;
            case 00111001
                temp2 = 10396;
            case 00110100
                temp2 = 10284;
            case 00110110
                temp2 = 10348;
            case 00110111
                temp2 = 10476;
            case 00110101
                temp2 = 10412;
            case 00110010
                temp2 = 10316;
            case 00110011
                temp2 = 10444;
            case 00110001
                temp2 = 10380;
            case 00101000
                temp2 = 10260;
            case 00101100
                temp2 = 10292;
            case 00101110
                temp2 = 10356;
            case 00101111
                temp2 = 10484;
            case 00101101
                temp2 = 10420;
            case 00101010
                temp2 = 10324;
            case 00101011
                temp2 = 10452;
            case 00101001
                temp2 = 10388;
            case 00100100
                temp2 = 10276;
            case 00100110
                temp2 = 10340;
            case 00100111
                temp2 = 10468;
            case 00100101
                temp2 = 10404;
            case 00100010
                temp2 = 10308;
            case 00100011
                temp2 = 10436;
            case 00100001
                temp2 = 10372;
            case 00010000
                temp2 = 10248;
            case 00011000
                temp2 = 10264;
            case 00011100
                temp2 = 10296;
            case 00011110
                temp2 = 10360;
            case 00011111
                temp2 = 10488;
            case 00011101
                temp2 = 10424;
            case 00011010
                temp2 = 10328;
            case 00011011
                temp2 = 10456;
            case 00011001
                temp2 = 10392;
            case 00010100
                temp2 = 10280;
            case 00010110
                temp2 = 10344;
            case 00010111
                temp2 = 10472;
            case 00010101
                temp2 = 10408;
            case 00010010
                temp2 = 10312;
            case 00010011
                temp2 = 10440;
            case 00010001
                temp2 = 10376;
            case 00001000
                temp2 = 10256;
            case 00001100
                temp2 = 10288;
            case 00001110
                temp2 = 10352;
            case 00001111
                temp2 = 10480;
            case 00001101
                temp2 = 10416;
            case 00001010
                temp2 = 10320;
            case 00001011
                temp2 = 10448;
            case 00001001
                temp2 = 10384;
            case 00000100
                temp2 = 10272;
            case 00000110
                temp2 = 10336;
            case 00000111
                temp2 = 10464;
            case 00000101
                temp2 = 10400;
            case 00000010
                temp2 = 10304;
            case 00000011
                temp2 = 10432;
            case 00000001
                temp2 = 10368;
            end
            braille((y - 1) ./ 4 + 1, (x - 1) ./ 2 + 1) = temp2;
            x = x + 2;
        end
        x = 1;
        y = y + 4;
    end
    dlmwrite(strcat(img_name, '.html.raw'), braille, ';')
end
