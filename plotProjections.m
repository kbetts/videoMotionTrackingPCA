function plotProjections(Y,U,S,V,plotType,rankVal,fig)

	switch plotType

	case 'princComp'	
		[m n] = size(Y);
		for j=1:m
			figure(fig), subplot(m/2,2,j), plot(Y(j,:)');
			axis([0 n -150 150]), title(strcat('Princ. Comp. for (\lambda_',num2str(j),')'));
		end
		
	case 'array'	
		% plot array of modal projections
		for j=1:rankVal

			soln = U(:,1:j)*S(1:j,1:j)*V(:,1:j)';
			solnX = [soln(1,:); soln(3,:); soln(5,:)];
			solnY = [soln(2,:); soln(4,:); soln(6,:)];
			[m n] = size(soln);

			figure(fig), subplot(rankVal,2,(2*j-1)), plot(solnX');
			axis([0 n -10 10]),	title(strcat('Rank(',num2str(j),') , Horiz.'));
			figure(fig), subplot(rankVal,2,(2*j)), plot(solnY');
			axis([0 n -10 10]),	title(strcat('Rank(',num2str(j),') , Vert.'));
			
		end
	
	case 'best'	
		% plot best dynamics
		for j=1:rankVal
			soln = U(:,1:j)*S(1:j,1:j)*V(:,1:j)';
			solnX = [soln(1,:); soln(3,:); soln(5,:)];
			solnY = [soln(2,:); soln(4,:); soln(6,:)];
			[m n] = size(soln);
		end
		if rankVal == 1
			figure(fig), plot(solnY'), axis([0 n -8 8]);
			title(strcat('Rank(',num2str(rankVal),') approx. of dynamics in Vert.'));
		else
			figure(fig), subplot(1,2,1), plot(solnX'), axis([0 n -10 10]);
			title(strcat('Rank(',num2str(rankVal),') approx. of dynamics in Horiz.'));
			figure(fig), subplot(1,2,2), plot(solnY'), axis([0 n -10 10]);
			title(strcat('Rank(',num2str(rankVal),') approx. of dynamics in Vert.'));
		end
		
	end
	
	drawnow;
	
end