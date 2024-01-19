load primates;

A = montamatrizNova(primates);
[T, S, D] = svds(A, 12);

s = diag(S);
s = s*(1/sum(s));
plot(s)
grid on

norm(A - T*S*D');

Aux6 = S(1:6,1:6)*D(:,1:6)';

Distancias = pdist(Aux6');
Distancias = squareform(Distancias);

arvore = seqlinkage(Distancias, 'average', primates);
view(arvore);

arvore = seqneighjoin(Distancias, 'equivar', primates);
view(arvore);

Aux = S*D';
Aux10 = Aux(1:10, :);

calculateDist(Aux10, 'D');
generateSolution(Aux10,3,'D','result');

load result;
x = result(1,:);
y = result(2,:);
z = result(3,:);
figure;
plot3(x,y,z,'s');
grid on;

[idx_,centros_] = kmeans(Aux',4);

calculateDist(centros_', 'dist');
generateSolution(centros_',4,'dist','result');

vetor = [];
for j = 1:1:4
    num = sum(idx_(:) == j);
    vetor = [vetor, num];
end


load result;
X=result(1,:);
Y=result(2,:);
Z=result(3,:);
figure;
plot3(X,Y,Z, 'ob');
hold on;
grid on;


for i = 1:1:4
    [x,y,z] = sphere;
    x = x*vetor(i);
    y = y*vetor(i);
    z = z*vetor(i);
    
    h = surf(x+result(1,i), y+result(2,i), z+result(3,i));
    set(h, 'FaceAlpha', 0.1);
    shading interp;
    hold on;
    
end