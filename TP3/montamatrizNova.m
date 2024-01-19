function A = montamatrizNova(seqs)
m = numel(seqs);
A=sparse(4096,m);
for i = 1:m 
   s = seqs(i).Sequence;
   f=slidwindow6(s);
   A(:,i)=f';
   i
end 
end
    

