# Some General Variables
export FOAM_VERBOSE=1
compilerInstall=System

## System installed mesa (Extra repository)
export MESA_SYSTEM=1
export MESA_DIR=/usr
export MESA_LIB_DIR=$MESA_DIR/lib
export MESA_INCLUDE_DIR=$MESA_DIR/include

# ## System installed Cuda (optional - Community repository)
# export CUDA_SYSTEM=1
# export CUDA_DIR=/opt/cuda
# export CUDA_BIN_DIR=$CUDA_DIR/bin
# export CUDA_LIB_DIR=$CUDA_DIR/lib64
# export CUDA_INCLUDE_DIR=$CUDA_DIR/include
# export CUDA_ARCH=sm_30

# Configuration for ThirdParty/AllMake.stage1
## System installed llvm (optional - Extra repository)
export LLVM_SYSTEM=1
export LLVM_DIR=/usr
export LLVM_BIN_DIR=$LLVM_DIR/bin
export LLVM_LIB_DIR=$LLVM_DIR/lib
export LLVM_INCLUDE_DIR=$LLVM_DIR/include

## System installed Python (python - Extra repository)
export PYTHON_SYSTEM=1
export PYTHON_DIR=/usr
export PYTHON_BIN_DIR=$PYTHON_DIR/bin

## System installed m4 (core repository)
export M4_SYSTEM=1
export M4_DIR=/usr

## System installed bison (core repository)
export BISON_SYSTEM=1
export BISON_DIR=/usr

## System installed flex (core repository)
export FLEX_SYSTEM=1
export FLEX_DIR=/usr

## System installed CMake (cmake - Extra repository)
export CMAKE_SYSTEM=1
export CMAKE_DIR=/usr
export CMAKE_BIN_DIR=$CMAKE_DIR/bin

# Configuration for ThirdParty/AllMake.stage2
## Specify system openmpi (openmpi - Extra repository)
export WM_MPLIB=SYSTEMOPENMPI
export OPENMPI_DIR=/usr
export OPENMPI_BIN_DIR=$OPENMPI_DIR/bin
export OPENMPI_LIB_DIR="`$OPENMPI_BIN_DIR/mpicc --showme:libdirs`"
export OPENMPI_INCLUDE_DIR="`$OPENMPI_BIN_DIR/mpicc --showme:incdirs`"
export OPENMPI_COMPILE_FLAGS="`$OPENMPI_BIN_DIR/mpicc --showme:compile`"
export OPENMPI_LINK_FLAGS="`$OPENMPI_BIN_DIR/mpicc --showme:link`"

## MPI runtime options
export MPI_BUFFER_SIZE=100000000
export MPIRUN_OPTIONS=-oversubscribe

# Configuration for ThirdParty/AllMake.stage3
## System installed Metis (metis - Extra repository)
export METIS_SYSTEM=1
export METIS_DIR=/usr
export METIS_LIB_DIR=$METIS_DIR/lib
export METIS_INCLUDE_DIR=$METIS_DIR/include

## System installed ParMGridgen (mgridgen - AUR)
export PARMGRIDGEN_SYSTEM=1
export PARMGRIDGEN_DIR=/usr
export PARMGRIDGEN_BIN_DIR=$PARMGRIDGEN_DIR/bin
export PARMGRIDGEN_LIB_DIR=$PARMGRIDGEN_DIR/lib
export PARMGRIDGEN_INCLUDE_DIR=$PARMGRIDGEN_DIR/include

## System installed Libccmio (libccmio - AUR)
export LIBCCMIO_SYSTEM=1
export LIBCCMIO_DIR=/usr
export LIBCCMIO_LIB_DIR=$LIBCCMIO_DIR/lib
export LIBCCMIO_INCLUDE_DIR=$LIBCCMIO_DIR/include

## Build provided ThirdParty Mesquite 2.3.0 (TODO)
export WM_THIRD_PARTY_USE_MESQUITE_230=1

## System installed Scotch (scotch - AUR)
export SCOTCH_SYSTEM=1
export SCOTCH_DIR=/usr
export SCOTCH_BIN_DIR=$SCOTCH_DIR/bin
export SCOTCH_LIB_DIR=$SCOTCH_DIR/lib
export SCOTCH_INCLUDE_DIR=$SCOTCH_DIR/include/scotch
#export SCOTCH_INCLUDE_DIR=$SCOTCH_DIR/include #which one?


## System installed ParMetis (parmetis - AUR)
export PARMETIS_SYSTEM=1
export PARMETIS_DIR=/usr
export PARMETIS_LIB_DIR=$PARMETIS_DIR/lib
export PARMETIS_INCLUDE_DIR=$PARMETIS_DIR/include

## System installed Zoltan (optional, trilinos - Community repository)
export ZOLTAN_SYSTEM=1
export ZOLTAN_DIR=/usr
export ZOLTAN_BIN_DIR=$ZOLTAN_DIR/bin
export ZOLTAN_LIB_DIR=$ZOLTAN_DIR/lib
export ZOLTAN_INCLUDE_DIR=$ZOLTAN_DIR/include

## Build provided ThirdParty PyFoam 0.6.9 (TODO)
export WM_THIRD_PARTY_USE_PYFOAM_069=1

## System installed hwloc
export HWLOC_SYSTEM=1
export HWLOC_DIR=/usr
export HWLOC_BIN_DIR=$HWLOC_DIR/bin

# Configuration for ThirdParty/AllMake.stage4
## System installed qt
export QT_DIR=/usr
export QT_BIN_DIR=$QT_DIR/bin

## System installed ParaView
export PARAVIEW_SYSTEM=1
export PARAVIEW_DIR=/usr
export PARAVIEW_BIN_DIR=$PARAVIEW_DIR/bin
export ParaView_VERSION=$(pacman -Q $(pacman -Qqo $(which paraview)) | sed -e 's/.* //; s/-.*//g') || exit 1
export ParaView_MAJOR=`echo $ParaView_VERSION | cut -d '.' -f1`

# Add in preset user preferences: will override site preferences
if [ -e $WM_PROJECT_USER_DIR/etc/prefs.sh ]
then
    _foamSource $WM_PROJECT_USER_DIR/etc/prefs.sh
fi
