% Fuzzy C1 stands for FuzzyIWO_MUX 2:1
clc;
clear;
close all;

%% Problem Definition
VarMin=0.2;                                     % Lower Bound of Decision Variables
VarMax=2;                                    % Upper Bound of Decision Variables
%nVar=4;                                       % Number of Decision Variables
nVar=4;
VarSize=[1 nVar];                         % Decision Variables Matrix
VarRange=[VarMin VarMax];      % Range of Decision Variables

%% IWO Parameter

MaxIt=10;          % Maximum Number of Iterations

% Nweed== No
Nweed= 2;               %    ( Number of initial population )
%50
Pmax=4;            % Maximum number of weed population     
%100
Smin=1;                % Minimum Number of Seeds
Smax=10;             % Maximum Number of Seeds

n=3;                        % Nonlinear modulation index

%Initialsigma=0.3;     % In Fuzzy it is not defined,  the value of 0.3 is set to sigma    % Initial value of standard deviation
%Finalsigma=0.001;     % Final value of standard deviation
% Predfined Sigma
Sigma = 0.3;
 

%% Initialization

NFE=0;

individual.Position=[];
individual.Cost=[];

pop=repmat(individual,Nweed,1);

for i=1:Nweed
    pop(i).Position=unifrnd(VarMin,VarMax,VarSize);
    pop(i).Cost=C2(pop(i).Position);
end

% Sort Population
Costs=[pop.Cost];
[Costs SortOrder]=sort(Costs);
pop=pop(SortOrder);

BestSol=[];
WorstCost=zeros(MaxIt+1,1);
BestCost=zeros(MaxIt+1,1);
MeanCost=zeros(MaxIt+1,1);


WorstCost(1)=Costs(end);
BestCost(1)=Costs(1);

nfe=zeros(MaxIt,1);



%% IWO Main Loop

for it=1:MaxIt
    
    %Number Of seeds for each weed
    
    Costs=[pop.Cost];
    S=min(Smax,round(Smax-(Smax-Smin)*(Costs-BestCost(it))/(WorstCost(it)-BestCost(it))));
    
    %Iteration Sigma
    %Sigma(it)=((((MaxIt-it)^n)/((MaxIt-1)^n))*(Initialsigma-Finalsigma))+Finalsigma;
    
    
    
    
    %Reproduction
    Ns=sum(S);
    pop2=repmat(individual,Ns,1);
    Positions=[pop.Position];
    Solution=zeros(1,nVar);
    number=1;
    for b=1:Nweed 
        for c=1:S(b)
            for d=1:nVar
                Seed=normrnd(pop(b).Position(d),(Sigma)^2);
                
                while (Seed>VarMax) || (Seed<VarMin)
                    if Seed>VarMax
                       Seed=Seed-(Seed-VarMax);
                    end
                    if Seed<VarMin
                       Seed=Seed+(VarMin-Seed);
                    end
                end
                Solution(d)=Seed;
                  
            end
            pop2(number).Position=Solution;
            pop2(number).Cost=C2(pop2(number).Position);
            number=number+1;
        end
    end

    % Merge Populations
    pop=[pop
         pop2];  %#ok
    
    % Sort Population
    Costs=[pop.Cost];
    [Costs SortOrder]=sort(Costs);
    pop=pop(SortOrder);
   
    % Delete Extra Individuals
    pop=pop(1:Pmax);
    Costs=Costs(1:Pmax);
    
    % Save Results
    BestSol=pop(1);
    BestCost(it+1)=Costs(1);
    WorstCost(it+1)=Costs(end);
    MeanCost(it)=mean(Costs);
    nfe(it)=NFE;
    
    % Show Information
    disp(['Iteration ' num2str(it) ':   ' ...
          'Best Cost = ' num2str(BestCost(it)) '  , ' ...
          'Mean Cost = ' num2str(MeanCost(it))]);
      
       %% 1. Normalization of FIS Inputs
 itnormalized = it / MaxIt;
 % bests(1) is worst ball

 %Bestnormalized =  ( bests(1) - bests(it) ) / bests(1)
 BestCostnormalized =  (  WorstCost(it) - BestCost(it) ) /  WorstCost(it)
  
 %% 2. Read FIS file
 FISMAT = readfis('Fuzzy_IWO_FIS.fis');
 
 %% 3. Define Input Arguments for FIS Before Firing Rules
 U = [itnormalized , BestCostnormalized];
  
 %% 4. Fire Rules or Run Evalfis Command
 Y = evalfis(U,FISMAT);
 
 
end

 %% Results

figure;
plot(BestCost,'g','LineWidth',2);
% semilogy(BestCost,'LineWidth',2);
xlabel('Iteration');
ylabel('Best Fitness = Best Average Power');

