function[] = haar_compression(filename,eps,num)

X = imread(filename);
sz = size(X);

for i=1:sz(1)
    for j=1:sz(2)
        red(i,j) = X(i,j,1);
        green(i,j) = X(i,j,2);
        blue(i,j) = X(i,j,3);        
    end
end

redC = compressOneColor(red,eps,2^num);
greenC = compressOneColor(green,eps,2^num);
blueC = compressOneColor(blue,eps,2^num);


for i=1:sz(1)
    for j=1:sz(2)
        compressedImage(i,j,1) = redC(i,j);
        compressedImage(i,j,2) = greenC(i,j);
        compressedImage(i,j,3) = blueC(i,j);
    end
end
imwrite(compressedImage,'b.jpg');
imshow(compressedImage);


function[D] = compressOneColor(P,eps,num)

origSz = size(P);

e1 = mod(origSz(1),num);
if e1~=0
    P(origSz(1)+ num - e1,1) = 0;
end

e2 = mod(origSz(2),num);
if e2~=0
    P(1,origSz(2)+ num - e2) = 0;
end

sz = size(P);

X = haarmatrix(num);
Xt = X';

zcount = 0;
compZ = 0;

for m=0:num:(sz(1)-num)
    for n=0:num:(sz(2)-num)

        for i=1:(num)
            for j=1:(num)
                E(i,j) = P(m+i,n+j);
            end
        end
        
        T = Xt*double(E)*X;

        for i = 1:num
            for j = 1:num
                if abs(T(i,j)) < eps
                     T(i,j) = 0.0;
                     zcount = zcount + 1;
                end
            end
        end

        compZ = compZ + countzeros(T);
       
        R = X*T*Xt;

        for i=1:(num)
            for j=1:(num)
                S(m+i,n+j) = R(i,j); 
            end
        end
            

    end
        
end
S = uint8(S);
origZ = countzeros(P);
compZ = compZ - origSz(1) * (num-e1) - origSz(2) * (num-e2) - (num-e2)*(num-e1);

%D = reshape(S,origSz(1)-num+e1,origSz(2)-num+e2)

for i=1:origSz(1)
    for j=1:origSz(2)
        D(i,j) = S(i,j);
    end
end

%size(D)

strcat('Number of zeros in the original image:', num2str(origZ) )
strcat('Number of zeros in the compressed image:', num2str(compZ))
strcat('Percent of zeros occured in the compressed data:',num2str(compZ*100/(origSz(1)*origSz(2))),'%')
     
