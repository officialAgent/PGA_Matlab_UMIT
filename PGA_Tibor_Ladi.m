
Space=[-10 -10 -10 -10 -10 -10 -10                                                       
       10 10 10 10 10 10 10];
 szam=100;                                   %vybral som velkost pulaciu 100 pre kazdy ostrov   
a1=genrpop(szam,Space);
pok=3;    %tu mozeme zmenit typ pokuty 1,2,3
a2=genrpop(szam,Space);
a3=genrpop(szam,Space);
a4=genrpop(szam,Space);
a5=genrpop(szam,Space);
a6=genrpop(szam,Space);
a7=genrpop(szam,Space);
a8=genrpop(szam,Space);
a9=genrpop(szam,Space);
k=0;
graf=zeros(1,7000);

for i=1:50                                                          %%PGA cklus    

    
    
[almafa,graf]=GA(a1,Space,pok,0.1,0.1);                     %%%tu som spustal jednotlive ostorvy a po kazdej 140 ciklov robim migraciu
fit1=almafa;                                                           %kazdy ostov pust9m inim parametrom pre lokalnu a globalnu mutaciu             
[lpop,lstring]=size(graf);

   for l=1:lstring
      graf1(l+k)=graf(l); 
   end
Fit=sajt(fit1,pok);
fit1best1=selbest(fit1,Fit,1);
a1=fit1;


[almafa,graf]=GA(a2,Space,pok,0.2,0.1);
fit2=almafa;
[lpop,lstring]=size(graf);
   for l=1:lstring
      graf2(l+k)=graf(l); 
   end
Fit=sajt(fit2,pok);
fit1best2=selbest(fit2,Fit,1);
a2=fit2;



[almafa,graf]=GA(a3,Space,pok,0.3,0.2);
fit3=almafa;
[lpop,lstring]=size(graf);

   for l=1:lstring
      graf3(l+k)=graf(l); 
   end
Fit=sajt(fit3,pok);
fit1best3=selbest(fit3,Fit,1);
a3=fit3;



[almafa,graf]=GA(a4,Space,pok,0.3,0.3);
fit4=almafa;
[lpop,lstring]=size(graf);

   for l=1:lstring
      graf4(l+k)=graf(l); 
   end
Fit=sajt(fit4,pok);
fit1best4=selbest(fit4,Fit,1);
a4=fit4;


[almafa,graf]=GA(a5,Space,pok,0.5,0.4);
fit5=almafa;
[lpop,lstring]=size(graf);

   for l=1:lstring
      graf5(l+k)=graf(l); 
   end
Fit=sajt(fit5,pok);
fit1best5=selbest(fit5,Fit,1);
a5=fit5;



[almafa,graf]=GA(a6,Space,pok,0.6,0.5);
fit6=almafa;
[lpop,lstring]=size(graf);

   for l=1:lstring
      graf6(l+k)=graf(l); 
   end
Fit=sajt(fit6,pok);
fit1best6=selbest(fit6,Fit,1);
a6=fit6;




[almafa,graf]=GA(a7,Space,pok,0.7,0.6);
fit7=almafa;
[lpop,lstring]=size(graf);

   for l=1:lstring
      graf7(l+k)=graf(l); 
   end
Fit=sajt(fit7,pok);
fit1best7=selbest(fit7,Fit,1);
a7=fit7;




[almafa,graf]=GA(a8,Space,pok,0.1,0.1);
fit8=almafa;
[lpop,lstring]=size(graf);

   for l=1:lstring
      graf8(l+k)=graf(l); 
   end
Fit=sajt(fit8,pok);
fit1best8=selbest(fit8,Fit,1);
a8=fit8;

utolso=csere(fit1best1,fit1best2,fit1best3,fit1best4,fit1best5,fit1best6,fit1best7,fit1best8,a9,pok);   %tu zavolam funkciu co vrati novu popul8ciu pre ostov 9

[almafa,graf]=GA(utolso,Space,pok,0.1,0.1);
fit9=almafa;
a9=fit9;
[lpop,lstring]=size(graf);

   for l=1:lstring
      graf9(l+k)=graf(l); 
   end
   
   
   
k=k+140;
if(i==50)                           %tu vyp93em graf pre kazd7 ostorv
    figure(1);
    plot(graf1); hold on; 
     figure(2);
    plot(graf2); hold on; 
     figure(3);
    plot(graf3); hold on; 
     figure(4);
    plot(graf4); hold on; 
     figure(5);
    plot(graf5); hold on; 
     figure(6);
    plot(graf6); hold on; 
     figure(7);
    plot(graf7); hold on; 
     figure(8);
    plot(graf8); hold on; 
     figure(9);
    plot(graf9); hold on; 
end
%%randi([1,40],1,1);
end



