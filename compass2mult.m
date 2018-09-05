function [datax,datay,dataz] = compass2mult(path)
    fid = fopen(path);
    title = textscan(fid, '%s %s %s %s',1,'delimiter', ',');
    data = textscan(fid, '%d %f %f %f','delimiter', ',');
    fclose(fid);
    time=cell2mat(data(1))';
    t=1:size(time,2);
    x=cell2mat(data(2))';
    y=cell2mat(data(3))';
    z=cell2mat(data(4))';
    meany=mean(y)+abs(mean(y)*0.04);
    [~,peak] = findpeaks(y,'MinPeakHeight',meany,'MinPeakDistance',30);
    max10=peak(1:10);

    datax_interval = 15;
    for i=11:size(peak,2)
        max10value=[];
        for j=1:10
            max10value=[max10value y(max10(j))];
        end
        [minimum,index] = min(max10value);
        if(y(peak(i))>minimum)
            max10(index)=peak(i);
        end
    end
    max10=sort(max10);
    values = [];

    for m = 1:size(max10,2)
        firstposition = max10(m)-10;
        secondposition = max10(m)+10;
        n = 0;
        run = true;
        limit = mean(y)+0.4*abs((y(max10(m))-mean(y)));
        while run
            firstvalue = y(firstposition:firstposition+10);
            if max(firstvalue) < limit &&max(firstvalue) < max10(m)
                run = false;
            else
                if m>1&&firstposition>values(2,m-1)
                    firstposition = firstposition -1;
                else
                    run=false;
                end
            end

        end

        run = true;
        while run
            secondvalue = y(secondposition-10:secondposition) ;
            if max(secondvalue) < limit &&max(secondvalue) < max10(m)
                run = false;
            else
                if m<10&&secondposition>max10(m+1)
                    secondposition = secondposition +1;
                else
                    run=false;
                end
            end

        end

        values = [values [firstposition;secondposition]];




    end
    maxsize = max(values(2,:)-values(1,:));
    datax = zeros(10,maxsize);
    datay = zeros(10,maxsize);
    dataz = zeros(10,maxsize);
    for k = 1: size(values,2)
        datax(k,1:values(2,k)-values(1,k)+1) = x(values(1,k):values(2,k));
        datay(k,1:values(2,k)-values(1,k)+1) = y(values(1,k):values(2,k));
        dataz(k,1:values(2,k)-values(1,k)+1) = z(values(1,k):values(2,k));
    end
    
    figure
    plot(t,y)
    hold on
    for i=1:size(max10,2)
        plot(max10(i),y(max10(i)),'go')
        hold on
    end
    
    for i =1:size(values,2)
        plot(values(1,i),y(values(1,i)),'ro')
        plot(values(2,i),y(values(2,i)),'ro')
        hold on 
    end
   
end