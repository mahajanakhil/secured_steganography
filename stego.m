function stego(inputtxtsrc,inputimgsrc,outputtxtsrc)
tic;
r=imread(inputimgsrc); %  to read the image
r=rgb2gray(r); % to convert from colour to gray
[x y] = size(r); %
binImage = zeros(x,y,8);
figure(1)
imshow(r);
m=[];
   fid = fopen(inputtxtsrc,'r');
    m = fscanf(fid,'%1d');   
%     m=str2num(m);
% m=[0,1,0,1,0,1,0,1,0,0]; % message
%m=[1,0,1,0,1,1,1,1,0,1];
%convert decimal numbers to binary
for i=1:x
    for j=1:y
        temp = dec2bin(r(i,j),8);
            for k=1:8
                binImage(i,j,k) = str2num(temp(k));
            end
    end
end
%display binary images
for l=1:8
    figure(2)
    subplot(4,2,l)
    imshow(binImage(:,:,l));
    %pause(1)
end

% display of LSB of i/p image

% figure(2)
% imshow(binImage(:,:,8));

% for i=1:x
%     for j=1:y
%             for k=1:8
%                           binImage(i,j,k);
%             end
%     end
% end

new = zeros(x,y);

 for i=1:x
    for j=1:y
                      new(i,j) = r(i,j);
    end
end

f=[0,1,1,1,1,1,1,0,1,0];
    


for i=1:10
    h(i)=xor(f(i),m(i));
end

%for first 10 elements
% for i=1:x
%     
%        if i==1
%            new(i,1)=r(i,1);
%        elseif mod(r(i,1),2)==h(i)
%            new(i,1)=r(i,1);
%        elseif r(i,1)==255 && h(i)==0
%            new(i,1)=r(i,1)-1;
%        elseif r(i,1)==0 && h(i)==1
%            new(i,1)=r(i,1)+1;
%        else
%            new(i,1)=r(i,1)+((-1)^f(i));
%        end
% end
%for all elements
for i=1:x
    for j=1:y
       if i==1
           new(i,1)=r(i,1);
       elseif i>1 && i<11 && mod(r(i,1),2)==h(i)
           new(i,j)=r(i,1);
       elseif i>1 && i<11 && r(i,1)==255 && h(i)==0
           new(i,j)=r(i,j)-1;
       elseif i>1 && i<11 && r(i,1)==0 && h(i)==1
           new(i,1)=r(i,1)+1;
       else
           new(i,j)=r(i,j)+((-1)^(i));
       end
    end
end

% to convert new matrix into binary
for i=1:x
    for j=1:y
        temp = dec2bin(new(i,j),8);
            for k=1:8
                tempnew(i,j,k) = str2num(temp(k));
            end
    end
end
%assigning 8 bit of old to new
for i=1:x
    for j=1:y
          for k=1:8 
         binImagenew(i,j,k)=binImage(i,j,k);
          end 
    end
end

for i=1:x
    for j=1:y
           
         binImagenew(i,j,8)=tempnew(i,j,8);
            
    end
end

for l=1:8
    figure(3)
     subplot(4,2,l)
     imshow(binImagenew(:,:,l));
%     pause(1)
 end

% figure(3)
% imshow(binImagenew(:,:,8));

%final image

for i=1:x
    for j=1:y
       
            for k=1:8
                final(k)=num2str(binImagenew(i,j,k));
            end
             s(i,j) = bin2dec(final);
    end
end


figure(4)
imshow(r);

%receiver

for i=1:10
    t(i)=mod(new(i+2,1),2);
end
for i=1:10
    fr(i)=xor(m(i),t(i));
end


for i=1:10
    mr(i)=xor(fr(i),t(i));
end

mse=0;
for i=1:x
    for j=1:y
           
        mse=(mse+((binImagenew(i,j,8)-binImage(i,j,8))^2));
      
            
    end
end
mse=mse/(x*y);

psnr=10*log10((255*255)/mse);
fclose('all');
fid=fopen(outputtxtsrc,'w');
fprintf(fid,'%1d',mr);
fid1=fopen('psnr_s.txt','w');
fprintf(fid1,'%f',psnr);
disp('Message Extracted and saved to-')
disp(outputtxtsrc);
disp('PSNR value is');
disp(psnr);
fclose('all');
f=transpose(m);
f
mr
toc;
end