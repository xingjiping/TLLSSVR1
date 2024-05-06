%**************************************************************
% * mex interface to Andy Liaw et al.'s C code (used in R package randomForest)
% * Author:LiuYang,TLab,SEU
% * Date:2016.6.2
% * Version:1.0
% ********************************************************************

function Y_hat = regRF_predict(X,model)
    
	if nargin~=2
		error('need atleast 2 parameters,X matrix and model');
	end
	
	Y_hat = mexRF_predict(X',model.lDau,model.rDau,model.nodestatus,model.nrnodes,model.upper,model.avnode,model.mbest,model.ndtree,model.ntree);
    
    if ~isempty(find(model.coef))
        Y_hat = model.coef(1) + model.coef(2)*Y_hat;
    end
	clear mexRF_predict