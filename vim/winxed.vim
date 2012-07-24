" Vim syntax file
" Language  : Winxed (http://winxed.org/)
" Maintainer: Brian Gernhardt

" Based on the javascript syntax file

" TODO:
"  * PIR
"  * attributes

if !exists("main_syntax")
	if version < 600
		syntax clear
	elseif exists("b:current_syntax")
		finish
	endif
	let main_syntax = 'winxed'
endif

syn case match
syn sync fromstart
syn sync maxlines=100

syn keyword winxedCommentTodo TODO FIXME XXX TBD contained
syn match   winxedLineComment "\(\/\/\|#\).*" contains=@Spell,winxedCommentTodo
syn region  winxedComment     start="/\*" end="\*/" contains=@Spell,winxedCommentTodo
syn match   winxedSpecial     "\v\\([abtnvfre]|c[A-Z]|x(\{\x{1,8}\}|\x\x\?)|u\x{4}|U\x{8}|\o{1,3})"
syn region  winxedStringD     start=+"+ skip=+\\\\\|\\"+ end=+"\|$+ contains=winxedSpecial
syn region  winxedStringS     start=+'+ end=+'\|$+
syn region  winxedHeredoc     matchgroup=winxedHereMark start=+<<:\z(.*\)$+ end=+^\z1:>>$+

syn match   winxedNumber "\m0[xX]\x\+|\d(.\d+)?([eE][+-]\d\+)?"

syn keyword winxedConditional if else switch
syn keyword winxedRepeat      while for do in
syn keyword winxedBranch      break continue
syn keyword winxedOperator    new delete instanceof
syn keyword winxedType        float int string var
syn keyword winxedStatement   return yeild
syn keyword winxedBoolean     true false
syn keyword winxedNull        null
syn keyword winxedIdentifier  self
syn keyword winxedLabel       case default
syn keyword winxedException   try catch throw
syn keyword winxedFunction    function inline
syn keyword winxedBuiltin     die exit time floattime sleep spawnw getstdin getstdout getstderr open Error elements length bytelength chr ord substr replace indexof join escape unescape trans_encoding encoding_name upcase downcase titlecase split chomp push unshift abs sqrt pow exp ln sin cos tan asin acos atan sinh cosh tanh getinterp getcontext get_context get_class typeof getattribute setattribute find_method callmethodwithargs clone compreg load_language loadlib load_bytecode load_packfile dlfunc sprintf print say cry __ASSERT__ invoke
syn match   winxedBuiltinType +\(pop\|shift\)_\(var\|int\|float\|string\)+
syn match   winxedBraces      "[{}\[\]]"
syn match   winxedParens      "[()]"
syn match   winxedDirective   +^\$\(include\(_const\)\?\|load\|loadlib\)\>+

syn keyword winxedKeyword class const exists extern goto namespace static using volatile

if version >= 508 || !exists("did_winxed_syn_inits")
	if version < 508
		let did_winxed_syn_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif
	HiLink winxedComment     Comment
	HiLink winxedLineComment Comment
	HiLink winxedCommentTodo Todo
	HiLink winxedSpecial     Special
	HiLink winxedStringS     String
	HiLink winxedStringD     String
	HiLink winxedHeredoc     String
	HiLink winxedHereMark    Special
	HiLink winxedNumber      winxedValue
	HiLink winxedConditional Conditional
	HiLink winxedRepeat      Repeat
	HiLink winxedBranch      Conditional
	HiLink winxedOperator    Operator
	HiLink winxedType        Type
	HiLink winxedStatement   Statement
	HiLink winxedFunction    Keyword
	HiLink winxedBuiltin     Function
	HiLink winxedBuiltinType Function
	HiLink winxedBraces      Function
	HiLink winxedError       Error
	HiLink winxedParenError  winxedError
	HiLink winxedNull        Keyword
	HiLink winxedBoolean     Boolean

	HiLink winxedIdentifier  Identifier
	HiLink winxedLabel       Label
	HiLink winxedException   Exception
	HiLink winxedKeyword     Keyword
	HiLink winxedDirective   PreProc

	delcommand HiLink
endif

let b:current_syntax = "winxed"
if main_syntax == 'winxed'
	unlet main_syntax
endif
