% function lsbembedd(inputtxtsrc,inputimgsrc)
tic;
    %reads a image into a matrix 'c'
    %must be in freemat start folder
    c = imread('x.jpg');
    c=rgb2gray(c);
    [x y] = size(c);
binImage = zeros(x,y,8);
binImage1 = zeros(x,y,8);
%     message1=[];
%      fid = fopen('pro.txt','r');
%      message1 = fscanf(fid,'%1d'); 
% fid=fopen(inputtxtsrc,'r');
% y=fread(fid);
% z=transpose(y);
% message=char(z);
% message = dlmread('pro.txt');
%     message=transpose(message1);
     message = '0101010100';

    %m is the length of the message in bits
    m = length(message) * 8;

    %Convert Message to binary vector
    AsciiCode = uint8(message); %Message in Ascii int form
    binaryString = transpose(dec2bin(AsciiCode,8));
    binaryString = binaryString(:);

    N = length(binaryString);
    b = zeros(N,1); %b is a vector of bits

    for k = 1:N
        if(binaryString(k) == '1')
            b(k) = 1;
        else
            b(k) = 0;
        end
    end

    %Set Up for LSB
    s = c;
    height = size(c,1);
    width = size(c,2);
      
    %LSB Algorithm
    %This goes to each byte, if the least significant bit is not the bit of the message position, flip it, else do nothing
    k = 1;
    for i = 1 : height
        for j = 1 : width
             LSB = mod(double(c(i,j)), 2);
            if (k>m || LSB == b(k))
                s(i,j) = c(i,j);
            else
                if(LSB == 1)
                    s(i,j) = c(i,j) - 1;
                else
                    s(i,j) = c(i,j) + 1;
                end
            k = k + 1;
             end
        end
    end
    
     %Write image
    imwrite(s, 'hidden.jpg');
    
    for l=1:x
        for w=1:y
            temp = dec2bin(c(l,w),8);
                for q=1:8
                    binImage(l,w,q) = str2num(temp(q));
                end
        end
    end

for l=1:x
        for w=1:y
            temp1 = dec2bin(s(l,w),8);
                for g=1:8
                    binImage1(l,w,g) = str2num(temp1(g));
                end
        end
end
    mse1=0;
 for l=1:x
    for w=1:y
           
        mse1=(mse1+((binImage1(l,w,8)-binImage(l,w,8))^2));
      
            
    end
end
mse1=mse1/(l*w);

psnr=10*log10((255*255)/mse1);
disp('PSNR value is');
disp(psnr);
%  disp(b);
%  fclose('all');
%  fid=fopen('pro1.txt','w');
%  fprintf(fid,'%1d',b);
%  message
    toc;
%  end
