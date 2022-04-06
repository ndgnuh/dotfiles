" Vim syntax file
" Language:	FreeFem++
" Maintainer:	Richard Michel <Richard.Michel@lepmi.inpg.fr>
" Last Change:	2007 May 03 (for FreeFem++ v2.16-2)

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Read the Cpp syntax to start with
if version < 600
  so <sfile>:p:h/cpp.vim
else
  runtime! syntax/cpp.vim
  unlet b:current_syntax
endif

" FF++ extentions
syn keyword ffBoolean            false true
syn keyword ffConstantEF         P0 P0edge P0VF P1 P1b P1dc P1nc P2 P2b P2dc P2h RT0 RT0Ortho RTmodif
syn keyword ffConstantNum        i pi
syn keyword ffConstantQF         qf1pE qf1pElump qf1pT qf1pTlump qf2pE qf2pT qf2pT4P1 qf3pE qf5pT qf7pT qf9pT
syn keyword ffConstantSolver     CG Cholesky Crout GMRES LU UMFPACK
syn keyword ffException          catch throw try
syn keyword ffFunction			 abs acos acosh adaptmesh adj AffineCG AffineGMRES arg asin asinh assert atan atan2 atanh atoi atof BFGS buildmesh ceil change checkmovemesh chi clock complexEigenValue conj convect copysign cos cosh diffnp diffpos dist dumptable dxx dxy dxz dyx dyy dyz dzx dzy dzz EigenValue emptymesh erf erfc exec exit exp fdim floor fmax fmin fmod imag int1d int2d int3d intalledges intallfaces interpolate invdiff invdiffnp invdiffpos isInf isNaN isNormal jump LinearCG LinearGMRES lgamma log log10 lrint lround ltime max min movemesh NaN NLCG plot polar pow projection randinit randint31 randint32 randreal1 randreal2 randreal3 randres53 readmesh readmesh3 real rint round savemesh set sign signbit sin sinh sort splitmesh sqrt square storagetotal storageused strtod strtol swap system tan tanh tgamma time trace trunc
syn keyword ffFunctionExt		 boundaniso BECtrap GPvortex dxGPVortex dyGPVortex LoadVec LoadFlag SaveVec flag buildlayers radiusSearch Voisinage neighborhood ClosePoints2 ClosePoint ClosePoints1 extractborder curvature raxicurvature curves setecurveabcisse equiparameter Tresca VonMises plandfft execute delete dfft map distance checkdist Dxaddmesh Dxaddtimeseries Dxaddsol2ts expert exactpartition airy biry cmaes gslcdfugaussianP gslcdfugaussianQ gslcdfugaussianPinv gslcdfugaussianQinv gslcdfgaussianP gslcdfgaussianQ gslcdfgaussianPinv gslcdfgaussianQinv gslcdfgammaP gslcdfgammaQ gslcdfgammaPinv gslcdfgammaQinv gslcdfcauchyP gslcdfcauchyQ gslcdfcauchyPinv gslcdfcauchyQinv gslcdflaplaceP gslcdflaplaceQ gslcdflaplacePinv gslcdflaplaceQinv gslcdfrayleighP gslcdfrayleighQ gslcdfrayleighPinv gslcdfrayleighQinv gslcdfchisqP gslcdfchisqQ gslcdfchisqPinv gslcdfchisqQinv gslcdfexponentialP gslcdfexponentialQ gslcdfexponentialPinv gslcdfexponentialQinv gslcdfexppowP gslcdfexppowQ gslcdftdistP gslcdftdistQ gslcdftdistPinv gslcdftdistQinv gslcdffdistP gslcdffdistQ gslcdffdistPinv gslcdffdistQinv gslcdfbetaP gslcdfbetaQ gslcdfbetaPinv gslcdfbetaQinv gslcdfflatP gslcdfflatQ gslcdfflatPinv gslcdfflatQinv gslcdflognormalP gslcdflognormalQ gslcdflognormalPinv gslcdflognormalQinv gslcdfgumbel1P gslcdfgumbel1Q gslcdfgumbel1Pinv gslcdfgumbel1Qinv gslcdfgumbel2P gslcdfgumbel2Q gslcdfgumbel2Pinv gslcdfgumbel2Qinv gslcdfweibullP gslcdfweibullQ gslcdfweibullPinv gslcdfweibullQinv gslcdfparetoP gslcdfparetoQ gslcdfparetoPinv gslcdfparetoQinv gslcdflogisticP gslcdflogisticQ gslcdflogisticPinv gslcdflogisticQinv gslcdfbinomialP gslcdfbinomialQ gslcdfpoissonP gslcdfpoissonQ gslcdfgeometricP gslcdfgeometricQ gslcdfnegativebinomialP gslcdfnegativebinomialQ gslcdfpascalP gslcdfpascalQ gslranbernoullipdf gslranbeta gslranbetapdf gslranbinomialpdf gslranexponential gslranexponentialpdf gslranexppow gslranexppowpdf gslrancauchy gslrancauchypdf gslranchisq gslranchisqpdf gslranerlang gslranerlangpdf gslranfdist gslranfdistpdf gslranflat gslranflatpdf gslrangamma gslrangammaint gslrangammapdf gslrangammamt gslrangammaknuth gslrangaussian gslrangaussianratiomethod gslrangaussianziggurat gslrangaussianpdf gslranugaussian gslranugaussianratiomethod gslranugaussianpdf gslrangaussiantail gslrangaussiantailpdf gslranugaussiantail gslranugaussiantailpdf gslranlandau gslranlandaupdf gslrangeometricpdf gslrangumbel1 gslrangumbel1pdf gslrangumbel2 gslrangumbel2pdf gslranlogistic gslranlogisticpdf gslranlognormal gslranlognormalpdf gslranlogarithmicpdf gslrannegativebinomialpdf gslranpascalpdf gslranpareto gslranparetopdf gslranpoissonpdf gslranrayleigh gslranrayleighpdf gslranrayleightail gslranrayleightailpdf gslrantdist gslrantdistpdf gslranlaplace gslranlaplacepdf gslranlevy gslranweibull gslranweibullpdf gslsfairyAi gslsfairyBi gslsfairyAiscaled gslsfairyBiscaled gslsfairyAideriv gslsfairyBideriv gslsfairyAiderivscaled gslsfairyBiderivscaled gslsfairyzeroAi gslsfairyzeroBi gslsfairyzeroAideriv gslsfairyzeroBideriv gslsfbesselJ0 gslsfbesselJ1 gslsfbesselJn gslsfbesselY0 gslsfbesselY1 gslsfbesselYn gslsfbesselI0 gslsfbesselI1 gslsfbesselIn gslsfbesselI0scaled gslsfbesselI1scaled gslsfbesselInscaled gslsfbesselK0 gslsfbesselK1 gslsfbesselKn gslsfbesselK0scaled gslsfbesselK1scaled gslsfbesselKnscaled gslsfbesselj0 gslsfbesselj1 gslsfbesselj2 gslsfbesseljl gslsfbessely0 gslsfbessely1 gslsfbessely2 gslsfbesselyl gslsfbesseli0scaled gslsfbesseli1scaled gslsfbesseli2scaled gslsfbesselilscaled gslsfbesselk0scaled gslsfbesselk1scaled gslsfbesselk2scaled gslsfbesselklscaled gslsfbesselJnu gslsfbesselYnu gslsfbesselInuscaled gslsfbesselInu gslsfbesselKnuscaled gslsfbesselKnu gslsfbessellnKnu gslsfbesselzeroJ0 gslsfbesselzeroJ1 gslsfbesselzeroJnu gslsfclausen gslsfhydrogenicR1 gslsfdawson gslsfdebye1 gslsfdebye2 gslsfdebye3 gslsfdebye4 gslsfdebye5 gslsfdebye6 gslsfdilog gslsfmultiply gslsfellintKcomp gslsfellintEcomp gslsfellintPcomp gslsfellintDcomp gslsfellintF gslsfellintE gslsfellintRC gslsferfc gslsflogerfc gslsferf gslsferfZ gslsferfQ gslsfhazard gslsfexp gslsfexpmult gslsfexpm1 gslsfexprel gslsfexprel2 gslsfexpreln gslsfexpintE1 gslsfexpintE2 gslsfexpintEn gslsfexpintE1scaled gslsfexpintE2scaled gslsfexpintEnscaled gslsfexpintEi gslsfexpintEiscaled gslsfShi gslsfChi gslsfexpint3 gslsfSi gslsfCi gslsfatanint gslsffermidiracm1 gslsffermidirac0 gslsffermidirac1 gslsffermidirac2 gslsffermidiracint gslsffermidiracmhalf gslsffermidirachalf gslsffermidirac3half gslsffermidiracinc0 gslsflngamma gslsfgamma gslsfgammastar gslsfgammainv gslsftaylorcoeff gslsffact gslsfdoublefact gslsflnfact gslsflndoublefact gslsflnchoose gslsfchoose gslsflnpoch gslsfpoch gslsfpochrel gslsfgammaincQ gslsfgammaincP gslsfgammainc gslsflnbeta gslsfbeta gslsfbetainc gslsfgegenpoly1 gslsfgegenpoly2 gslsfgegenpoly3 gslsfgegenpolyn gslsfhyperg0F1 gslsfhyperg1F1int gslsfhyperg1F1 gslsfhypergUint gslsfhypergU gslsfhyperg2F0 gslsflaguerre1 gslsflaguerre2 gslsflaguerre3 gslsflaguerren gslsflambertW0 gslsflambertWm1 gslsflegendrePl gslsflegendreP1 gslsflegendreP2 gslsflegendreP3 gslsflegendreQ0 gslsflegendreQ1 gslsflegendreQl gslsflegendrePlm gslsflegendresphPlm gslsflegendrearraysize gslsfconicalPhalf gslsfconicalPmhalf gslsfconicalP0 gslsfconicalP1 gslsfconicalPsphreg gslsfconicalPcylreg gslsflegendreH3d0 gslsflegendreH3d1 gslsflegendreH3d gslsflog gslsflogabs gslsflog1plusx gslsflog1plusxmx gslsfpowint gslsfpsiint gslsfpsi gslsfpsi1piy gslsfpsi1int gslsfpsi1 gslsfpsin gslsfsynchrotron1 gslsfsynchrotron2 gslsftransport2 gslsftransport3 gslsftransport4 gslsftransport5 gslsfsin gslsfcos gslsfhypot gslsfsinc gslsflnsinh gslsflncosh gslsfanglerestrictsymm gslsfanglerestrictpos gslsfzetaint gslsfzeta gslsfzetam1 gslsfzetam1int gslsfhzeta gslsfetaint gslsfeta IPOPT inv dgeev zgeev geev geev dggev zggev dsygvd dgesdd zhegv dsyev zheev Wait trywait Post msync Read Write newuoa nloptDIRECT nloptDIRECTL nloptDIRECTLRand nloptDIRECTScal nloptDIRECTNoScal nloptDIRECTLNoScal nloptDIRECTLRandNoScal nloptOrigDIRECT nloptOrigDIRECTL nloptStoGO nloptStoGORand nloptLBFGS nloptPRAXIS nloptVar1 nloptVar2 nloptTNewton nloptTNewtonRestart nloptTNewtonPrecond nloptTNewtonPrecondRestart nloptCRS2 nloptMMA nloptCOBYLA nloptNEWUOA nloptNEWUOABound nloptNelderMead nloptSbplx nloptBOBYQA nloptISRES nloptSLSQP nloptMLSL nloptMLSLLDS nloptAUGLAG nloptAUGLAGEQ srandomdev srandom random MeshGenQA freeyams gmshload gmshload3 savegmsh gslpolysolvequadratic gslpolysolvecubic gslpolycomplexsolve gslrnguniform gslrnguniformpos gslname gslrngget gslrngmin gslrngmax gslrngset gslrngtype applyIlutPrecond makeIlutPrecond savehdf5sol savevtk vtkload vtkload3 isoline Curve Area findallocalmin inv dgeev zgeev geev dggev zggev dsygvd dgesdd zhegv dsyev zheev dgelsy bmo MatUpWind1 MatUpWind0 medit savesol readsol metisnodal metisdual MetricKuate MetricPk mmg3d mmg3d change movemesh23 movemesh2D3Dsurf movemesh3 movemesh movemesh3D deplacement checkbemesh buildlayers bcube cube trunc gluemesh extract showborder getborder AddLayers mshmet defaulttoMUMPSseq defaulttoMUMPSseq netg netgstl netgload defaulttoUMFPACK defaulttoPARDISO ompsetnumthreads ompgetnumthreads ompgetmaxthreads readpcm flush sleep usleep QF1d QF2d QF3d tripleQF scotch readdir unlink rmdir cddir chdir basename dirname mkdir chmod cpfile stat isdir getenv setenv unsetenv SplitedgeMesh splitmesh12 splitmesh3 splimesh4 splitmesh6 defaulttoSuperLu symmetrizeCSR tetgconvexhull tetgtransfo tetg tetgreconstruction defaulttoUMFPACK64 Vtkaddmesh Vtkaddscalar Vtkaddmesh Vtkaddscalar 
syn keyword ffFunctionField      average jump mean otherside
syn keyword ffFunctionDiff       dn dx dxx dxy dy dyx dyy dz
syn keyword ffFunctionFE         interpolate
syn keyword ffFunctionInt        int1d int2d intalledges on
syn keyword ffFunctionMath       abs acos acosh arg asin asinh atan atan2 atanh ceil conj cos cosh exp
syn keyword ffFunctionMath       floor imag log log10 max min norm polar pow sin sinh sqrt tan tanh
syn keyword ffFunctionMath       randinit randint31 randint32 randreal1 randreal2 randreal3 randres53
syn keyword ffFunctionMatrix     set
syn keyword ffFunctionMesh       adaptmesh buildmesh buildmeshborder checkmovemesh emptymesh
syn keyword ffFunctionMesh       movemesh readmesh savemesh splitmesh square triangulate trunc
syn keyword ffFunctionPara       broadcast processor
syn keyword ffFunctionPlot       plot
syn keyword ffFunctionSolver     BFGS convect EigenValue LinearCG LinearGMRES Newton NLCG
syn keyword ffFunctionSystem     assert clock dumptable exec exit
syn keyword ffGlobal             area cin cout HaveUMFPACK hTriangle label lenEdge N NoUseOfWait
syn keyword ffGlobal             nTonEdge nuEdge nuTriangle P region verbosity version x y z
syn keyword ffmethodCoordo       x y z
syn keyword ffmethodFespace      ndof ndofK
syn keyword ffmethodStream       default noshowbase noshowpos showbase showpos precision scientific
syn keyword ffmethodStream       eof good
syn keyword ffmethodMatrix       coef diag m n nbcoef resize
syn keyword ffmethodMesh         area label nt nuTriangle nv region
syn keyword ffmethodString       find length rfind size
syn keyword ffmethodVector       im l1 l2 linfty max min re resize sum
syn keyword ffParameter          abserror anisomax append aspectratio bb binside bmat bw
syn keyword ffParameter          cadna clean cmm cutoff dimKrylov eps err errg factorize fill
syn keyword ffParameter          grey hmax hmin hsv init inquire inside IsMetric iso ivalue
syn keyword ffParameter          keepbackvertices label maxit maxsubdiv metric nbarrow nev nbiso
syn keyword ffParameter          nbiter nbiterline nbjacoby nbsmooth nbvx ncv nomeshgeneration omega
syn keyword ffParameter          op optimize periodic power precon ps
syn keyword ffParameter          qfe qfnbpE qfnbpT qforder qft ratio
syn keyword ffParameter          rescaling save sigma solver split splitin2 splitpbedge
syn keyword ffParameter          strategy sym t tgv thetamax tol tolpivot tolpivotsym value varrow
syn keyword ffParameter          vector veps verbosity viso wait
syn keyword ffSyntax             break continue else end endl for if include load mpirank mpisize return while
syn keyword ffType               BoundaryProblem bool border complex fespace func ifstream int matrix mesh mesh3 fespace
syn keyword ffType               ofstream problem R3 real solve string varf
syn keyword ffType				 int bool real complex string border mesh mesh3 fespace macro IFMACRO ENDIFMACRO func FE-functions problem solve varf 
" syn keyword ffUnclear
 


