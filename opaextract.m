function opaextract(imginput,outputtxtsrc)
tic;
    %read into a matrix s
    s = imread(imginput);

    height = size(s,1);
    width = size(s,2);

    %For this example the max size is 100 bytes, or 800 bits, (bytes * = bits
    m1=100;
    
    %Go through each pixel data and save the least significant bit.
    k = 1;
    for i = 1 : height
        for j = 1 : width
            if (k <= m1)
                b1(k) = mod(double(s(i,j)),2);
                k = k + 1;
            end
        end
    end

    %Convert to string
    %Use a binary matrix multiply to do this
%     m=[];
fid=fopen('pro.txt','r');
y=fread(fid);
z=transpose(y);
message=char(z);
m = length(message) * 8;
fclose('all');
    fid = fopen('pro1.txt','r');
    b = fscanf(fid,'%1d'); 
    binaryVector = b;
    binValues = [ 128 64 32 16 8 4 2 1 ];
    binaryVector = binaryVector(:);

    if mod(length(binaryVector),8) ~= 0
        error('Length of binary vector must be a multiple of 8.');
    end

    binMatrix = reshape(binaryVector,8,m/8);
    textString = char(binValues*binMatrix);    

    %Print text 
    disp(textString);
fclose('all');
     fid=fopen(outputtxtsrc,'w');
 fwrite(fid,textString);
  disp('Message Extracted and saved to-')
  disp(outputtxtsrc);
    toc;
 end
