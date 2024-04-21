function[point_phase2]=CheckPhase_cougarnetID(func1,func2,func3,inpoint,xinter1,inpoint2)
if inpoint(2)>func1(inpoint(1))&&inpoint2>inpoint(1)&&inpoint(1)>xinter1
    point_phase2='solid';
end
if inpoint(2)>func3(inpoint(1))&&inpoint(1)<xinter1
     point_phase2='solid';
end
if inpoint(2)<func1(inpoint(1))&&inpoint(2)>func2(inpoint(1))&&(xinter1<inpoint(1))&&(inpoint(1)<inpoint2)
    point_phase2='liquid';
end
if inpoint(2)<func3(inpoint(1))&&inpoint(1)<xinter1
    point_phase2='gas';
end
if inpoint(2)<func2(inpoint(1))&&(xinter1<inpoint(1))&&(inpoint(1)<inpoint2)
    point_phase2='gas';
end
if inpoint(1)>inpoint2
    point_phase2='gas';
end
if inpoint(2)==func1(inpoint(1))
    point_phase2='soild';
end
if inpoint(2)==func2(inpoint(1))&&inpoint(1)>xinter1
   point_phase2='liquid';
end
if inpoint(1)==inpoint2
   point_phase2='liquid';
end
end