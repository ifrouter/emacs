apt-get install clang llvm llvm-dev libclang-dev 
git clone https://github.com/Golevka/emacs-clang-complete-async.git 
make 
cp clang-complete auto-complete-clang-async.el ~/.emacs_plugins