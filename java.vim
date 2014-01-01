" Java
let java_allow_cpp_keywords=1
ia jprint System.out.println
ia jmain public static void main(String[] args) {
" Open curly-brace block -- open a new {} block and enter insert mode
nnoremap <Leader>oc A {<CR>}<Esc>O<C-t>
" 'vim' selects inside of method
vnoremap im [mo]M
