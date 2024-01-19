filename = 'E-MTAB-5061.aggregated_filtered_normalised_counts.mtx';
[A,rows,cols,entries,rep,field,symm] = mmread(filename);

B = A'*A;
lambda = eig(B);
lambda = sort(lambda,'descend');
l_square = lambda.^(1/2);

[T,S,D] = svds(A,14);
aux = S*D';

[idx,centros] = kmeans(aux',14);
[idx_c,centros_c] = kmeans(aux',14,'Distance','cosine');

calculateDist(centros_c', 'dist');
generateSolution(centros_c',14,'dist','result');