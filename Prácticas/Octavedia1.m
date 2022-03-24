v1 = 1:5
v1 + v1
v1 * v1'
v1'
v1.*v1

m1=[1, 2, 2, 1; 3, -1, -8, 6; 4, 3, 2, 7]
m1*m1'
m1'*m1
inv(m1*m1')
m2 = m1'*m1
det(m2)
m2(3,3)=17
det(m2)
v5 = m2(3,:)


disp("Hola")
t = 0:0.1:2*pi
y = sin(t)
y2 = cos(t)
plot(t, y)
hold on 
plot(t,y2)