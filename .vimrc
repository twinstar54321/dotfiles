"基本設定
set nocompatible    "vi互換off
set noswapfile      "スワップファイル作らない
set vb t_vb=        "ビープをならさない

"Display
set number          "行番号表示
set showmatch       "括弧の対応をハイライト
set cursorline      "行番号ハイライト
set laststatus=2
set showcmd
set ruler
syntax on

"IDEっぽくする
set hidden      "変更中のファイルでも、保存しないで他のファイルを表示
set showmatch   " 閉じ括弧が入力されたとき、対応する開き括弧にわずかの間ジャンプする
set matchtime=1 " マッチを表示する時間を0.1秒にする
set list        " 不可視文字の表示
set listchars=tab:»･,trail:･,nbsp:% " tabに»･、行末の空白に･、ノーブレークスペース文字に%を使う
set incsearch   " インクリメンタルサーチ
set ignorecase  " 検索パターンの大文字小文字を区別しない
set smartcase   " 検索パターンに大文字が含まれていたら、大文字小文字を区別する。
set hlsearch    "検索結果をハイライト

" アンドゥの履歴をファイルに保存し、Vim を一度終了したとしてもアンドゥやリドゥを行えるようにする
if has('persistent_undo')
    set undofile
    " デフォルトではファイルのディレクトリに.<ファイル名>.un~のファイルができるので一箇所にまとめる
    let &undodir = expand('~/.cache/vim/undo')
    if !isdirectory(&undodir)
        call mkdir(&undodir, 'p')
    endif
endif

"行末スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /\s\+$/
    augroup END
    call ZenkakuSpace()
endif

"Input
set backspace=2
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent      "自動でインデント
set smartindent     "新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする。

"補完・履歴
set wildmenu            "コマンド補完を強化
set wildchar=<tab>      "コマンド補完を開始するキー
set wildmode=list:full  "リスト表示，最長マッチ
set history=1000        "コマンド・検索パターンの履歴数

"encorde
set encoding=utf-8
set fileencodings=utf-8,euc-jp
