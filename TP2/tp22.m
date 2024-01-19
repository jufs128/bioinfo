filename = 'E-MTAB-5061.aggregated_filtered_normalised_counts.mtx';
[A, rows, cols, entries, rep, symm] = mmread(filename);

[T,S,D] = svds(A, 14);

Aux = S*D';

[idx_,centros_] = kmeans(Aux',14);

calculateDist(centros_', 'dist');
generateSolution(centros_',14,'dist','result');

vetor = [];
for j = 1:1:14
    num = sum(idx_(:) == j);
    vetor = [vetor, num];
end


load result;
X=result(1,:);
Y=result(2,:);
Z=result(3,:);
plot3(X,Y,Z, 'ob')
hold on
grid on


for i = 1:1:14
    [x,y,z] = sphere;
    x = x*vetor(i);
    y = y*vetor(i);
    z = z*vetor(i);
    
    h = surf(x+result(1,i), y+result(2,i), z+result(3,i));
    set(h, 'FaceAlpha', 0.1)
    shading interp
    hold on
    
end