function [pistike]=csere(fit1,fit2,fit3,fit4,fit5,fit6,fit7,fit8,pop,pok)     %%%%funkcia najde najhorsy vysledok a vimeni to na lepsie co dostal od inych ostovov



   badly1=worst(pop,pok);
   pop(badly1,:)=fit1;
   badly2=worst(pop,pok);
   pop(badly2,:)=fit2;
   badly3=worst(pop,pok);
   pop(badly3,:)=fit3;
   badly4=worst(pop,pok);
   pop(badly4,:)=fit4;
   badly5=worst(pop,pok);
   pop(badly5,:)=fit5;
   badly6=worst(pop,pok);
   pop(badly6,:)=fit6;    
   badly7=worst(pop,pok);
   pop(badly7,:)=fit7;
   badly8=worst(pop,pok);
   pop(badly8,:)=fit8;
   
   
   
   


pistike=pop;
end


function [almafa,graf]=GA(Pop, space, pok,GM,LM)     %%GA


for n= 1:140
Fit=sajt(Pop,pok);% fitness funkcia 
best1=selbest(Pop,Fit,1); % vyber najlepsich jedinec

graph(n)=(sajt(best1,pok));
best=selbest(Pop,Fit,[1 1 3]); % vyber najlepsich jedincov
work=seltourn(Pop,Fit,95); % turnajovy vyber 
work=crossov(work,1,0); % krizenie 
work=mutx(work,GM,space); % globalna mutacia
Amp=[1 1 1 1 1 1 1];
work=muta(work,LM,Amp,space); % lokalna mutacia
Pop=[best;work];

end
    graf=graph;
   
   almafa=Pop;




end




function [fuzet]=sajt(pop,pok)      %fittnes funkcia vrati hodnutu 

[lpop,lstring]=size(pop);

for i=1:lpop
    hodnota=funk(pop(i,:),pok);            
    fuzet(i)=hodnota;
    
end
end




function [number]=worst(pop,pok)   %funkcia najde najhorsi jedinec

[lpop,lstring]=size(pop);
a=funk(pop(1,:),pok);
max=pop(1,:);
sor=1;
for i=2:lpop
    
   b=funk(pop(i,:),pok);
   
   if(b>a)
      max=pop(i,:); 
      sor=i;
      a=b;
   end
    
    
end
number=sor;
end









function ret=funk(x, pok)  %%funkcia vypocita funkcnu hudnout podla vzorca a pokuty pride ked je potreben

ttt=0;

if(pok==1)
   ttt=ttt+pok1(x);
  
end
if(pok==2)
   ttt=ttt+pok2(x);
    
end   
if(pok==3)
   ttt= ttt+ pok3(x);
    
end

paci=(x(1)-10)^2+5*(x(2)-12)^2+(x(3))^4+3*(x(4)-11)^2+10*(x(5))^6+7*(x(6))^2+(x(7))^4-4*(x(6)*x(7))-10*(x(6))-8*(x(7));

ret=paci+ttt;
end

function pokuta1=pok1(x)

pod1=127-2*x(1)^2-3*x(2)^4-x(3)-4*x(4)^2-5*x(5);
pod2=282-7*x(1)-3*x(2)-10*x(3)^2-x(4)+x(5);
pod3=196-23*x(1)-x(2)^2-6*x(6)^2+8*x(7);
pod4=-4*x(1)^2-x(2)^2+3*x(1)*x(2)-2*x(3)^2-5*x(6)+11*x(7);

if(pod1<0 || pod2<0 || pod3<0 || pod4<0 )
   pokuta1=10^10;

   
else
    pokuta1=0;
    
end





end



function pokuta2=pok2(x)

pod1=127-2*x(1)^2-3*x(2)^4-x(3)-4*x(4)^2-5*x(5);
pod2=282-7*x(1)-3*x(2)-10*x(3)^2-x(4)+x(5);
pod3=196-23*x(1)-x(2)^2-6*x(6)^2+8*x(7);
pod4=-4*x(1)^2-x(2)^2+3*x(1)*x(2)-2*x(3)^2-5*x(6)+11*x(7);
feltetel=0;
if(pod1<0  )
   feltetel=feltetel+1;
end
if(pod2<0)
    feltetel=feltetel+1;
end
if(pod3<0)
    feltetel=feltetel+1;
end
if(pod4<0)
    feltetel=feltetel+1;
end

if(feltetel==0)
    pokuta2=0;
    


else
    pokuta2=feltetel*10^4;




end



end


function pokuta3=pok3(x)

pod1=127-2*x(1)^2-3*x(2)^4-x(3)-4*x(4)^2-5*x(5);
pod2=282-7*x(1)-3*x(2)-10*x(3)^2-x(4)+x(5);
pod3=196-23*x(1)-x(2)^2-6*x(6)^2+8*x(7);
pod4=-4*x(1)^2-x(2)^2+3*x(1)*x(2)-2*x(3)^2-5*x(6)+11*x(7);
feltetel=0;
if(pod1<0  )
   feltetel=feltetel-pod1;
end
if(pod2<0)
    feltetel=feltetel-pod2;
end
if(pod3<0)
    feltetel=feltetel-pod3;
end
if(pod4<0)
    feltetel=feltetel-pod4;
end


pokuta3=feltetel;




end