" Default highlighting
if version >= 508 || !exists("did_ff_syntax_inits")
  if version < 508
    let did_ff_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink ffBoolean              Boolean
  HiLink ffConstantEF           Constant
  HiLink ffConstantNum          Number
  HiLink ffConstantQF           Constant
  HiLink ffConstantSolver       Constant
  HiLink ffFunction             Function   
  HiLink ffFunctionExt          Function   
  HiLink ffFunctionField        Function   
  HiLink ffFunctionDiff         Function
  HiLink ffFunctionFE           Function
  HiLink ffFunctionInt          Function
  HiLink ffFunctionMath         Function
  HiLink ffFunctionMatrix       Function
  HiLink ffFunctionMesh         Function
  HiLink ffFunctionPara         Function
  HiLink ffFunctionPlot         Function
  HiLink ffFunctionSolver       Function
  HiLink ffFunctionSystem       Function
  HiLink ffGlobal               Function
  HiLink ffmethodCoordo         Function
  HiLink ffmethodFespace        Function
  HiLink ffmethodMatrix         Function
  HiLink ffmethodMesh           Function
  HiLink ffmethodStream         Function
  HiLink ffmethodString         Function
  HiLink ffmethodVector         Function
  HiLink ffParameter            Function
  HiLink ffSyntax               Statement 
  HiLink ffType                 Type 
  HiLink ffUnclear              Error         " En attendant...

  delcommand HiLink
endif

let b:current_syntax = "edp"

