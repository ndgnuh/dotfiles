#
# input method config, exporting gtk_im_module=xim may cause flicker on some application
#
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export QT4_IM_MODULE=ibus
export XMODIFIERS=@im=ibus


# WINE DOESN'T WORK WITH PROPRIETARY NVIDIA DRIVER


# export WINEESYNC=1


# CUSTOM PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.yarn/bin:$PATH


# JULIA STUFF
export JULIA_DEPOT_PATH=$HOME/.cache/julia
export JULIA_NUM_THREADS=16
export JULIA_CUDA_USE_BINARYBUILDER=true


# SOME APPLICATION DOESN'T SUPPORT GTK_IM_MODULE=ibus
alias teams="GTK_IM_MODULE=xim teams"
alias chromium="GTK_IM_MODULE=xim chromium"


# TEXLIVE
export TEXHOME=$HOME/Application/texlive
if [ -d $TEXHOME ]; then
	export TEXDIR=$TEXHOME/2021
	export TEXMFLOCAL=$TEXHOME/texmf-local
	export TEXMFSYSVAR=$TEXHOME/2021/texmf-var
	export TEXMFSYSCONFIG=$TEXHOME/texmf-config
	export TEXMFVAR=$TEXMFSYSVAR
	export TEXMFCONFIG=$TEXMFSYSCONFIG
	export TEXMFHOME=$TEXHOME/texmf
	export PATH=$PATH:$TEXDIR/bin/x86_64-linux
	export MANPATH=$MANPATH:/home/hung/Application/texlive/2021/texmf-dist/doc/man
	export INFOPATH=$INFOPATH:/home/hung/Application/texlive/2021/texmf-dist/doc/info
fi
. "$HOME/.cargo/env"
