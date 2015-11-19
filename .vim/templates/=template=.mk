################################################################################
# %CAMELCLASS% makefile                                                        #
#                                                                              #
# This file provides:                                                          #
# - %MACROCLASS%_INC    Directories to search for %CAMELCLASS% headers         #
# - %MACROCLASS%_SRC    %CAMELCLASS% source files                              #
# - %MACROCLASS%_ASM    %CAMELCLASS% assembly files                            #
# - %MACROCLASS%_SRC    %CAMELCLASS% preprocessor definitions                  #
################################################################################

# --- DIRECTORIES ------------------------------------------------------------ #

# %CAMELCLASS% directory is the one this makefile resides in
%MACROCLASS%_DIR	:= $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

%MACROCLASS%_INC_DIR	:= $(%MACROCLASS%_DIR)/inc
%MACROCLASS%_SRC_DIR	:= $(%MACROCLASS%_DIR)/src

# --- HEADERS ---------------------------------------------------------------- #

%MACROCLASS%_INC	:=

# --- SOURCES ---------------------------------------------------------------- #

%MACROCLASS%_SRC	:=

# --- ASSEMBLY --------------------------------------------------------------- #

%MACROCLASS%_ASM	:=

# --- DEFINITIONS ------------------------------------------------------------ #

%MACROCLASS%_DEF	:=
