" Configuration for dart-vim-plugin
" Key mapping for running Dart code
nnoremap <leader>r :!dart %<CR>

" Configuration for vim-flutter
" Key mapping for running Flutter apps
nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>
nnoremap <leader>fD :FlutterVisualDebug<cr>

" Configuration for vim-lsc and vim-lsc-dart
" Example LSP configuration for Dart
autocmd FileType dart LspInstallServer dartls

