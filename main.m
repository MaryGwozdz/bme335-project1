clc
% a is the concentration of A from 0 to 1 in intervals of 0.01
a = linspace(0,1,(1-0)/0.01+1);
% b is the concentration of B from 0 to 1 in intervals of 0.01
b = linspace(0,1,(1-0)/0.01+1);

alp = 11.6;
bet = 5.3;

pdf_1 = []; %pdf matrix of the first equation
pdf_2 = []; %pdf matrix of the second equation
for x = 1:length(a)
    for y = 1: length(b)
        % calculate values of each pdf matrix
        pdf_1(y,x) = alp * ( 0.05 + a(x)^2 ) * ( (b(y)-1)^4 + 0.025 );
        pdf_2(y,x) = bet * ( 1 - a(x)^2 ) * ( 0.05 + b(y)^4 + (a(x)^2) * (b(y)^2) /2 );
    end
end

%Marginal PDF for A in T1 cells
for x = 1:length(a)
    mPDFa(x) = sum(pdf_1(:,x));
end
%Marginal PDF for B in T2 cells
for y = 1:length(b)
    mPDFb(y) = sum(pdf_2(y,:));
end


%plot first pdf 
subplot(1,2,1);
surf(a,b,pdf_1);
title('T1 pdf');
xlabel('a');
ylabel('b');
hold on
%plot second pdf
subplot(1,2,2);
surf(a,b,pdf_2);
title('T2 pdf');
xlabel('a');
ylabel('b');
hold on

%plot marginals
figure;
subplot(1,2,1);
plot(a,mPDFa);
xlabel('a');
ylabel('T1');
title('Marginal PDF of A for T1 cells');
subplot(1,2,2);
plot(b,mPDFb);
xlabel('b');
ylabel('T2');
title('Marginal PDF of B for T2 cells');
