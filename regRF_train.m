%**************************************************************
% * mex interface to Andy Liaw et al.'s C code (used in R package randomForest)
% * Author:LiuYang,TLab,SEU
% * Date:2016.6.2
% * Version:1.0
% ********************************************************************

function model=regRF_train(X,Y,ntree,mtry, extra_options)
    DEBUG_ON=0;
    DEFAULTS_ON=0;
    TRUE=1;
    FALSE=0;
    if exist('extra_options','var')
        if isfield(extra_options,'DEBUG_ON');  DEBUG_ON = extra_options.DEBUG_ON;    end
        if isfield(extra_options,'replace');  replace = extra_options.replace;       end
        if isfield(extra_options,'classwt');  classwt = extra_options.classwt;       end
        if isfield(extra_options,'cutoff');  cutoff = extra_options.cutoff;       end
        if isfield(extra_options,'strata');  strata = extra_options.strata;       end
        if isfield(extra_options,'sampsize');  sampsize = extra_options.sampsize;       end
        if isfield(extra_options,'nodesize');  nodesize = extra_options.nodesize;       end
        if isfield(extra_options,'importance');  importance = extra_options.importance;       end
        if isfield(extra_options,'localImp');  localImp = extra_options.localImp;       end
        if isfield(extra_options,'nPerm');  nPerm = extra_options.nPerm;       end
        if isfield(extra_options,'proximity');  proximity = extra_options.proximity;       end
        if isfield(extra_options,'oob_prox');  oob_prox = extra_options.oob_prox;       end
        if isfield(extra_options,'do_trace');  do_trace = extra_options.do_trace;       end
        if isfield(extra_options,'corr_bias');  corr_bias = extra_options.corr_bias;       end
        if isfield(extra_options,'keep_inbag');  keep_inbag = extra_options.keep_inbag;       end
    end
  
    if ~exist('DEBUG_ON','var')     DEBUG_ON=FALSE; end
    if ~exist('replace','var');     replace = TRUE; end
    if ~exist('sampsize','var');    
        if (replace) 
            sampsize = size(X,1); 
        else
            sampsize = ceil(0.632*size(X,1));
        end; 
    end
    if ~exist('nodesize','var');    nodesize = 5; end %classification=1, regression=5
    if ~exist('importance','var');  importance = FALSE; end
    if ~exist('localImp','var');    localImp = FALSE; end
    if ~exist('nPerm','var');       nPerm = 1; end
    if ~exist('do_trace','var');    do_trace = FALSE; end
    if ~exist('corr_bias','var');   corr_bias = FALSE; end
    if ~exist('keep_inbag','var');  keep_inbag = FALSE; end
    if ~exist('ntree','var') | ntree<=0
		ntree=500;
        DEFAULTS_ON=1;
    end
    if ~exist('mtry','var') | mtry<0 | mtry> size(X,2)
        mtry = max(floor(size(X,2)/3),1);
        DEFAULTS_ON=1;
    end
    addclass=0;
    
    
    [N D] = size(X);
    
    if length(unique(Y))<=5,  warning('Do you want regression? there are just 5 or less unique values');  end
    if N==0,   error('Data (X) has 0 rows');  end
    if mtry<1 || mtry>D  ,  warning('Invalid mtry. reset to within valid range'); DEFAULTS_ON=1;   end
    mtry = max(1, min(D,round(mtry)));
    
    if DEFAULTS_ON
        fprintf('\tSetting to defaults %d trees and mtry=%d\n',ntree,mtry);
    end
    
    if length(Y)~=N || length(Y)==0
        error('length of Y not the same as X or Y is null');
    end
    
    if ~isempty(find(isnan(X)));  error('NaNs in X');   end
    if ~isempty(find(isnan(Y)));  error('NaNs in Y');   end
    
  
    if exist ('extra_options','var') && isfield(extra_options,'categories')
        ncat = extra_options.categories;      
    else
        ncat = ones(1,D);
    end
    
    maxcat = max(ncat);
    if maxcat>32
        error('Can not handle categorical predictors with more than 32 categories');
    end

  
    nclass = length(unique(Y));
    addclass = FALSE;

    if ~exist('proximity','var')
        proximity = addclass;
        oob_prox = proximity;
    end
    
    if ~exist('oob_prox','var')
        oob_prox = proximity;
    end
    
    if localImp
        importance = TRUE;
    else

    end
    
    if importance
        if (nPerm<1)
            nPerm = int32(1);
        else
            nPerm = int32(nPerm);
        end 
    else
    end
    
    
    if addclass

    else

    end
    
    Stratify = (length(sampsize)>1);
    if (~Stratify && sampsize>N) 
        error('Sampsize too large')
    end
    
    if Stratify
        error('Sampsize should be of length one')
    end
    

    Options = int32([importance,localImp,nPerm]);
    
    if DEBUG_ON
        fprintf('size(x) %d\n',size(X));
        fprintf('size(y) %d\n',size(Y));
        fprintf('nclass %d\n',nclass);
        fprintf('size(ncat) %d\n',size(ncat));
        fprintf('maxcat %d\n',maxcat);
        fprintf('size(sampsize) %d\n',size(sampsize));
        fprintf('sampsize[0] %d\n',sampsize(1));
        fprintf('Stratify %d\n',Stratify);
        fprintf('Proximity %d\n',proximity);
        fprintf('oob_prox %d\n',oob_prox);
        fprintf('ntree %d\n',ntree);
        fprintf('mtry %d\n',mtry);
        fprintf('nodesize %f\n',nodesize);
        fprintf('replace %f\n',replace);
    end
  
	[ldau,rdau,nodestatus,nrnodes,upper,avnode,...
        mbest,ndtree,ypred,mse,impout,impmat,...
        impSD,prox,coef,oob_times,inbag]...
        = mexRF_train (X',Y,ntree,mtry,sampsize,nodesize,...
                       int32(Options),int32(ncat),int32(maxcat),int32(do_trace), int32(proximity), int32(oob_prox), ...
                       int32(corr_bias), keep_inbag, replace    );
    

    ypred(oob_times==0)=NaN;
    model.lDau=ldau;
	model.rDau=rdau;
	model.nodestatus=nodestatus;
	model.nrnodes=nrnodes;
	model.upper=upper;
	model.avnode=avnode;
	model.mbest=mbest;
	model.ndtree=ndtree;
	model.ntree = ntree;
    model.Y_hat = ypred;
    model.mse = mse;
    model.importance = impout;
    model.importanceSD = impSD;
    model.localImp = impmat;
    model.proximity = prox;
    model.coef = coef;
    model.oob_times = oob_times;
    model.inbag = inbag;
    model.nPerm = nPerm;
    model.biasCorr = corr_bias;
    model.rsq = 1 - mse / (var(Y) * (N-1) / N);
	clear mexRF_train