function plotTracking(X,fig)

	[m n] = size(X);

	for j=1:(m/2)
		
		figure(fig), subplot(m/2,2,(2*j-1)), plot(X((2*j-1),:)');
		axis([0 n -120 120]), title(strcat('Camera ',num2str(j),', Horiz.'));
		
		figure(fig), subplot(m/2,2,(2*j)), plot(X((2*j),:)');
		axis([0 n -120 120]), title(strcat('Camera ',num2str(j),', Vert.'));
		
	end
	
end