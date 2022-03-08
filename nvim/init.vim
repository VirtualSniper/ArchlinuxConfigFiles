set nocompatible "设置 VIM 不需要和 VI 兼容

set nobackup " 不需要备份文件
set undodir=~/.vim/undodir " 设置撤销文件目录
if !isdirectory(&undodir)
    call mkdir(&undodir, 'p', 0700)
endif

" 鼠标设置
if has('mouse') 
    if has('gui_running') || (&term =~ 'xterm' && !has('mac')) 
        set mouse=a 
    else 
        set mouse=nvi 
    endif
endif

" 修改leader键
let mapleader = ','
let g:mapleader = ','

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
"
" " Declare the list of plugins.
" Plug 'tpope/vim-sensible'
" Plug 'junegunn/seoul256.vim'
"
" " List ends here. Plugins become visible to Vim after this call.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'ojroques/nvim-lspfuzzy'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neovim/nvim-lspconfig'
"Plug 'glepnir/lspsaga.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" For luasnip users.
" Plug 'L3MON4D3/LuaSnip'
" Plug 'saadparwaiz1/cmp_luasnip'

" For ultisnips users.
" Plug 'SirVer/ultisnips'
" Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" For snippy users.
" Plug 'dcampos/nvim-snippy'
" Plug 'dcampos/cmp-snippy'
call plug#end()

lua << EOF
require'lspconfig'.gopls.setup{}
require('lspfuzzy').setup {}

 -- Setup nvim-cmp.
 local cmp = require'cmp'

 cmp.setup({
   snippet = {
     -- REQUIRED - you must specify a snippet engine
     expand = function(args)
       vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
       -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
       -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
       -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
     end,
   },
   mapping = {
     ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
     ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
     ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
     ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
     ['<C-e>'] = cmp.mapping({
       i = cmp.mapping.abort(),
       c = cmp.mapping.close(),
     }),
     ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
   },
   sources = cmp.config.sources({
     { name = 'nvim_lsp' },
     { name = 'vsnip' }, -- For vsnip users.
     -- { name = 'luasnip' }, -- For luasnip users.
     -- { name = 'ultisnips' }, -- For ultisnips users.
     -- { name = 'snippy' }, -- For snippy users.
   }, {
     { name = 'buffer' },
   })
 })

 -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
 cmp.setup.cmdline('/', {
   sources = {
     { name = 'buffer' }
   }
 })

 -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
 cmp.setup.cmdline(':', {
   sources = cmp.config.sources({
     { name = 'path' }
   }, {
     { name = 'cmdline' }
   })
 })

 -- Setup lspconfig.
 local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
 -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
 -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
 --   capabilities = capabilities
 -- }  

EOF


nnoremap <silent><leader>ls <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent><leader>ll <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent><leader>lg <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent><leader>la <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent><leader>l; <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent><leader>l, <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

nnoremap <leader>fo :Files<CR>
nnoremap <leader>fif :Rg<CR> 

"nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
"nnoremap <silent> gh :Lspsaga lsp_finder<CR>

let g:go_debug_windows = {
      \ 'vars':       'rightbelow 60vnew',
      \ 'stack':      'rightbelow 10new',
\ }

" 查看文件列表
nmap <C-p> :Files<CR> 
" 查看当前 Buffer，两次 Ctrl + e 快速切换上次打开的 Buffer
nmap <C-e> :Buffers<CR> let g:fzf_action = { 'ctrl-e': 'edit' }

