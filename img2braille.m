% Args  : img_name = string, filename of image
%         crop     = boolean, if image doens't fit into (n*2)*(m*4) exactly, select
%                      whether to crop edges or add blank pixels (optional, defaults to true)
% Rets  : braille  = array of html character entities

function braille = img2braille(img_name, crop)
    if (~exist('crop'))
        crop = 1;
    end

    img = imread(img_name);

    if (size(img, 3) == 3)  % if RGB image
        img = rgb2gray(img);  % convert to greyscale intensity map
    end

    if (size(unique(img)) == [2 1])  % if image has only 2 colour values no need to dither
        temp = unique(img);  % set lower value to 0 (black)
        img(img == temp(1)) = 0;
        img = logical(img);  % and convert to logical type (higher value becomes 1)
    elseif (isnumeric(img))  % if greyscale image
        img = dither(img);  % dither to give 1-bit image
    end

    img = ~img;  % 'Invert' image since my list treats dark and light in the reverse way to matlab

    character_map = [  % all 256 characters sorted by predetermined 'binary value'
        '&#10240;';'&#10368;';'&#10304;';'&#10432;';'&#10272;';'&#10400;';'&#10336;';'&#10464;';
        '&#10256;';'&#10384;';'&#10320;';'&#10448;';'&#10288;';'&#10416;';'&#10352;';'&#10480;';
        '&#10248;';'&#10376;';'&#10312;';'&#10440;';'&#10280;';'&#10408;';'&#10344;';'&#10472;';
        '&#10264;';'&#10392;';'&#10328;';'&#10456;';'&#10296;';'&#10424;';'&#10360;';'&#10488;';
        '&#10244;';'&#10372;';'&#10308;';'&#10436;';'&#10276;';'&#10404;';'&#10340;';'&#10468;';
        '&#10260;';'&#10388;';'&#10324;';'&#10452;';'&#10292;';'&#10420;';'&#10356;';'&#10484;';
        '&#10252;';'&#10380;';'&#10316;';'&#10444;';'&#10284;';'&#10412;';'&#10348;';'&#10476;';
        '&#10268;';'&#10396;';'&#10332;';'&#10460;';'&#10300;';'&#10428;';'&#10364;';'&#10492;';
        '&#10242;';'&#10370;';'&#10306;';'&#10434;';'&#10274;';'&#10402;';'&#10338;';'&#10466;';
        '&#10258;';'&#10386;';'&#10322;';'&#10450;';'&#10290;';'&#10418;';'&#10354;';'&#10482;';
        '&#10250;';'&#10378;';'&#10314;';'&#10442;';'&#10282;';'&#10410;';'&#10346;';'&#10474;';
        '&#10266;';'&#10394;';'&#10330;';'&#10458;';'&#10298;';'&#10426;';'&#10362;';'&#10490;';
        '&#10246;';'&#10374;';'&#10310;';'&#10438;';'&#10278;';'&#10406;';'&#10342;';'&#10470;';
        '&#10262;';'&#10390;';'&#10326;';'&#10454;';'&#10294;';'&#10422;';'&#10358;';'&#10486;';
        '&#10254;';'&#10382;';'&#10318;';'&#10446;';'&#10286;';'&#10414;';'&#10350;';'&#10478;';
        '&#10270;';'&#10398;';'&#10334;';'&#10462;';'&#10302;';'&#10430;';'&#10366;';'&#10494;';
        '&#10241;';'&#10369;';'&#10305;';'&#10433;';'&#10273;';'&#10401;';'&#10337;';'&#10465;';
        '&#10257;';'&#10385;';'&#10321;';'&#10449;';'&#10289;';'&#10417;';'&#10353;';'&#10481;';
        '&#10249;';'&#10377;';'&#10313;';'&#10441;';'&#10281;';'&#10409;';'&#10345;';'&#10473;';
        '&#10265;';'&#10393;';'&#10329;';'&#10457;';'&#10297;';'&#10425;';'&#10361;';'&#10489;';
        '&#10245;';'&#10373;';'&#10309;';'&#10437;';'&#10277;';'&#10405;';'&#10341;';'&#10469;';
        '&#10261;';'&#10389;';'&#10325;';'&#10453;';'&#10293;';'&#10421;';'&#10357;';'&#10485;';
        '&#10253;';'&#10381;';'&#10317;';'&#10445;';'&#10285;';'&#10413;';'&#10349;';'&#10477;';
        '&#10269;';'&#10397;';'&#10333;';'&#10461;';'&#10301;';'&#10429;';'&#10365;';'&#10493;';
        '&#10243;';'&#10371;';'&#10307;';'&#10435;';'&#10275;';'&#10403;';'&#10339;';'&#10467;';
        '&#10259;';'&#10387;';'&#10323;';'&#10451;';'&#10291;';'&#10419;';'&#10355;';'&#10483;';
        '&#10251;';'&#10379;';'&#10315;';'&#10443;';'&#10283;';'&#10411;';'&#10347;';'&#10475;';
        '&#10267;';'&#10395;';'&#10331;';'&#10459;';'&#10299;';'&#10427;';'&#10363;';'&#10491;';
        '&#10247;';'&#10375;';'&#10311;';'&#10439;';'&#10279;';'&#10407;';'&#10343;';'&#10471;';
        '&#10263;';'&#10391;';'&#10327;';'&#10455;';'&#10295;';'&#10423;';'&#10359;';'&#10487;';
        '&#10255;';'&#10383;';'&#10319;';'&#10447;';'&#10287;';'&#10415;';'&#10351;';'&#10479;';
        '&#10271;';'&#10399;';'&#10335;';'&#10463;';'&#10303;';'&#10431;';'&#10367;';'&#10495;'
    ];
    character_map = cellstr(character_map);  % make it into an actual array of strings

    [y_max, x_max] = size(img);

    if (~crop)  % add blank pixels
        if (mod(y_max, 4))
            temp = logical(zeros(4 - mod(y_max, 4), x_max));
            img = vertcat (img, temp);  % join arrays
            y_max = y_max + 4 - mod(y_max, 4);  % update y_max
        end
        if (mod(x_max, 2))
            temp = logical(zeros(y_max, 1));
            img = horzcat (img, temp);
            x_max = x_max + 1;
        end
    end

    x_max = floor(x_max ./ 2) .* 2;  % some edge pixels are lost when size isn't divisible into braille chars w/out remainder
    y_max = floor(y_max ./ 4) .* 4;  % no effect if image size already fits into characters exactly
    braille = cell(y_max ./ 4, x_max ./ 2);  % preallocate output cell

    y = 1;  % rows

    while (y < y_max)
        x = 1;  % columns

        while (x < x_max)
            % multiply each 'bit' of image pattern by correct power of 2 to give same format as predefined character patterns
            temp = img(y, x) .* 128 + img(y + 1, x) .* 64 + img(y + 2, x) .* 32 + img(y, x + 1) .* 16 + img(y + 1, x + 1) .* 8 + img(y + 2, x + 1) .* 4 + img(y + 3, x) .* 2 + img(y + 3, x + 1); 
            braille((y - 1) ./ 4 + 1, (x - 1) ./ 2 + 1) = character_map(temp + 1);  % 1-indexed arrays... always get me
            x = x + 2;
        end

        y = y + 4;
    end

    file_id = fopen(strcat(img_name, '.html'), 'w');
    % some html to make it render in browser nicely
    fprintf(file_id, '<!DOCTYPE html>\n<html>\n<head>\n<meta http-equiv="content-type" content="text/html; charset=utf-8">\n</head>\n<body>\n<pre>\n');

    for y = 1:floor(y_max ./ 4)  % have to print row-by-row because cellstr magic
        fprintf(file_id, '%s', braille{y, :});
        fprintf(file_id, '\n');
    end

    fprintf(file_id, '</pre>\n</body>\n</html>\n');  % html end tags
    fclose(file_id);
end
