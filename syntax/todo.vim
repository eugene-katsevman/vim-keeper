syntax region todoAttributes start="\[" end="[$\]]"
syntax match todoTopic ".\+:$"
syntax match todoDuration "\d\+[hm]"
syntax region todoOnelineComment start="#" end="$"
syntax region todoMultilineComment start="\/\*" end="\*\/"
highlight default link todoAttributes Structure
highlight default link todoTopic String
highlight default link todoDuration String
highlight default link todoOnelineComment Comment
highlight default link todoMultilineComment Comment
