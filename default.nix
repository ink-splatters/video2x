
{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSUserEnv {
  name = "node";
  targetPkgs = pkgs: [
    pkgs.nodejs
  ];
  
  runScript = pkgs.writeScript "init.sh" ''
    export PATH="$PWD/node_modules/.bin/:$PATH"
    export NPM_PACKAGES="$HOME/.npm-packages"
    exec bash
  '';
}).env

# with import <nixpkgs>{} ;  with llvmPackages_17; with darwin ;
# mkShell.override { inherit stdenv;} {
#     nativeBuildInputs = [
# 	clang_17
# 	llvm_17
# 	bintools
# 	ninja
# 	cmake
# 	xcodebuild
# 	swig
#     ];

#     buildInputs = [
# 	openmp
# 	vulkan-headers
# 	vulkan-loader
# 	vulkan-tools
#  (buildFHSUserEnv.override {inherit (llvmPackages_17) stdenv; } {
#   name="env";
#    profile = ''
#      set -e
#      eval "$(micromamba shell hook --shell=posix)"
#      micromamba activate v2x
#      pip install -U pip wheel setuptools pdm
#      pdm install --verbose
#      set +e
#    '';
#  }).env
#     ];


# #    LD_LIBRARY_PATH="${vulkan-loader}/lib";

#  #   cmakeFlags=[
# #	"-DPYTHON_INCLUDE_DIR=$(python -c \"import sysconfig; print(sysconfig.get_path('include'))\")"
# #	"-DPYTHON_LIBRARY=$(python -c \"import sysconfig; print(sysconfig.get_config_var('LIBDIR'))\")"
#  #   ];

#  #   shellHook=''
# #	export CMAKE_FLAGS="${lib.concatMapStrings (s: s + " ") cmakeFlags}"
#  #   '';
# }


# with import <nixpkgs>{} ;  with llvmPackages_17; with darwin ;
#  (buildFHSUserEnv.override {inherit (llvmPackages_17) stdenv; } {
#   name="env";

#    profile = ''
#      set -e
#      eval "$(micromamba shell hook --shell=posix)"
#      micromamba activate v2x
#      pip install -U pip wheel setuptools pdm
#      pdm install --verbose
#      set +e
#    '';
#  }).env