use v6.d;
use MONKEY-SEE-NO-EVAL;

# Comprehensive Bulgarian language module for Raku
# Covers ALL aspects of Raku with Bulgarian terminology
# 
# NOTE: Due to Rakudo issue #2404, this uses EXPORT mechanism
# instead of grammar modifications

sub EXPORT(|) {
    # === CORE I/O FUNCTIONS ===
    my &кажи = sub (|c) { say |c };                    # say
    my &отпечатай = sub (|c) { print |c };                 # print
    my &печат = sub (|c) { print |c };                 # print
    my &изход = sub (|c) { put |c };                    # put
    my &вход = sub () { get };                          # get
    my &получи = sub () { get };                          # get (alternative)
    my &редове = sub () { lines };                      # lines
    my &думи = sub (|c) { words |c };                  # words
    my &подкана = sub (|c) { prompt |c };             # prompt
    my &запитване = sub (|c) { prompt |c };                # prompt (alternative)
    my &предупреди = sub (|c) { warn |c };              # warn
    my &забележи = sub (|c) { note |c };                  # note
    my &поток_изход = sub () { $*OUT };                # stdout
    my &поток_грешки = sub () { $*ERR };                # stderr
    my &поток_вход = sub () { $*IN };                  # stdin
    
    # === CONTROL FLOW ===
    my &умри = sub (|c) { die |c };                     # die
    my &грешка = sub (|c) { die |c };                   # die (error)
    my &излез = sub (|c) { exit |c };                   # exit
    my &прекъсни = sub (|c) { last |c };                  # last
    my &следващ = sub (|c) { next |c };               # next
    my &повтори = sub (|c) { redo |c };                 # redo
    my &продължи = sub (|c) { proceed |c };             # proceed
    my &успех = sub (|c) { succeed |c };                # succeed
    my &провал = sub (|c) { fail |c };                  # fail
    # my &когато_ще_бъде = sub ($cond, &code) { whenever $cond { &code() } }; # whenever - needs react/supply context
    my &реагирай = sub (&code) { react &code };         # react
    my &снабди = sub (&code) { supply &code };         # supply
    my &излъчи = sub ($val) { emit $val };             # emit
    my &готово = sub () { done };                       # done
    
    # === TYPE CONVERSION ===
    my &низ = sub ($x) { ~$x };                      # string conversion
    my &текст = sub ($x) { ~$x };                       # string (alternative)
    my &число = sub ($x) { +$x };                       # numeric conversion
    my &цяло = sub ($x) { $x.Int };                    # integer conversion
    my &дробно = sub ($x) { $x.Num };                  # floating point
    my &рационално = sub ($x) { $x.Rat };             # rational
    my &комплексно = sub ($re, $im = 0) { Complex.new($re, $im) }; # complex
    my &булево = sub ($x) { ?$x };                      # boolean conversion
    my &логическо = sub ($x) { ?$x };                  # boolean (alternative)
    my &списък = sub (|c) { list |c };                  # list conversion
    my &масив = sub (|c) { array |c };                 # array conversion
    my &хеш = sub (|c) { hash |c };                     # hash conversion
    my &множество = sub (|c) { set |c };                    # set conversion
    my &торба = sub (|c) { bag |c };                    # bag conversion
    my &смес = sub (|c) { mix |c };                    # mix conversion

    # === CONSTANTS ===
    my \истина = True;                                  # True
    my \ИСТИНА = True;                                  # TRUE
    my \вярно = True;                                  # True (alternative)
    my \да = True;                                      # Yes
    my \лъжа = False;                                   # False
    my \ЛЪЖА = False;                                   # FALSE
    my \НЕВЯРНО = False;                                   # FALSE
    my \невярно = False;                               # False (alternative)
    my \не = False;                                     # No
    my \празно = Nil;                                    # Nil
    sub нула() { Nil }                                  # Nil (null)
    my \нищо = Nil;                                    # Nothing
    my \всяко = Any;                                    # Any
    my \безкрайност = Inf;                            # Infinity
    my \минус_безкрайност = -Inf;                     # -Infinity
    my \НеЧисло = NaN;                                  # NaN
    my \пи = pi;                                        # pi
    my \е = e;                                        # e (Euler's number)
    my \тау = tau;                                      # tau (2π)
    # my \аз = self;                                       # self - needs object context
    my \празен_списък = Empty;                          # Empty
    # my \край = End;                                    # End
    
    # === MATHEMATICAL FUNCTIONS ===
    # Basic operations
    my &сума = sub (|c) { sum |c };                    # sum
    my &произведение = sub (@a) { [*] @a };             # product
    my &минимум = sub (|c) { min |c };                  # min
    my &максимум = sub (|c) { max |c };                 # max
    my &средно = sub (@a) { @a.sum / @a.elems };       # average
    my &минмакс = sub (|c) { minmax |c };               # minmax
    
    # Soviet mathematical terminology
    my &корен = sub ($x, $n = 2) { $x ** (1/$n) };     # root (default square)
    my &квадрат = sub ($x) { $x ** 2 };                 # square
    my &куб = sub ($x) { $x ** 3 };                     # cube
    my &степен = sub ($x, $y) { $x ** $y };            # power
    my &модул = sub ($x) { abs($x) };                  # absolute value
    my &знак = sub ($x) { sign($x) };                   # sign
    my &спрегнато = sub ($x) { $x.conj };             # conjugate
    my &действителна = sub ($x) { $x.re };            # real part
    my &имагинерна = sub ($x) { $x.im };                    # imaginary part
    
    # Trigonometry (Soviet/Russian terms)
    my &синус = sub ($x) { sin($x) };                   # sine
    my &косинус = sub ($x) { cos($x) };                 # cosine
    my &тангенс = sub ($x) { tan($x) };                 # tangent
    my &котангенс = sub ($x) { cotan($x) };             # cotangent
    my &секанс = sub ($x) { sec($x) };                  # secant
    my &косеканс = sub ($x) { cosec($x) };              # cosecant
    my &арксинус = sub ($x) { asin($x) };               # arcsine
    my &арккосинус = sub ($x) { acos($x) };               # arccosine
    my &арктангенс = sub ($x) { atan($x) };               # arctangent
    my &арктангенс2 = sub ($y, $x) { atan2($y, $x) };   # atan2
    
    # Hyperbolic functions
    my &хиперболичен_синус = sub ($x) { sinh($x) };             # hyperbolic sine
    my &хиперболичен_косинус = sub ($x) { cosh($x) };           # hyperbolic cosine
    my &хиперболичен_тангенс = sub ($x) { tanh($x) };           # hyperbolic tangent
    my &архиперболичен_синус = sub ($x) { asinh($x) };          # inverse hyperbolic sine
    my &архиперболичен_косинус = sub ($x) { acosh($x) };        # inverse hyperbolic cosine
    my &архиперболичен_тангенс = sub ($x) { atanh($x) };        # inverse hyperbolic tangent
    
    # Logarithms and exponentials
    my &логаритъм = sub ($x, $base = e) { log($x, $base) }; # logarithm
    my &натурален_логаритъм = sub ($x) { log($x) };    # natural log
    my &десетичен_логаритъм = sub ($x) { log10($x) };   # log base 10
    my &двоичен_логаритъм = sub ($x) { log2($x) };      # log base 2
    my &експонента = sub ($x) { exp($x) };              # exponential
    my &експонента_минус_едно = sub ($x) { exp($x) - 1 }; # exp(x) - 1
    
    # Rounding functions
    my &закръгли = sub ($x) { round($x) };                # round
    my &таван = sub ($x) { ceiling($x) };             # ceiling
    my &под = sub ($x) { floor($x) };                   # floor
    my &отрежи = sub ($x) { truncate($x) };              # truncate
    
    # Number theory
    my &НОД = sub ($a, $b) { $a gcd $b };               # greatest common divisor
    my &НОК = sub ($a, $b) { $a lcm $b };               # least common multiple
    my &просто = sub ($n) { $n.is-prime };             # is prime
    my &факториел = sub ($n) { [*] 1..$n };             # factorial
    my &пермутации = sub ($n, $k) { [*] ($n-$k+1)..$n };  # permutations
    my &комбинации = sub ($n, $k) { пермутации($n, $k) / факториел($k) };  # combinations
    
    # === ARRAY/LIST OPERATIONS ===
    my &дължина = sub (@a) { @a.elems };                  # length/elems
    my &количество = sub (@a) { @a.elems };             # count
    my &размер = sub (@a) { @a.elems };                 # size
    my &добави = sub (@a, |c) { @a.push(|c) };          # push
    my &присъедини = sub (@a, |c) { @a.append(|c) };    # append
    my &вмъкни = sub (@a, |c) { @a.unshift(|c) };       # unshift
    my &вмъкни_отпред = sub (@a, |c) { @a.prepend(|c) }; # prepend
    my &извади = sub (@a) { @a.pop };                    # pop
    my &извлечи = sub (@a) { @a.shift };                # shift
    my &сортирай = sub (@a, |c) { @a.sort(|c) };        # sort
    my &разбъркай = sub (@a) { @a.pick(*) };            # shuffle
    my &обърни = sub (@a) { @a.reverse.List };       # reverse
    my &уникални = sub (@a) { @a.unique.List };       # unique
    my &уникализирай = sub (@a) { @a.unique.List };       # unique
    my &изравни = sub (@a) { @a.flat };                  # flat
    my &задълбочи = sub (@a, $n = ∞) { @a.deepmap({$_}, $n) }; # deepmap
    my &съедини = sub (|c) { join |c };                 # join
    my &обедини = sub (|c) { join |c };                # join (alternative)
    my &раздели = sub ($str, $sep) { split($sep, $str) };  # split
    my &разбий = sub ($str, $sep) { split($sep, $str) };   # split (alternative)
    my &първи = sub (@a, |c) { @a.first(|c) };         # first
    my &последен = sub (@a, |c) { @a.tail(|c) };       # last/tail
    my &глава = sub (@a, $n = 1) { @a.head($n) };      # head
    my &опашка = sub (@a, $n = 1) { @a.tail($n) };       # tail
    my &вземи = sub (@a, $n) { @a.pick($n) };          # pick
    my &избери = sub (@a, $n) { @a.roll($n) };          # roll
    my &отрязък = sub (@a, |c) { @a.slice(|c) };           # slice
    my &парче = sub (@a, |c) { @a.slice(|c) };          # slice (alternative)
    my &завърти = sub (@a, $n) { @a.rotate($n) };       # rotate
    my &ротор = sub (@a, $n) { @a.rotor($n) };          # rotor
    my &кръстосан_продукт = sub (@a, @b) { @a X @b };               # cross product
    my &свържи = sub (@a, @b) { @a Z @b };               # zip
    my &преплети = sub (|c) { roundrobin |c };         # roundrobin
    my &изглади = sub (@a, $n) { @a.squish($n) };        # squish
    my &двойки = sub (@a) { @a.pairs };                   # pairs
    my &ключове = sub ($c) { $c.keys };                   # keys
    my &стойности = sub ($c) { $c.values };              # values
    my &двойки_ключ_стойност = sub ($c) { $c.kv };        # key-value pairs
    my &антидвойки = sub (@a) { @a.antipairs };           # antipairs
    my &изброи = sub (@a) { @a.enumerate };          # enumerate
    
    # Range operations
    my &диапазон = sub ($from, $to) { $from..$to };     # range
    my &диапазон_изкл = sub ($from, $to) { $from..^$to }; # exclusive range
    my &безкраен = sub ($from) { $from..* };         # infinite range
    my &обратен_диапазон = sub ($from, $to) { $to...$from }; # reverse range
    
    # Set operations
    my &обединение = sub ($a, $b) { $a ∪ $b };         # union
    my &пресичане = sub ($a, $b) { $a ∩ $b };         # intersection
    my &разлика = sub ($a, $b) { $a ∖ $b };            # difference
    my &симетрична_разлика = sub ($a, $b) { $a ⊖ $b };       # symmetric difference
    my &подмножество = sub ($a, $b) { $a ⊆ $b };        # subset
    my &надмножество = sub ($a, $b) { $a ⊇ $b };        # superset
    my &елемент = sub ($x, $set) { $x ∈ $set };         # element of
    my &не_е_елемент = sub ($x, $set) { $x ∉ $set };      # not element of
    
    # === STRING OPERATIONS ===
    my &подрежи = sub ($s) { $s.trim };                  # trim
    my &подрежи_отляво = sub ($s) { $s.trim-leading };    # trim-leading
    my &подрежи_отдясно = sub ($s) { $s.trim-trailing };  # trim-trailing
    my &главни = sub ($s) { $s.uc };                 # uppercase
    my &малки = sub ($s) { $s.lc };                  # lowercase
    my &заглавна = sub ($s) { $s.tc };                 # title case
    my &дума_заглавна = sub ($s) { $s.wordcase };     # word case
    my &обърни_регистър = sub ($s) { $s.flip };       # flip case
    my &съдържа = sub ($s, $needle) { $s.contains($needle) }; # contains
    my &започва_с = sub ($s, $prefix) { $s.starts-with($prefix) }; # starts-with
    my &завършва_с = sub ($s, $suffix) { $s.ends-with($suffix) }; # ends-with
    my &замени = sub ($s, |c) { $s.subst(|c) };         # substitute
    my &замени_всички = sub ($s, |c) { $s.subst(|c, :g) }; # substitute all
    my &транслитерирай = sub ($s, |c) { $s.trans(|c) }; # transliterate
    my &индекс = sub ($s, $needle) { $s.index($needle) }; # index
    my &индекс_отзад = sub ($s, $needle) { $s.rindex($needle) }; # rindex
    my &подниз = sub ($s, |c) { $s.substr(|c) };     # substr
    my &символи = sub ($s) { $s.comb };                 # comb (characters)
    my &графеми = sub ($s) { $s.graphs };               # graphemes
    my &кодове = sub ($s) { $s.ords };                    # ord codes
    my &от_кодове = sub (@codes) { @codes.chrs };        # from char codes
    my &кодови_точки = sub ($s) { $s.codes };          # code points
    my &НФК = sub ($s) { $s.NFC };                      # NFC normalization
    my &НФД = sub ($s) { $s.NFD };                      # NFD normalization
    my &НФКК = sub ($s) { $s.NFKC };                    # NFKC normalization
    my &НФКД = sub ($s) { $s.NFKD };                    # NFKD normalization
    my &същи_знак = sub ($s) { $s.samemark };            # samemark
    my &разбий_редове = sub ($s) { $s.lines };          # lines
    my &разбий_думи = sub ($s) { $s.words };           # words
    my &разбий_полета = sub ($s, |c) { $s.split(|c) };    # split fields
    my &отстъп = sub ($s, $n) { $s.indent($n) };        # indent
    my &повтори_низ = sub ($s, $n) { $s x $n };      # string repeat
    
    # === FILE OPERATIONS (Soviet computing terms) ===
    my &отвори = sub (|c) { open |c };                  # open
    my &затвори = sub ($fh) { $fh.close };               # close
    my &чети = sub ($fh) { $fh.get };                  # read line
    my &чети_символ = sub ($fh) { $fh.getc };          # read character
    my &чети_байт = sub ($fh) { $fh.read(1) };         # read byte
    my &чети_байтове = sub ($fh, $n) { $fh.read($n) };   # read bytes
    my &чети_всичко = sub ($fh) { $fh.slurp };            # slurp
    my &чети_редове = sub ($fh) { $fh.lines };         # read lines
    my &чети_думи = sub ($fh) { $fh.words };          # read words
    my &запиши = sub ($fh, |c) { $fh.say(|c) };         # write line
    my &отпечатай = sub ($fh, |c) { $fh.print(|c) };      # print to file
    my &запиши_байтове = sub ($fh, $buf) { $fh.write($buf) }; # write bytes
    my &прочисти_буфер = sub ($fh) { $fh.flush };                 # flush
    my &позиция = sub ($fh) { $fh.tell };               # tell position
    my &премести = sub ($fh, $pos) { $fh.seek($pos, SeekFromBeginning) }; # seek
    my &премести_от_текуща = sub ($fh, $pos) { $fh.seek($pos, SeekFromCurrent) }; # seek from current
    my &премести_от_края = sub ($fh, $pos) { $fh.seek($pos, SeekFromEnd) }; # seek from end
    my &край_на_файл = sub ($fh) { $fh.eof };            # eof
    my &заключи = sub ($fh) { $fh.lock };            # lock
    my &отключи = sub ($fh) { $fh.unlock };         # unlock
    my &кодировка = sub ($fh) { $fh.encoding };         # encoding
    my &задай_кодировка = sub ($fh, $enc) { $fh.encoding($enc) }; # set encoding
    my &нов_ред = sub ($fh) { $fh.nl };          # newline
    my &задай_нов_ред = sub ($fh, $nl) { $fh.nl = $nl }; # set newline
    
    # File content operations
    my &прочети_файл = sub ($path) { $path.IO.slurp }; # slurp file
    my &запиши_файл = sub ($path, $content) { $path.IO.spurt($content) }; # spurt file
    my &копирай_файл = sub ($from, $to) { $from.IO.copy($to) }; # copy file
    my &премести_файл = sub ($from, $to) { $from.IO.move($to) }; # move file
    my &преименувай_файл = sub ($from, $to) { $from.IO.rename($to) }; # rename file
    my &изтрий_файл = sub ($path) { $path.IO.unlink };   # delete file
    
    # Directory operations
    my &папка = sub (|c) { dir |c };                    # dir
    my &директория = sub (|c) { dir |c };                  # directory
    my &създай_папка = sub ($path) { mkdir $path };     # mkdir
    my &създай_папки = sub ($path) { $path.IO.mkdir };  # mkdir with parents
    my &изтрий_папка = sub ($path) { rmdir $path };      # rmdir
    my &изтрий_дърво = sub ($path) { $path.IO.rmtree }; # remove tree
    my &текуща_папка = sub () { $*CWD };               # current directory
    my &смени_папка = sub ($dir) { chdir $dir };        # change directory
    my &домашна_папка = sub () { $*HOME };             # home directory
    my &временна_папка = sub () { $*TMPDIR };          # temp directory
    my &работна_папка = sub () { $*CWD };               # working directory
    
    # Path operations
    my &път = sub ($path) { $path.IO };                # IO path
    my &път_съществува = sub ($path) { $path.IO.e };   # exists
    my &това_е_файл = sub ($path) { $path.IO.f };          # is file
    my &това_е_папка = sub ($path) { $path.IO.d };         # is directory
    my &това_е_връзка = sub ($path) { $path.IO.l };        # is link
    my &това_е_блоково_устройство = sub ($path) { $path.IO.b }; # is block device
    my &това_е_символно_устройство = sub ($path) { $path.IO.c };        # is character device
    my &това_е_файлов_канал = sub ($path) { $path.IO.p };    # is pipe file
    my &това_е_сокет = sub ($path) { $path.IO.S };         # is socket
    my &четим = sub ($path) { $path.IO.r };          # readable
    my &записваем = sub ($path) { $path.IO.w };      # writable
    my &изпълним = sub ($path) { $path.IO.x };       # executable
    my &собственик = sub ($path) { $path.IO.user };       # owner
    my &група = sub ($path) { $path.IO.group };        # group
    my &режим = sub ($path) { $path.IO.mode };          # mode
    my &размер_на_файл = sub ($path) { $path.IO.s };      # file size
    my &време_на_достъп = sub ($path) { $path.IO.accessed }; # access time
    my &време_на_промяна = sub ($path) { $path.IO.modified }; # modified time
    my &време_на_промяна_на_статус = sub ($path) { $path.IO.changed }; # status change time
    my &абсолютен_път = sub ($path) { $path.IO.absolute }; # absolute path
    my &относителен_път = sub ($path, $base) { $path.IO.relative($base) }; # relative
    my &реален_път = sub ($path) { $path.IO.resolve }; # resolve path
    my &базово_име = sub ($path) { $path.IO.basename }; # basename
    my &име_на_папка = sub ($path) { $path.IO.dirname };   # dirname
    my &разширение = sub ($path) { $path.IO.extension }; # extension
    my &томове = sub () { $*SPEC.volumes };               # volumes
    my &разделител_на_път = sub () { $*SPEC.dir-sep };   # directory separator
    my &родител = sub ($path) { $path.IO.parent };     # parent directory
    my &дъщерен = sub ($path, $child) { $path.IO.child($child) }; # child path
    my &братя = sub ($path) { $path.IO.sibling };      # siblings
    my &добави_път = sub ($path, $add) { $path.IO.add($add) }; # add to path
    
    # === TYPE CHECKING ===
    my &това_е_число = sub ($x) { $x ~~ Numeric };         # is numeric
    my &това_е_цяло_число = sub ($x) { $x ~~ Int };       # is integer
    my &това_е_дроб = sub ($x) { $x ~~ Rat };             # is rational
    my &това_е_дробно = sub ($x) { $x ~~ Num };           # is floating point
    my &това_е_комплексно = sub ($x) { $x ~~ Complex };   # is complex
    my &това_е_низ = sub ($x) { $x ~~ Str };            # is string
    my &това_е_масив = sub ($x) { $x ~~ Array };          # is array
    my &това_е_списък = sub ($x) { $x ~~ List };           # is list
    my &това_е_хеш = sub ($x) { $x ~~ Hash };              # is hash
    my &това_е_речник = sub ($x) { $x ~~ Hash };          # is hash (dict)
    my &това_е_множество = sub ($x) { $x ~~ Set };         # is set
    my &това_е_хеш_множество = sub ($x) { $x ~~ SetHash }; # is SetHash
    my &това_е_торба = sub ($x) { $x ~~ Bag };             # is bag
    my &това_е_хеш_торба = sub ($x) { $x ~~ BagHash };   # is BagHash
    my &това_е_смес = sub ($x) { $x ~~ Mix };             # is mix
    my &това_е_хеш_смес = sub ($x) { $x ~~ MixHash };   # is MixHash
    my &това_е_двойка = sub ($x) { $x ~~ Pair };             # is pair
    my &това_е_диапазон = sub ($x) { $x ~~ Range };        # is range
    my &това_е_последователност = sub ($x) { $x ~~ Seq }; # is sequence
    my &това_е_итератор = sub ($x) { $x ~~ Iterator };     # is iterator
    my &това_е_код = sub ($x) { $x ~~ Code };              # is code
    my &това_е_блок = sub ($x) { $x ~~ Block };            # is block
    my &това_е_подпрограма = sub ($x) { $x ~~ Sub };      # is subroutine
    my &това_е_метод = sub ($x) { $x ~~ Method };          # is method
    my &това_е_макрос = sub ($x) { $x ~~ Macro };          # is macro
    my &това_е_регулярен_израз = sub ($x) { $x ~~ Regex };          # is regex
    my &това_е_граматика = sub ($x) { $x ~~ Grammar };    # is grammar
    my &това_е_булево = sub ($x) { $x ~~ Bool };           # is boolean
    # my &това_е_изброяване = sub ($x) { $x ~~ Enum };     # is enum
    my &това_е_съединение = sub ($x) { $x ~~ Junction };   # is junction
    # my &това_е_роля = sub ($x) { $x ~~ Role };             # is role
    my &това_е_клас = sub ($x) { $x.HOW ~~ Metamodel::ClassHOW }; # is class
    my &това_е_модул = sub ($x) { $x.HOW ~~ Metamodel::ModuleHOW }; # is module
    my &това_е_пакет = sub ($x) { $x.HOW ~~ Metamodel::PackageHOW }; # is package
    my &това_е_обещание = sub ($x) { $x ~~ Promise };      # is promise
    my &това_е_канал = sub ($x) { $x ~~ Channel };         # is channel
    my &това_е_доставчик = sub ($x) { $x ~~ Supplier };    # is supplier
    my &това_е_поток = sub ($x) { $x ~~ Thread };          # is thread
    my &това_е_планировчик = sub ($x) { $x ~~ Scheduler }; # is scheduler
    my &това_е_изключение = sub ($x) { $x ~~ Exception };  # is exception
    my &това_е_неуспех = sub ($x) { $x ~~ Failure };        # is failure
    my &дефинирано = sub ($x) { $x.defined };           # defined
    my &не_дефинирано = sub ($x) { !$x.defined };       # not defined
    my &тип = sub ($x) { $x.WHAT };                     # type/WHAT
    my &име_на_тип = sub ($x) { $x.^name };               # type name
    my &кое = sub ($x) { $x.WHICH };                  # which (object identity)
    
    # === FUNCTIONAL PROGRAMMING ===
    my &приложи = sub ($func, @args) { $func(|@args) }; # apply
    my &картирай = sub (&func, @list) { @list.map(&func) }; # map
    my &филтрирай = sub (&func, @list) { @list.grep(&func) }; # grep/filter
    my &свий = sub (&func, @list, $init?) { 
        $init.defined ?? @list.reduce(&func, $init) !! @list.reduce(&func) 
    }; # reduce/fold
    my &свиване_отляво = sub (&func, $init, @list) { @list.reduce(&func, $init) }; # fold left
    my &произведи = sub (&func, @list) { @list.produce(&func) }; # produce
    my &всички = sub (&test, @list) { so @list.map(&test).all };  # all
    my &който_и_да_е = sub (&test, @list) { so @list.map(&test).any }; # any
    my &никой = sub (&test, @list) { so @list.map(&test).none }; # none
    my &един = sub (&test, @list) { so @list.map(&test).one }; # one
    my &класифицирай = sub (&test, @list) { @list.classify(&test) }; # classify
    my &групирай = sub (&func, @list) { @list.categorize(&func) }; # categorize
    my &свържи = sub (@a, @b) { @a Z @b };          # zip
    my &развържи = sub (@list) { @list.rotor(2) };   # unzip (pairs)
    my &дублирай = sub (@list, &with) { @list.duckmap(&with) }; # duckmap
    my &дълбока_карта = sub (@list, &with) { @list.deepmap(&with) }; # deepmap
    my &възлова_карта = sub (@list, &with) { @list.nodemap(&with) }; # nodemap
    my &първи = sub (@list, &cond) { @list.first(&cond, :k) }; # first index
    my &вземи_докато = sub (@list, &cond) { @list.take-while(&cond) }; # take-while
    my &пропусни_докато = sub (@list, &cond) { @list.skip-while(&cond) }; # skip-while
    my &разбий_по = sub (@list, &cond) { @list.split-when(&cond) }; # split-when
    my &композиция = sub (&f, &g) { &f ∘ &g };          # function composition
    my &тръбопровод = sub (@funcs) { [∘] @funcs };      # pipeline
    my &къриране = sub (&func, $arg) { &func.assuming($arg) }; # curry
    my &мемоизация = sub (&func) { my %cache; -> |c { %cache{c.gist} //= &func(|c) } }; # memoize
    
    # === DATE/TIME OPERATIONS ===
    my &сега = sub () { now };                         # now (instant)
    my &момент = sub () { Instant.now };                # instant now
    my &дата_час = sub (|c) { DateTime.now(|c) };     # DateTime now
    my &дата = sub (|c) { Date.today(|c) };             # Date today
    my &час = sub () { DateTime.now.hh-mm-ss };       # current time
    my &спи = sub ($s) { sleep $s };                    # sleep
    my &местно_време = sub () { DateTime.now.local };  # local time
    my &време_UTC = sub () { DateTime.now.utc };        # UTC time
    my &часова_зона = sub () { DateTime.now.timezone }; # timezone
    my &епоха = sub () { time };                        # epoch time
    my &година = sub ($dt = DateTime.now) { $dt.year };    # year
    my &месец = sub ($dt = DateTime.now) { $dt.month }; # month
    my &ден = sub ($dt = DateTime.now) { $dt.day };    # day
    my &час = sub ($dt = DateTime.now) { $dt.hour };    # hour
    my &минута = sub ($dt = DateTime.now) { $dt.minute }; # minute
    my &секунда = sub ($dt = DateTime.now) { $dt.second }; # second
    my &ден_от_седмицата = sub ($dt = DateTime.now) { $dt.day-of-week }; # day of week
    my &ден_от_годината = sub ($dt = DateTime.now) { $dt.day-of-year }; # day of year
    my &седмица_от_годината = sub ($dt = DateTime.now) { $dt.week }; # week of year
    my &високосна = sub ($year) { Date.new($year, 1, 1).is-leap-year }; # leap year
    my &дни_в_месеца = sub ($year, $month) { Date.new($year, $month, 1).days-in-month }; # days in month
    my &форматирай_дата = sub ($dt, $fmt) { $dt.DateTime.Str($fmt) }; # format date
    my &анализирай_дата = sub ($str, $fmt?) { DateTime.new($str, |($fmt ?? :formatter($fmt) !! ())) }; # parse date
    my &добави_дни = sub ($dt, $days) { $dt.later(:$days) }; # add days
    my &добави_месеци = sub ($dt, $months) { $dt.later(:$months) }; # add months
    my &добави_години = sub ($dt, $years) { $dt.later(:$years) }; # add years
    my &извади_дни = sub ($dt, $days) { $dt.earlier(:$days) }; # subtract days
    my &извади_месеци = sub ($dt, $months) { $dt.earlier(:$months) }; # subtract months
    my &извади_години = sub ($dt, $years) { $dt.earlier(:$years) }; # subtract years
    my &разлика_в_дати = sub ($dt1, $dt2) { $dt1 - $dt2 }; # date difference
    my &продължителност = sub ($secs) { Duration.new($secs) }; # duration
    
    # === RANDOM NUMBERS ===
    my &случайно = sub ($max?) { $max ?? rand * $max !! rand }; # random
    my &случайно_цяло = sub ($max) { (rand * $max).Int }; # random int
    my &случайно_в_диапазон = sub ($min, $max) { $min + rand * ($max - $min) }; # random in range
    my &разбъркай = sub (@list) { @list.pick(*) };     # shuffle
    my &избери_случайно = sub (@list, $n = 1) { @list.pick($n) }; # pick random
    my &хвърли_случайно = sub (@list, $n = 1) { @list.roll($n) }; # roll random
    my &задай_семе = sub ($seed) { srand($seed) };   # set random seed
    my &нормално_разпределение = sub ($mean = 0, $std = 1) { 
        my $u1 = rand; my $u2 = rand;
        $mean + $std * sqrt(-2 * log($u1)) * cos(2 * π * $u2)
    }; # normal distribution
    
    # === REGEX/PATTERN MATCHING ===
    my &намери = sub ($str, $pattern) { $str ~~ $pattern }; # match
    my &намери_всички = sub ($str, $pattern) { $str ~~ m:g/$pattern/ }; # match all
    my &съответства = sub ($str, $pattern) { so $str ~~ $pattern }; # matches
    my &не_съответства = sub ($str, $pattern) { not $str ~~ $pattern }; # doesn't match
    my &извлечи = sub ($str, $pattern) { $str ~~ $pattern; $/ }; # extract match
    my &заснеми_групи = sub ($str, $pattern) { $str ~~ $pattern; $/.hash }; # capture groups
    my &позиции_на_съвпадения = sub ($str, $pattern) { 
        my @matches = $str ~~ m:g/$pattern/;
        @matches.map(*.from)
    }; # match positions
    my &разбий_по_регулярен_израз = sub ($str, $pattern) { $str.split($pattern) }; # split by regex
    my &замени_по_регулярен_израз = sub ($str, $pattern, $replacement) { 
        $str.subst($pattern, $replacement, :g) 
    }; # replace by regex
    my &създай_регулярен_израз = sub ($pattern, :$i = False, :$m = False, :$s = False, :$x = False) { 
        my $flags = '';
        $flags ~= ':i' if $i;
        $flags ~= ':m' if $m;
        $flags ~= ':s' if $s;
        $flags ~= ':x' if $x;
        EVAL "rx$flags/$pattern/"
    }; # create regex
    my &екранирай = sub ($str) { $str.raku };           # escape string
    
    # === EXCEPTION HANDLING ===
    my &опитай = sub (&code) { try &code };           # try
    my &хвани = sub (&code, &handler) {                # catch
        CATCH { default { &handler($_) } };
        &code()
    };
    my &хвърли = sub ($msg) { die $msg };              # throw
    my &повтори_опит = sub (&code, $times = 3) {     # retry
        my $attempt = 0;
        loop {
            $attempt++;
            my $result = try &code();
            return $result unless $!;
            last if $attempt >= $times;
        }
        die "Failed after $times attempts: $!";
    };
    my &увери_се = sub ($cond, $msg = "Assertion failed") { # assert
        die $msg unless $cond;
    };
    my &накрая = sub (&code, &finally) {               # finally
        LEAVE &finally();
        &code()
    };
    my &потисни = sub (&code) { try &code; Nil };        # suppress errors
    
    # === METAPROGRAMMING ===
    my &методи = sub ($obj) { $obj.^methods };          # methods
    my &публични_методи = sub ($obj) { $obj.^methods(:local) }; # public methods
    my &частни_методи = sub ($obj) { $obj.^methods(:private) }; # private methods
    my &атрибути = sub ($obj) { $obj.^attributes };     # attributes
    my &роли = sub ($obj) { $obj.^roles };              # roles
    my &родители = sub ($obj) { $obj.^parents };        # parents
    my &предци = sub ($obj) { $obj.^mro };              # ancestors (MRO)
    my &може = sub ($obj, $method) { $obj.can($method) }; # can
    my &прави = sub ($obj, $role) { $obj.does($role) }; # does
    my &е = sub ($obj, $type) { $obj.isa($type) }; # isa
    my &добави_метод = sub ($obj, $name, &code) { $obj.^add_method($name, &code) }; # add method
    my &добави_атрибут = sub ($obj, $attr) { $obj.^add_attribute($attr) }; # add attribute
    my &композирай = sub ($obj) { $obj.^compose };      # compose
    my &намери_метод = sub ($obj, $name) { $obj.^find_method($name) }; # find method
    my &име_на_клас = sub ($obj) { $obj.^name };         # class name
    my &версия_на_клас = sub ($obj) { $obj.^ver };      # class version
    my &автор_на_клас = sub ($obj) { $obj.^auth };       # class author
    my &създай_клас = sub ($name, |c) { Metamodel::ClassHOW.new_type(:$name, |c) }; # create class
    my &създай_роля = sub ($name, |c) { Metamodel::ParametricRoleGroupHOW.new_type(:$name, |c) }; # create role
    my &клонирай = sub ($obj) { $obj.clone };           # clone object
    my &благослови = sub ($candidate, $type) { $candidate.bless }; # bless
    my &с_добавка = sub ($obj, $new) { $obj but $new }; # but (mixin)
    my &с_роля = sub ($obj, $role) { $obj does $role }; # does (mixin)
    my &извикай_метод = sub ($obj, $method, |args) { $obj."$method"(|args) }; # call method
    my &свойство = sub ($obj, $prop) { $obj."$prop"() }; # get property
    my &задай_свойство = sub ($obj, $prop, $val) { $obj."$prop"() = $val }; # set property
    
    # Traits and introspection
    my &черти = sub ($obj) { $obj.^compose_values };    # traits
    my &контейнер = sub ($var) { $var.VAR };            # container
    my &деконтейнеризирай = sub ($var) { $var<> };        # decontainerize
    my &адрес = sub ($obj) { $obj.WHERE };              # memory address
    my &идентификатор = sub ($obj) { $obj.WHICH };      # object ID
    my &описател = sub ($var) { $var.HOW };            # metaclass
    
    # === CONCURRENCY (Soviet: parallel computing) ===
    my &обещание = sub (&code) { Promise.start(&code) }; # promise
    my &изпълнено_обещание = sub ($value) { Promise.kept($value) }; # kept promise
    my &счупено_обещание = sub ($reason) { Promise.broken($reason) }; # broken promise
    my &изчакай = sub ($promise) { await $promise };      # await
    my &резултат = sub ($promise) { $promise.result }; # promise result
    my &статус = sub ($promise) { $promise.status };    # promise status
    my &тогава = sub ($promise, &code) { $promise.then(&code) }; # then
    my &всички_обещания = sub (@promises) { Promise.allof(@promises) }; # all promises
    my &всяко_обещание = sub (@promises) { Promise.anyof(@promises) }; # any promise
    my &канал = sub () { Channel.new };                 # channel
    my &изпрати = sub ($channel, $value) { $channel.send($value) }; # send
    my &получи_от_канал = sub ($channel) { $channel.receive }; # receive
    my &затвори_канал = sub ($channel) { $channel.close }; # close channel
    my &доставчик = sub () { Supplier.new };            # supplier
    my &достави = sub ($supplier, $value) { $supplier.emit($value) }; # emit to supplier
    my &завърши_доставка = sub ($supplier) { $supplier.done }; # done supplier
    my &абонирай_се = sub ($supply, &code) { $supply.tap(&code) }; # tap/subscribe
    my &паралелно = sub (@items, &code) { @items.race.map(&code) }; # parallel map
    my &хиперпаралелно = sub (@items, &code) { @items.hyper.map(&code) }; # hyper map
    my &поток = sub (&code) { Thread.start(&code) };    # thread
    my &присъедини_се = sub ($thread) { $thread.join };  # join thread
    my &заключване = sub () { Lock.new };               # lock
    my &заключи_блок = sub ($lock, &code) { $lock.protect(&code) }; # lock block
    my &семафор = sub ($permits) { Semaphore.new($permits) }; # semaphore
    my &придобий = sub ($semaphore) { $semaphore.acquire }; # acquire
    my &освободи = sub ($semaphore) { $semaphore.release }; # release
    my &атомарно = sub ($var) { $var ⚛= $var };        # atomic operation
    my &атомарно_добавяне = sub ($var, $val) { $var ⚛+= $val }; # atomic add
    my &атомарно_изваждане = sub ($var, $val) { $var ⚛-= $val }; # atomic subtract
    # my &бариера = sub () { CAS.new };                    # CAS barrier
    my &планировчик = sub () { $*SCHEDULER };           # scheduler
    my &отложи = sub ($delay, &code) { Promise.in($delay).then(&code) }; # delay
    my &таймер = sub ($interval, &code) { Supply.interval($interval).tap(&code) }; # timer
    
    # === SYSTEM OPERATIONS ===
    my &изпълни = sub ($cmd) { qqx/$cmd/ };             # shell
    my &изпълни_тихо = sub ($cmd) { quietly shell $cmd }; # shell quietly
    my &стартирай = sub (|c) { run |c };                  # run
    my &стартирай_асинхронно = sub (|c) { Proc::Async.new(|c) }; # run async
    my &среда = sub ($var) { %*ENV{$var} };             # environment
    my &задай_среда = sub ($var, $val) { %*ENV{$var} = $val }; # set environment
    my &всички_променливи_на_средата = sub () { %*ENV };        # all env vars
    my &аргументи = sub () { @*ARGS };                  # arguments
    my &програма = sub () { $*PROGRAM };               # program name
    my &изпълним_файл = sub () { $*EXECUTABLE };     # executable
    my &процес = sub () { $*PID };                     # process ID
    my &родителски_процес = sub () { $*PPID };       # parent PID
    my &потребител = sub () { $*USER };               # user
    my &потребителска_група = sub () { $*GROUP };       # user group
    my &име_на_хост = sub () { $*KERNEL.hostname };       # hostname
    my &платформа = sub () { $*KERNEL.name };           # platform
    my &версия_на_ядрото = sub () { $*KERNEL.release };      # kernel release
    my &хардуер = sub () { $*KERNEL.hardware };      # hardware
    my &процесори = sub () { $*KERNEL.cpu-cores };     # CPU cores
    my &памет = sub () { $*VM.memory };                # memory info
    my &натоварване = sub () { $*KERNEL.load };            # load average
    my &време_на_работа = sub () { $*INITTIME };           # uptime
    my &сигнал = sub ($sig, &handler) { signal($sig).tap(&handler) }; # signal handler
    my &завърши = sub ($code = 0) { exit $code };     # exit with code
    
    # === ENCODING/DECODING ===
    my &кодирай = sub ($str, $enc = 'utf8') { $str.encode($enc) }; # encode
    my &декодирай = sub ($buf, $enc = 'utf8') { $buf.decode($enc) }; # decode
    my &база64_кодирай = sub ($data) { MIME::Base64.encode($data) }; # base64 encode
    my &база64_декодирай = sub ($str) { MIME::Base64.decode($str) }; # base64 decode
    my &ури_кодирай = sub ($str) { $str.subst(/<-[A..Za..z0..9_.~-]>/, *.ord.fmt('%%%02X'), :g) }; # URI encode
    my &ури_декодирай = sub ($str) { $str.subst(/\%(<xdigit>**2)/, { chr(:16(~$0)) }, :g) }; # URI decode
    my &хеш_MD5 = sub ($data) { $data.encode.MD5.list».fmt('%02x').join }; # MD5 hash
    my &хеш_SHA1 = sub ($data) { $data.encode.SHA1.list».fmt('%02x').join }; # SHA1 hash
    my &хеш_SHA256 = sub ($data) { $data.encode.SHA256.list».fmt('%02x').join }; # SHA256 hash
    # my &опаковай = sub ($template, |values) { pack($template, |values) }; # pack
    # my &разопаковай = sub ($template, $data) { unpack($template, $data) }; # unpack
    
    # === SOVIET COMPUTING LEGACY TERMS ===
    my &ЕИМ = sub () { "ЕИМ: {$*KERNEL.hostname}" };    # computer info
    my &ОЗУ = sub () { $*VM.memory // "N/A" };          # RAM info
    my &ЦП = sub () { $*KERNEL.cpu-cores };             # CPU info
    my &алгоритъм = sub (&code) { &code };               # algorithm
    my &подпрограма = sub (&code) { &code };           # subroutine
    my &процедура = sub (&code) { &code };              # procedure
    my &масив_от_данни = sub (|c) { Array.new(|c) };     # data array
    my &таблица = sub (|c) { Hash.new(|c) };            # table (hash)
    my &запис = sub (|c) { Hash.new(|c) };             # record
    my &поле = sub ($record, $field) { $record{$field} }; # field
    my &брояч = sub ($init = 0) { state $c = $init; $c++ }; # counter
    my &регистър = sub ($val) { state $r = $val; $r };   # register
    my &акумулатор = sub () { state @a = []; @a };      # accumulator
    my &стек = sub () { state @s = []; @s };            # stack
    my &вкарай = sub ($stack, $val) { $stack.push($val) }; # push to stack
    my &изкарай = sub ($stack) { $stack.pop };         # pop from stack
    my &опашка = sub () { state @q = []; @q };         # queue
    my &постави_в_опашка = sub ($queue, $val) { $queue.push($val) }; # enqueue
    my &вземи_от_опашка = sub ($queue) { $queue.shift }; # dequeue
    my &буфер = sub ($size) { Buf.allocate($size) };    # buffer
    my &блок_памет = sub ($size) { Blob.allocate($size) }; # memory block
    my &указател = sub ($obj) { $obj.WHERE };          # pointer
    my &препратка = sub ($obj) { $obj };                  # reference
    my &разименувай = sub ($ref) { $$ref };               # dereference
    
    # === SOVIET-ERA PROGRAMMING ABBREVIATIONS ===
    # Common programming abbreviations used by Soviet programmers
    my &прем = sub ($x) { $x };                          # перемещение (move/transfer)
    my &нач = sub (&code) { &code };                    # начало (begin)
    my &край = sub () { done };                          # конец (end)
    my &цикъл = sub ($n, &code) { for ^$n { &code() } }; # цикл (loop)
    my &докато = sub ($cond, &code) { while $cond { &code() } }; # пока (while)
    my &за = sub ($list, &code) { for $list { &code($_) } }; # для (for)
    my &ако = sub ($cond, &then, &else?) { $cond ?? &then() !! (&else ?? &else() !! Nil) }; # если (if)
    my &иначе = sub (&code) { &code };                  # иначе (else)
    my &изб = sub ($val, %cases) { %cases{$val}() if %cases{$val}:exists }; # выбор (choice/switch)
    my &проц = sub (&code) { &code };                   # процедура (procedure)
    my &функ = sub (&code) { &code };                   # функция (function)
    my &върни = sub ($val) { return $val };             # возврат (return)
    my &парам = sub (|c) { |c };                        # параметры (parameters)
    my &арг = sub (|c) { |c };                          # аргументы (arguments)
    my &рез = sub ($val) { $val };                      # результат (result)
    my &време = sub (&code) { state $t = now; &code(); now - $t }; # время (time)
    my &брояч = sub ($init = 0) { state $c = $init; ++$c }; # счетчик (counter)
    my &инд = sub ($array, $index) { $array[$index] };  # индекс (index)
    my &дълж = sub ($obj) { $obj.elems };                 # длина (length)
    my &разм = sub ($obj) { $obj.elems };                 # размер (size)
    my &макс = sub (|c) { max |c };                     # максимум (maximum)
    my &мин = sub (|c) { min |c };                      # минимум (minimum)
    my &сред = sub (@a) { @a.sum / @a.elems };          # среднее (average)
    my &сум = sub (|c) { sum |c };                      # сумма (sum)
    my &произв = sub (@a) { [*] @a };                   # произведение (product)
    my &сорт = sub (@a) { @a.sort };                    # сортировка (sort)
    my &обр = sub (@a) { @a.reverse };                  # обратный (reverse)
    my &намери = sub (@a, $val) { @a.first($val) };      # найти (find)
    my &замен = sub ($str, $from, $to) { $str.subst($from, $to, :g) }; # заменить (replace)
    my &подн = sub ($str, $pos, $len?) { $len ?? $str.substr($pos, $len) !! $str.substr($pos) }; # подстрока (substring)
    my &ляв = sub ($str, $n) { $str.substr(0, $n) };    # левая часть (left)
    my &дес = sub ($str, $n) { $str.substr(*-$n) };    # правая часть (right)
    my &подр = sub ($str) { $str.trim };               # обрезать (trim)
    my &разд = sub ($str, $sep) { $str.split($sep) };   # разделить (split)
    my &съед = sub (@a, $sep = '') { @a.join($sep) };   # соединить (join)
    my &отв = sub ($file, :$r, :$w) { $r ?? open($file, :r) !! open($file, :w) }; # открыть (open)
    my &затв = sub ($handle) { $handle.close };         # закрыть (close)
    my &чет = sub ($handle) { $handle.get };            # читать (read)
    my &зап = sub ($handle, $data) { $handle.put($data) }; # записать (write)
    my &коп = sub ($from, $to) { copy($from, $to) };    # копировать (copy)
    my &изтр = sub ($file) { unlink($file) };           # удалить (delete)
    my &същ = sub ($file) { $file.IO.e };               # существует (exists)
    my &вкл = sub ($list, $item) { $item ∈ $list };     # включает (includes)
    my &изкл = sub ($list, $item) { $item ∉ $list };    # исключает (excludes)
    my &пуст = sub ($obj) { !$obj || $obj.elems == 0 }; # пустой (empty)
    my &пълен = sub ($obj) { $obj && $obj.elems > 0 };   # полный (full/non-empty)
    my &истин = sub ($val) { ?$val };                   # истинный (true)
    my &невяр = sub ($val) { !$val };                    # ложный (false)
    my &четн = sub ($n) { $n %% 2 };                    # четный (even)
    my &нечетн = sub ($n) { $n % 2 };                   # нечетный (odd)
    my &положит = sub ($n) { $n > 0 };                    # положительный (positive)
    my &отриц = sub ($n) { $n < 0 };                    # отрицательный (negative)
    my &цял = sub ($n) { $n ~~ Int };                   # целый (integer)
    my &дроб = sub ($n) { $n ~~ Rat|Num };              # дробный (fractional)
    my &закр = sub ($n) { $n.round };                 # округлить (round)
    my &отреж = sub ($n) { $n.truncate };               # отсечь (truncate)
    my &случ = sub ($max = 1) { rand * $max };          # случайный (random)
    my &повт = sub ($str, $n) { $str x $n };            # повторить (repeat)
    my &форм = sub ($fmt, |args) { sprintf($fmt, |args) }; # форматировать (format)
    
    # === OPERATORS AS FUNCTIONS ===
    my &събери = sub ($a, $b) { $a + $b };             # add
    my &извади = sub ($a, $b) { $a - $b };             # subtract
    my &умножи = sub ($a, $b) { $a * $b };            # multiply
    my &раздели = sub ($a, $b) { $a / $b };           # divide
    my &остатък = sub ($a, $b) { $a % $b };             # modulo
    my &цялочислено_деление = sub ($a, $b) { $a div $b }; # integer division
    my &вдигни_на_степен = sub ($a, $b) { $a ** $b };           # exponentiate
    
    # Comparison operators
    my &равно = sub ($a, $b) { $a eq $b };              # string equal
    my &не_равно = sub ($a, $b) { $a ne $b };           # string not equal
    my &равно_на_число = sub ($a, $b) { $a == $b };        # numeric equal
    my &не_равно_на_число = sub ($a, $b) { $a != $b };     # numeric not equal
    my &по_голямо = sub ($a, $b) { $a > $b };              # greater than
    my &по_малко = sub ($a, $b) { $a < $b };              # less than
    my &по_голямо_равно = sub ($a, $b) { $a >= $b };       # greater or equal
    my &по_малко_равно = sub ($a, $b) { $a <= $b }; # less or equal
    my &сравни = sub ($a, $b) { $a cmp $b };          # string compare
    my &сравни_числа = sub ($a, $b) { $a <=> $b };    # numeric compare
    my &интелигентно_съвпадение = sub ($a, $b) { $a ~~ $b };         # smart match
    my &идентични = sub ($a, $b) { $a === $b };         # identical
    my &не_идентични = sub ($a, $b) { $a !=== $b };     # not identical
    
    # Logical operators
    my &и = sub ($a, $b) { $a && $b };                  # and
    my &или = sub ($a, $b) { $a || $b };                # or
    my &не_е = sub ($a) { !$a };                          # not
    my &изключващо_или = sub ($a, $b) { $a ^^ $b };    # xor
    my &дефинирано_или = sub ($a, $b) { $a // $b };     # defined-or
    my &и_също = sub ($a, $b) { $a and $b };           # low precedence and
    my &или_пък = sub ($a, $b) { $a or $b };             # low precedence or
    my &не_също = sub ($a) { not $a };                 # low precedence not
    
    # Bitwise operators
    my &бит_и = sub ($a, $b) { $a +& $b };              # bitwise and
    my &бит_или = sub ($a, $b) { $a +| $b };            # bitwise or
    my &бит_не = sub ($a) { +^$a };                     # bitwise not
    my &бит_изкл_или = sub ($a, $b) { $a +^ $b };       # bitwise xor
    my &ляв_сдвиг = sub ($a, $n) { $a +< $n };        # left shift
    my &десен_сдвиг = sub ($a, $n) { $a +> $n };       # right shift
    
    # String operators
    my &конкатенация = sub ($a, $b) { $a ~ $b };        # concatenation
    my &повторение = sub ($s, $n) { $s x $n };              # string repeat
    my &конкат_присвои = sub ($a is rw, $b) { $a ~= $b }; # concat assign
    
    # Range operators
    my &диапазон_вкл = sub ($a, $b) { $a..$b };       # inclusive range
    my &диапазон_изкл = sub ($a, $b) { $a..^$b };     # exclusive range
    my &диапазон_мързелив = sub ($a, $b) { $a...$b };     # lazy range
    my &диапазон_безкраен = sub ($a) { $a..* };             # infinite range
    
    # Junction operators
    my &съединение_всички = sub (|c) { all(|c) };          # all junction
    my &съединение_всяко = sub (|c) { any(|c) };        # any junction
    my &съединение_едно = sub (|c) { one(|c) };         # one junction
    my &съединение_никое = sub (|c) { none(|c) };     # none junction
    
    # Assignment operators
    my &присвои = sub ($a is rw, $b) { $a = $b };     # assign
    my &свържи = sub ($a is rw, $b) { $a := $b };      # bind
    my &присвои_ако_не = sub ($a is rw, $b) { $a //= $b }; # assign if undefined
    my &присвои_добави = sub ($a is rw, $b) { $a += $b }; # add assign
    my &присвои_извади = sub ($a is rw, $b) { $a -= $b }; # subtract assign
    my &присвои_умножи = sub ($a is rw, $b) { $a *= $b }; # multiply assign
    my &присвои_раздели = sub ($a is rw, $b) { $a /= $b }; # divide assign
    
    # === SPECIAL VARIABLES ACCESS ===
    my &текуща_грешка = sub () { $! };                 # current error
    my &съвпадение = sub () { $/ };                     # match object
    my &заместване_0 = sub () { $0 };                  # first capture
    my &заместване_1 = sub () { $1 };                  # second capture
    my &заместване_2 = sub () { $2 };                  # third capture
    my &тема = sub () { $_ };                           # topic variable
    my &задай_тема = sub ($val) { $_ = $val };       # set topic
    my &версия_на_раку = sub () { $*RAKU.version };        # Raku version
    my &име_на_раку = sub () { $*RAKU.name };              # Raku name
    my &версия_на_компилатор = sub () { $*RAKU.compiler.version }; # compiler version
    my &име_на_компилатор = sub () { $*RAKU.compiler.name }; # compiler name
    my &идентификатор_на_компилатор = sub () { $*RAKU.compiler.id }; # compiler ID
    my &операционна_система = sub () { $*DISTRO.name }; # OS name
    my &версия_на_ос = sub () { $*DISTRO.version };        # OS version
    my &издание_на_ос = sub () { $*DISTRO.release };        # OS release
    my &архитектура_на_ос = sub () { $*DISTRO.hardware };  # OS architecture
    my &битове_на_ос = sub () { $*DISTRO.bits };             # OS bits
    my &това_е_уин = sub () { $*DISTRO.is-win };           # is Windows
    my &име_на_ядро = sub () { $*KERNEL.name };            # kernel name
    my &версия_на_ядрото = sub () { $*KERNEL.version };      # kernel version
    # my &издание_на_ядрото = sub () { $*KERNEL.release };      # kernel release (duplicate)
    # my &хардуер = sub () { $*KERNEL.hardware };      # hardware (duplicate)
    my &архитектура = sub () { $*KERNEL.arch };         # architecture
    my &битове = sub () { $*KERNEL.bits };                # bits
    my &име_на_виртуална_машина = sub () { $*VM.name };  # VM name
    my &версия_на_виртуална_машина = sub () { $*VM.version }; # VM version
    my &свойства_на_вм = sub () { $*VM.properties };       # VM properties
    my &конфигурация_на_вм = sub () { $*VM.config };       # VM config
    my &префикс_на_вм = sub () { $*VM.prefix };            # VM prefix
    my &препроцесор = sub () { $*VM.precomp-ext };     # precomp extension
    my &хранилища = sub () { $*REPO.repo-chain };     # repository chain
    my &спецификация = sub () { $*SPEC };               # IO spec
    my &низ_на_подкана = sub () { $*PROMPT };         # prompt string
    
    # === UNICODE OPERATIONS ===
    my &юникод_име = sub ($char) { $char.uniname };     # unicode name
    my &юникод_стойност = sub ($char) { $char.ord };    # unicode value
    my &юникод_блок = sub ($char) { $char.uniprop('Block') }; # unicode block
    my &юникод_категория = sub ($char) { $char.uniprop }; # unicode category
    my &юникод_свойство = sub ($char, $prop) { $char.uniprop($prop) }; # unicode property
    my &юникод_версия = sub () { $*RAKU.compiler.version }; # unicode version
    my &нормализирай_НФК = sub ($str) { $str.NFC };       # NFC normalize
    my &нормализирай_НФД = sub ($str) { $str.NFD };       # NFD normalize
    my &нормализирай_НФКК = sub ($str) { $str.NFKC };     # NFKC normalize
    my &нормализирай_НФКД = sub ($str) { $str.NFKD };     # NFKD normalize
    my &графеми_на_низ = sub ($str) { $str.graphs };    # graphemes
    my &кодови_точки_на_низ = sub ($str) { $str.codes }; # code points
    
    # === ADVANCED FEATURES ===
    # Lazy evaluation
    my &мързелив = sub (|c) { lazy |c };                 # lazy list
    my &безкраен_списък = sub (&gen) { lazy gather { loop { take &gen() } } }; # infinite list
    my &събери = sub (&code) { gather { &code() } };     # gather
    my &вземи_стойност = sub ($val) { take $val };     # take
    
    # Reactive programming
    my &поток_събития = sub () { Supply.new };          # event stream
    my &излъчи_събитие = sub ($supply, $val) { $supply.emit($val) }; # emit event
    my &абонирай_се_за_събития = sub ($supply, &handler) { $supply.tap(&handler) }; # subscribe
    my &филтрирай_събития = sub ($supply, &filter) { $supply.grep(&filter) }; # filter events
    my &преобразувай_събития = sub ($supply, &mapper) { $supply.map(&mapper) }; # map events
    my &обедини_потоци = sub (@supplies) { Supply.merge(@supplies) }; # merge streams
    my &избери_поток = sub (@supplies) { Supply.zip(@supplies) }; # zip streams
    my &ограничи_поток = sub ($supply, $n) { $supply.head($n) }; # limit stream
    my &пропусни_събития = sub ($supply, $n) { $supply.skip($n) }; # skip events
    my &уникални_събития = sub ($supply) { $supply.unique }; # unique events
    my &стабилен_поток = sub ($supply) { $supply.stable }; # stable stream
    my &интервален_поток = sub ($seconds) { Supply.interval($seconds) }; # interval stream
    
    # Advanced error handling
    my &резултат_или_грешка = sub (&code) { 
        my $result = try &code();
        $! ?? Failure.new($!) !! $result
    }; # result or failure
    my &безопасно = sub (&code, $default) { 
        my $result;
        try { $result = &code() };
        $! ?? $default !! ($result // $default)
    }; # safe with default
    my &прихванете_тип = sub (&code, $type, &handler) {
        CATCH { when $type { &handler($_) } };
        &code()
    }; # catch specific type
    
    # Contracts and validation
    my &изисквай = sub ($cond, $msg = "Requirement failed") { 
        die $msg unless $cond 
    }; # require condition
    my &осигури = sub (&code, &post) { 
        my $result = &code();
        die "Postcondition failed" unless &post($result);
        $result
    }; # ensure postcondition
    my &провери_тип = sub ($val, $type) { 
        die "Type check failed: expected $type, got {$val.^name}" unless $val ~~ $type;
        $val
    }; # type check
    
    # === CUSTOM OPERATORS ===
    # Arithmetic operators
    my &infix:<плюс> = sub ($a, $b) { $a + $b };        # plus
    my &infix:<минус> = sub ($a, $b) { $a - $b };       # minus
    my &infix:<умножи> = sub ($a, $b) { $a * $b };    # multiply
    my &infix:<раздели> = sub ($a, $b) { $a / $b };   # divide
    my &infix:<остатък> = sub ($a, $b) { $a % $b };     # modulo
    my &infix:<степен> = sub ($a, $b) { $a ** $b };    # power
    
    # Comparison operators
    my &infix:<равно> = sub ($a, $b) { $a == $b };      # equal (numeric)
    my &infix:<не_равно> = sub ($a, $b) { $a != $b };   # not equal (numeric)
    my &infix:<по_голямо> = sub ($a, $b) { $a > $b };      # greater than
    my &infix:<по_малко> = sub ($a, $b) { $a < $b };      # less than
    my &infix:<по_голямо_равно> = sub ($a, $b) { $a >= $b }; # greater or equal
    my &infix:<по_малко_равно> = sub ($a, $b) { $a <= $b }; # less or equal
    
    # String comparison operators
    my &infix:<низ_равен> = sub ($a, $b) { $a eq $b }; # string equal
    my &infix:<низ_не_равен> = sub ($a, $b) { $a ne $b }; # string not equal
    my &infix:<низ_по_голям> = sub ($a, $b) { $a gt $b }; # string greater
    my &infix:<низ_по_малък> = sub ($a, $b) { $a lt $b }; # string less
    
    # Logical operators
    my &infix:<и> = sub ($a, $b) { $a && $b };          # and
    my &infix:<или> = sub ($a, $b) { $a || $b };        # or
    my &infix:<изкл_или> = sub ($a, $b) { $a ^^ $b };   # xor
    my &prefix:<не_е> = sub ($a) { !$a };                 # not
    
    # Bitwise operators
    my &infix:<бит_и> = sub ($a, $b) { $a +& $b };      # bitwise and
    my &infix:<бит_или> = sub ($a, $b) { $a +| $b };    # bitwise or
    my &infix:<бит_изкл_или> = sub ($a, $b) { $a +^ $b }; # bitwise xor
    my &prefix:<бит_не> = sub ($a) { +^$a };            # bitwise not
    my &infix:<ляв_сдвиг> = sub ($a, $b) { $a +< $b }; # left shift
    my &infix:<десен_сдвиг> = sub ($a, $b) { $a +> $b }; # right shift
    
    # Range operator
    my &infix:<до> = sub ($a, $b) { $a..$b };           # range
    my &infix:<до_изкл> = sub ($a, $b) { $a..^$b };     # exclusive range
    
    # Concatenation
    my &infix:<съедини> = sub ($a, $b) { $a ~ $b };     # string concatenation
    
    # Return a Map with all exports
    Map.new(
        # I/O
        '&кажи'              => &кажи,
        '&отпечатай'             => &отпечатай,
        '&изход'              => &изход,
        '&вход'               => &вход,
        '&получи'             => &получи,
        '&редове'             => &редове,
        '&думи'              => &думи,
        '&подкана'          => &подкана,
        '&запитване'             => &запитване,
        '&предупреди'         => &предупреди,
        '&забележи'             => &забележи,
        '&поток_изход'       => &поток_изход,
        '&поток_грешки'       => &поток_грешки,
        '&поток_вход'        => &поток_вход,
        
        # Control flow
        '&умри'               => &умри,
        '&грешка'             => &грешка,
        '&излез'              => &излез,
        '&прекъсни'             => &прекъсни,
        '&следващ'          => &следващ,
        '&повтори'            => &повтори,
        '&продължи'           => &продължи,
        '&успех'              => &успех,
        '&провал'             => &провал,
        # '&когато_ще_бъде'        => &когато_ще_бъде, # commented out - needs react/supply context
        '&реагирай'           => &реагирай,
        '&снабди'            => &снабди,
        '&излъчи'            => &излъчи,
        '&готово'             => &готово,
        
        # Type conversion
        '&низ'             => &низ,
        '&текст'              => &текст,
        '&число'              => &число,
        '&цяло'              => &цяло,
        '&дробно'            => &дробно,
        '&рационално'       => &рационално,
        '&комплексно'        => &комплексно,
        '&булево'             => &булево,
        '&логическо'         => &логическо,
        '&списък'             => &списък,
        '&масив'             => &масив,
        '&хеш'                => &хеш,
        '&множество'              => &множество,
        '&торба'              => &торба,
        '&смес'              => &смес,
        
        # Constants
        'истина'              => истина,
        'ИСТИНА'              => ИСТИНА,
        'вярно'              => вярно,
        'да'                  => да,
        'невярно'                => невярно,
        'НЕВЯРНО'                => НЕВЯРНО,
        'невярно'            => невярно,
        'не'                 => не,
        'лъжа'                 => лъжа,
        'ЛЪЖА'                 => ЛЪЖА,
        'празно'               => празно,
        'нула'                => нула,
        'нищо'               => нищо,
        'всяко'               => всяко,
        'безкрайност'       => безкрайност,
        'минус_безкрайност' => минус_безкрайност,
        'НеЧисло'             => НеЧисло,
        'пи'                  => пи,
        'е'                   => е,
        'тау'                 => тау,
        # 'аз'                   => аз, # commented out - needs object context
        'празен_списък'       => празен_списък,
        # 'край'               => край, # End not available
        
        # Math
        '&сума'              => &сума,
        '&произведение'       => &произведение,
        '&минимум'            => &минимум,
        '&максимум'           => &максимум,
        '&средно'            => &средно,
        '&минмакс'            => &минмакс,
        '&корен'             => &корен,
        '&квадрат'            => &квадрат,
        '&куб'                => &куб,
        '&степен'            => &степен,
        '&модул'             => &модул,
        '&знак'               => &знак,
        '&спрегнато'        => &спрегнато,
        '&действителна'     => &действителна,
        '&имагинерна'             => &имагинерна,
        '&синус'              => &синус,
        '&косинус'            => &косинус,
        '&тангенс'            => &тангенс,
        '&котангенс'          => &котангенс,
        '&секанс'             => &секанс,
        '&косеканс'           => &косеканс,
        '&арксинус'           => &арксинус,
        '&арккосинус'         => &арккосинус,
        '&арктангенс'         => &арктангенс,
        '&арктангенс2'        => &арктангенс2,
        '&хиперболичен_синус'         => &хиперболичен_синус,
        '&хиперболичен_косинус'       => &хиперболичен_косинус,
        '&хиперболичен_тангенс'       => &хиперболичен_тангенс,
        '&архиперболичен_синус'          => &архиперболичен_синус,
        '&архиперболичен_косинус'     => &архиперболичен_косинус,
        '&архиперболичен_тангенс'     => &архиперболичен_тангенс,
        '&логаритъм'           => &логаритъм,
        '&натурален_логаритъм' => &натурален_логаритъм,
        '&десетичен_логаритъм' => &десетичен_логаритъм,
        '&двоичен_логаритъм'  => &двоичен_логаритъм,
        '&експонента'         => &експонента,
        '&експонента_минус_едно' => &експонента_минус_едно,
        '&закръгли'            => &закръгли,
        '&таван'            => &таван,
        '&под'                => &под,
        '&отрежи'              => &отрежи,
        '&НОД'                => &НОД,
        '&НОК'                => &НОК,
        '&просто'            => &просто,
        '&факториел'          => &факториел,
        '&пермутации'       => &пермутации,
        '&комбинации'          => &комбинации,
        
        # Arrays
        '&дължина'              => &дължина,
        '&количество'         => &количество,
        '&размер'             => &размер,
        '&добави'             => &добави,
        '&присъедини'         => &присъедини,
        '&вмъкни'             => &вмъкни,
        '&вмъкни_отпред'       => &вмъкни_отпред,
        '&извади'              => &извади,
        '&извлечи'            => &извлечи,
        '&сортирай'           => &сортирай,
        '&разбъркай'          => &разбъркай,
        '&обърни'          => &обърни,
        '&уникални'         => &уникални,
        '&уникализирай'         => &уникализирай,
        '&изравни'             => &изравни,
        '&задълбочи'             => &задълбочи,
        '&съедини'            => &съедини,
        '&обедини'           => &обедини,
        '&раздели'            => &раздели,
        '&разбий'             => &разбий,
        '&първи'             => &първи,
        '&последен'          => &последен,
        '&глава'             => &глава,
        '&опашка'              => &опашка,
        '&вземи'             => &вземи,
        '&избери'             => &избери,
        '&отрязък'               => &отрязък,
        '&парче'              => &парче,
        '&завърти'            => &завърти,
        '&ротор'              => &ротор,
        '&кръстосан_продукт'              => &кръстосан_продукт,
        '&свържи'              => &свържи,
        '&преплети'          => &преплети,
        '&изглади'             => &изглади,
        '&двойки'               => &двойки,
        '&ключове'              => &ключове,
        '&стойности'           => &стойности,
        '&двойки_ключ_стойност' => &двойки_ключ_стойност,
        '&антидвойки'           => &антидвойки,
        '&изброи'          => &изброи,
        '&диапазон'           => &диапазон,
        '&диапазон_изкл'      => &диапазон_изкл,
        '&безкраен'        => &безкраен,
        '&обратен_диапазон'  => &обратен_диапазон,
        '&обединение'        => &обединение,
        '&пресичане'        => &пресичане,
        '&разлика'           => &разлика,
        '&симетрична_разлика'      => &симетрична_разлика,
        '&подмножество'       => &подмножество,
        '&надмножество'       => &надмножество,
        '&елемент'            => &елемент,
        '&не_е_елемент'         => &не_е_елемент,
        
        # Strings
        '&подрежи'             => &подрежи,
        '&подрежи_отляво'       => &подрежи_отляво,
        '&подрежи_отдясно'      => &подрежи_отдясно,
        '&главни'          => &главни,
        '&малки'           => &малки,
        '&заглавна'          => &заглавна,
        '&дума_заглавна'    => &дума_заглавна,
        '&обърни_регистър'  => &обърни_регистър,
        '&съдържа'           => &съдържа,
        '&започва_с'         => &започва_с,
        '&завършва_с'      => &завършва_с,
        '&замени'             => &замени,
        '&замени_всички'         => &замени_всички,
        '&транслитерирай'     => &транслитерирай,
        '&индекс'             => &индекс,
        '&индекс_отзад'     => &индекс_отзад,
        '&подниз'          => &подниз,
        '&символи'            => &символи,
        '&графеми'            => &графеми,
        '&кодове'               => &кодове,
        '&от_кодове'           => &от_кодове,
        '&кодови_точки'      => &кодови_точки,
        '&НФК'                => &НФК,
        '&НФД'                => &НФД,
        '&НФКК'               => &НФКК,
        '&НФКД'               => &НФКД,
        '&същи_знак'           => &същи_знак,
        '&разбий_редове'      => &разбий_редове,
        '&разбий_думи'       => &разбий_думи,
        '&разбий_полета'        => &разбий_полета,
        '&отстъп'             => &отстъп,
        '&повтори_низ'     => &повтори_низ,
        
        # Files
        '&отвори'             => &отвори,
        '&затвори'             => &затвори,
        '&чети'              => &чети,
        '&чети_символ'       => &чети_символ,
        '&чети_байт'         => &чети_байт,
        '&чети_байтове'        => &чети_байтове,
        '&чети_всичко'          => &чети_всичко,
        '&чети_редове'       => &чети_редове,
        '&чети_думи'          => &чети_думи,
        '&запиши'             => &запиши,
        '&отпечатай'            => &отпечатай,
        '&запиши_байтове'       => &запиши_байтове,
        '&прочисти_буфер'               => &прочисти_буфер,
        '&позиция'            => &позиция,
        '&премести'            => &премести,
        '&премести_от_текуща' => &премести_от_текуща,
        '&премести_от_края'   => &премести_от_края,
        '&край_на_файл'        => &край_на_файл,
        '&заключи'            => &заключи,
        '&отключи'        => &отключи,
        '&кодировка'          => &кодировка,
        '&задай_кодировка' => &задай_кодировка,
        '&нов_ред'     => &нов_ред,
        '&задай_нов_ред' => &задай_нов_ред,
        '&прочети_файл'      => &прочети_файл,
        '&запиши_файл'        => &запиши_файл,
        '&копирай_файл'       => &копирай_файл,
        '&премести_файл'     => &премести_файл,
        '&преименувай_файл'    => &преименувай_файл,
        '&изтрий_файл'         => &изтрий_файл,
        '&папка'              => &папка,
        '&директория'            => &директория,
        '&създай_папка'       => &създай_папка,
        '&създай_папки'       => &създай_папки,
        '&изтрий_папка'        => &изтрий_папка,
        '&изтрий_дърво'       => &изтрий_дърво,
        '&текуща_папка'      => &текуща_папка,
        '&смени_папка'        => &смени_папка,
        '&домашна_папка'     => &домашна_папка,
        '&временна_папка'    => &временна_папка,
        '&работна_папка'      => &работна_папка,
        '&път'               => &път,
        '&път_съществува'    => &път_съществува,
        '&това_е_файл'           => &това_е_файл,
        '&това_е_папка'          => &това_е_папка,
        '&това_е_връзка'         => &това_е_връзка,
        '&това_е_блоково_устройство' => &това_е_блоково_устройство,
        '&това_е_символно_устройство'         => &това_е_символно_устройство,
        '&това_е_файлов_канал'     => &това_е_файлов_канал,
        '&това_е_сокет'          => &това_е_сокет,
        '&четим'           => &четим,
        '&записваем'       => &записваем,
        '&изпълним'        => &изпълним,
        '&собственик'           => &собственик,
        '&група'             => &група,
        '&режим'              => &режим,
        '&размер_на_файл'       => &размер_на_файл,
        '&време_на_достъп'      => &време_на_достъп,
        '&време_на_промяна'    => &време_на_промяна,
        '&време_на_промяна_на_статус'  => &време_на_промяна_на_статус,
        '&абсолютен_път'    => &абсолютен_път,
        '&относителен_път' => &относителен_път,
        '&реален_път'      => &реален_път,
        '&базово_име'        => &базово_име,
        '&име_на_папка'          => &име_на_папка,
        '&разширение'         => &разширение,
        '&томове'               => &томове,
        '&разделител_на_път'   => &разделител_на_път,
        '&родител'           => &родител,
        '&дъщерен'           => &дъщерен,
        '&братя'             => &братя,
        '&добави_път'        => &добави_път,
        
        # Type checking
        '&това_е_число'          => &това_е_число,
        '&това_е_цяло_число'    => &това_е_цяло_число,
        '&това_е_дроб'          => &това_е_дроб,
        '&това_е_дробно'        => &това_е_дробно,
        '&това_е_комплексно'    => &това_е_комплексно,
        '&това_е_низ'         => &това_е_низ,
        '&това_е_масив'         => &това_е_масив,
        '&това_е_списък'         => &това_е_списък,
        '&това_е_хеш'            => &това_е_хеш,
        '&това_е_речник'        => &това_е_речник,
        '&това_е_множество'      => &това_е_множество,
        '&това_е_хеш_множество' => &това_е_хеш_множество,
        '&това_е_торба'          => &това_е_торба,
        '&това_е_хеш_торба'    => &това_е_хеш_торба,
        '&това_е_смес'          => &това_е_смес,
        '&това_е_хеш_смес'    => &това_е_хеш_смес,
        '&това_е_двойка'           => &това_е_двойка,
        '&това_е_диапазон'       => &това_е_диапазон,
        '&това_е_последователност' => &това_е_последователност,
        '&това_е_итератор'       => &това_е_итератор,
        '&това_е_код'            => &това_е_код,
        '&това_е_блок'           => &това_е_блок,
        '&това_е_подпрограма'   => &това_е_подпрограма,
        '&това_е_метод'          => &това_е_метод,
        '&това_е_макрос'         => &това_е_макрос,
        '&това_е_регулярен_израз'         => &това_е_регулярен_израз,
        '&това_е_граматика'     => &това_е_граматика,
        '&това_е_булево'         => &това_е_булево,
        # '&това_е_изброяване'   => &това_е_изброяване, # Enum not available
        '&това_е_съединение'     => &това_е_съединение,
        # '&това_е_роля'           => &това_е_роля, # Role not available
        '&това_е_клас'          => &това_е_клас,
        '&това_е_модул'         => &това_е_модул,
        '&това_е_пакет'         => &това_е_пакет,
        '&това_е_обещание'       => &това_е_обещание,
        '&това_е_канал'          => &това_е_канал,
        '&това_е_доставчик'      => &това_е_доставчик,
        '&това_е_поток'          => &това_е_поток,
        '&това_е_планировчик'    => &това_е_планировчик,
        '&това_е_изключение'     => &това_е_изключение,
        '&това_е_неуспех'         => &това_е_неуспех,
        '&дефинирано'         => &дефинирано,
        '&не_дефинирано'      => &не_дефинирано,
        '&тип'                => &тип,
        '&име_на_тип'           => &име_на_тип,
        '&кое'              => &кое,
        
        # Functional
        '&приложи'          => &приложи,
        '&картирай'         => &картирай,
        '&филтрирай'        => &филтрирай,
        '&свий'           => &свий,
        '&свиване_отляво'      => &свиване_отляво,
        '&произведи'         => &произведи,
        '&всички'                => &всички,
        '&който_и_да_е'           => &който_и_да_е,
        '&никой'            => &никой,
        '&един'               => &един,
        '&класифицирай'   => &класифицирай,
        '&групирай'       => &групирай,
        '&свържи'         => &свържи,
        '&развържи'        => &развържи,
        '&дублирай'              => &дублирай,
        '&дълбока_карта'     => &дълбока_карта,
        '&възлова_карта'      => &възлова_карта,
        '&първи'             => &първи,
        '&вземи_докато'        => &вземи_докато,
        '&пропусни_докато'      => &пропусни_докато,
        '&разбий_по'          => &разбий_по,
        '&композиция'         => &композиция,
        '&тръбопровод'        => &тръбопровод,
        '&къриране'       => &къриране,
        '&мемоизация'         => &мемоизация,
        
        # Date/Time
        '&сега'             => &сега,
        '&момент'             => &момент,
        '&дата_час'         => &дата_час,
        '&дата'               => &дата,
        '&час'              => &час,
        '&спи'                => &спи,
        '&местно_време'      => &местно_време,
        '&време_UTC'          => &време_UTC,
        '&часова_зона'       => &часова_зона,
        '&епоха'              => &епоха,
        '&година'                => &година,
        '&месец'              => &месец,
        '&ден'               => &ден,
        '&час'                => &час,
        '&минута'             => &минута,
        '&секунда'            => &секунда,
        '&ден_от_седмицата'        => &ден_от_седмицата,
        '&ден_от_годината'          => &ден_от_годината,
        '&седмица_от_годината'        => &седмица_от_годината,
        '&високосна'         => &високосна,
        '&дни_в_месеца'      => &дни_в_месеца,
        '&форматирай_дата'    => &форматирай_дата,
        '&анализирай_дата'       => &анализирай_дата,
        '&добави_дни'         => &добави_дни,
        '&добави_месеци'      => &добави_месеци,
        '&добави_години'        => &добави_години,
        '&извади_дни'          => &извади_дни,
        '&извади_месеци'       => &извади_месеци,
        '&извади_години'        => &извади_години,
        '&разлика_в_дати'        => &разлика_в_дати,
        '&продължителност'  => &продължителност,
        
        # Random
        '&случайно'          => &случайно,
        '&случайно_цяло'    => &случайно_цяло,
        '&случайно_в_диапазон' => &случайно_в_диапазон,
        '&разбъркай'         => &разбъркай,
        '&избери_случайно'   => &избери_случайно,
        '&хвърли_случайно'   => &хвърли_случайно,
        '&задай_семе'      => &задай_семе,
        '&нормално_разпределение' => &нормално_разпределение,
        
        # Regex
        '&намери'              => &намери,
        '&намери_всички'          => &намери_всички,
        '&съответства'      => &съответства,
        '&не_съответства'   => &не_съответства,
        '&извлечи'             => &извлечи,
        '&заснеми_групи'     => &заснеми_групи,
        '&позиции_на_съвпадения' => &позиции_на_съвпадения,
        '&разбий_по_регулярен_израз'  => &разбий_по_регулярен_израз,
        '&замени_по_регулярен_израз'  => &замени_по_регулярен_израз,
        '&създай_регулярен_израз'      => &създай_регулярен_израз,
        '&екранирай'          => &екранирай,
        
        # Exceptions
        '&опитай'           => &опитай,
        '&хвани'             => &хвани,
        '&хвърли'            => &хвърли,
        '&повтори_опит'    => &повтори_опит,
        '&увери_се'            => &увери_се,
        '&накрая'            => &накрая,
        '&потисни'             => &потисни,
        
        # Metaprogramming
        '&методи'             => &методи,
        '&публични_методи'   => &публични_методи,
        '&частни_методи'   => &частни_методи,
        '&атрибути'           => &атрибути,
        '&роли'               => &роли,
        '&родители'           => &родители,
        '&предци'             => &предци,
        '&може'              => &може,
        '&прави'             => &прави,
        '&е'           => &е,
        '&добави_метод'       => &добави_метод,
        '&добави_атрибут'     => &добави_атрибут,
        '&композирай'         => &композирай,
        '&намери_метод'        => &намери_метод,
        '&име_на_клас'         => &име_на_клас,
        '&версия_на_клас'      => &версия_на_клас,
        '&автор_на_клас'       => &автор_на_клас,
        '&създай_клас'       => &създай_клас,
        '&създай_роля'        => &създай_роля,
        '&клонирай'           => &клонирай,
        '&благослови'         => &благослови,
        '&с_добавка'          => &с_добавка,
        '&с_роля'            => &с_роля,
        '&извикай_метод'       => &извикай_метод,
        '&свойство'           => &свойство,
        '&задай_свойство'  => &задай_свойство,
        '&черти'              => &черти,
        '&контейнер'          => &контейнер,
        '&деконтейнеризирай'    => &деконтейнеризирай,
        '&адрес'              => &адрес,
        '&идентификатор'      => &идентификатор,
        '&описател'          => &описател,
        
        # Concurrency
        '&обещание'           => &обещание,
        '&изпълнено_обещание' => &изпълнено_обещание,
        '&счупено_обещание' => &счупено_обещание,
        '&изчакай'              => &изчакай,
        '&резултат'          => &резултат,
        '&статус'             => &статус,
        '&тогава'              => &тогава,
        '&всички_обещания'       => &всички_обещания,
        '&всяко_обещание'     => &всяко_обещание,
        '&канал'              => &канал,
        '&изпрати'            => &изпрати,
        '&получи_от_канал'   => &получи_от_канал,
        '&затвори_канал'       => &затвори_канал,
        '&доставчик'          => &доставчик,
        '&достави'            => &достави,
        '&завърши_доставка' => &завърши_доставка,
        '&абонирай_се'          => &абонирай_се,
        '&паралелно'        => &паралелно,
        '&хиперпаралелно'   => &хиперпаралелно,
        '&поток'              => &поток,
        '&присъедини_се'       => &присъедини_се,
        '&заключване'         => &заключване,
        '&заключи_блок'    => &заключи_блок,
        '&семафор'            => &семафор,
        '&придобий'            => &придобий,
        '&освободи'           => &освободи,
        '&атомарно'          => &атомарно,
        '&атомарно_добавяне' => &атомарно_добавяне,
        '&атомарно_изваждане' => &атомарно_изваждане,
        # '&бариера'             => &бариера, # CAS not available
        '&планировчик'        => &планировчик,
        '&отложи'             => &отложи,
        '&таймер'             => &таймер,
        
        # System
        '&изпълни'            => &изпълни,
        '&изпълни_тихо'       => &изпълни_тихо,
        '&стартирай'            => &стартирай,
        '&стартирай_асинхронно' => &стартирай_асинхронно,
        '&среда'              => &среда,
        '&задай_среда'     => &задай_среда,
        '&всички_променливи_на_средата' => &всички_променливи_на_средата,
        '&аргументи'          => &аргументи,
        '&програма'          => &програма,
        '&изпълним_файл'   => &изпълним_файл,
        '&процес'            => &процес,
        '&родителски_процес' => &родителски_процес,
        '&потребител'       => &потребител,
        '&потребителска_група' => &потребителска_група,
        '&име_на_хост'          => &име_на_хост,
        '&платформа'          => &платформа,
        '&версия_на_ядрото'        => &версия_на_ядрото,
        '&хардуер'      => &хардуер,
        '&процесори'         => &процесори,
        '&памет'             => &памет,
        '&натоварване'           => &натоварване,
        '&време_на_работа'       => &време_на_работа,
        '&сигнал'             => &сигнал,
        '&завърши'          => &завърши,
        
        # Encoding
        '&кодирай'         => &кодирай,
        '&декодирай'       => &декодирай,
        '&база64_кодирай'         => &база64_кодирай,
        '&база64_декодирай'       => &база64_декодирай,
        '&ури_кодирай'            => &ури_кодирай,
        '&ури_декодирай'          => &ури_декодирай,
        '&хеш_MD5'            => &хеш_MD5,
        '&хеш_SHA1'           => &хеш_SHA1,
        '&хеш_SHA256'         => &хеш_SHA256,
        # '&опаковай'             => &опаковай, # pack not available
        # '&разопаковай'           => &разопаковай, # unpack not available
        
        # Soviet legacy
        '&ЕИМ'                => &ЕИМ,
        '&ОЗУ'                => &ОЗУ,
        '&ЦП'                 => &ЦП,
        '&алгоритъм'           => &алгоритъм,
        '&подпрограма'       => &подпрограма,
        '&процедура'          => &процедура,
        '&масив_от_данни'      => &масив_от_данни,
        '&таблица'            => &таблица,
        '&запис'             => &запис,
        '&поле'               => &поле,
        '&брояч'            => &брояч,
        '&регистър'            => &регистър,
        '&акумулатор'         => &акумулатор,
        '&стек'               => &стек,
        '&вкарай'            => &вкарай,
        '&изкарай'           => &изкарай,
        '&опашка'            => &опашка,
        '&постави_в_опашка'  => &постави_в_опашка,
        '&вземи_от_опашка'  => &вземи_от_опашка,
        '&буфер'              => &буфер,
        '&блок_памет'        => &блок_памет,
        '&указател'          => &указател,
        '&препратка'             => &препратка,
        '&разименувай'          => &разименувай,
        
        # Soviet-era programming abbreviations
        '&прем'                => &прем,
        '&нач'                => &нач,
        '&край'               => &край,
        '&цикъл'               => &цикъл,
        '&докато'               => &докато,
        '&за'                => &за,
        '&ако'               => &ако,
        '&иначе'              => &иначе,
        '&изб'                => &изб,
        '&проц'               => &проц,
        '&функ'               => &функ,
        '&върни'              => &върни,
        '&парам'              => &парам,
        '&арг'                => &арг,
        '&рез'                => &рез,
        '&време'               => &време,
        '&брояч'               => &брояч,
        '&инд'                => &инд,
        '&дълж'                 => &дълж,
        '&разм'               => &разм,
        '&макс'               => &макс,
        '&мин'                => &мин,
        '&сред'               => &сред,
        '&сум'                => &сум,
        '&произв'             => &произв,
        '&сорт'               => &сорт,
        '&обр'                => &обр,
        '&намери'              => &намери,
        '&замен'              => &замен,
        '&подн'             => &подн,
        '&ляв'                => &ляв,
        '&дес'               => &дес,
        '&подр'               => &подр,
        '&разд'               => &разд,
        '&съед'               => &съед,
        '&отв'               => &отв,
        '&затв'               => &затв,
        '&чет'                => &чет,
        '&зап'                => &зап,
        '&коп'                => &коп,
        '&изтр'               => &изтр,
        '&същ'                => &същ,
        '&вкл'                => &вкл,
        '&изкл'               => &изкл,
        '&пуст'               => &пуст,
        '&пълен'               => &пълен,
        '&истин'              => &истин,
        '&невяр'              => &невяр,
        '&четн'               => &четн,
        '&нечетн'             => &нечетн,
        '&положит'             => &положит,
        '&отриц'             => &отриц,
        '&цял'                => &цял,
        '&дроб'               => &дроб,
        '&закр'             => &закр,
        '&отреж'              => &отреж,
        '&случ'               => &случ,
        '&повт'               => &повт,
        '&форм'             => &форм,
        
        # Operators
        '&събери'            => &събери,
        '&извади'            => &извади,
        '&умножи'           => &умножи,
        '&раздели'          => &раздели,
        '&остатък'            => &остатък,
        '&цялочислено_деление' => &цялочислено_деление,
        '&вдигни_на_степен'           => &вдигни_на_степен,
        '&равно'              => &равно,
        '&не_равно'           => &не_равно,
        '&равно_на_число'        => &равно_на_число,
        '&не_равно_на_число'     => &не_равно_на_число,
        '&по_голямо'             => &по_голямо,
        '&по_малко'              => &по_малко,
        '&по_голямо_равно'       => &по_голямо_равно,
        '&по_малко_равно'       => &по_малко_равно,
        '&сравни'           => &сравни,
        '&сравни_числа'     => &сравни_числа,
        '&интелигентно_съвпадение'         => &интелигентно_съвпадение,
        '&идентични'          => &идентични,
        '&не_идентични'       => &не_идентични,
        '&и'                  => &и,
        '&или'                => &или,
        '&не_е'                 => &не_е,
        '&изключващо_или'    => &изключващо_или,
        '&дефинирано_или'     => &дефинирано_или,
        '&и_също'            => &и_също,
        '&или_пък'             => &или_пък,
        '&не_също'           => &не_също,
        '&бит_и'              => &бит_и,
        '&бит_или'            => &бит_или,
        '&бит_не'             => &бит_не,
        '&бит_изкл_или'       => &бит_изкл_или,
        '&ляв_сдвиг'        => &ляв_сдвиг,
        '&десен_сдвиг'       => &десен_сдвиг,
        '&конкатенация'       => &конкатенация,
        '&повторение'             => &повторение,
        '&конкат_присвои'   => &конкат_присвои,
        '&диапазон_вкл'     => &диапазон_вкл,
        '&диапазон_изкл'    => &диапазон_изкл,
        '&диапазон_мързелив'    => &диапазон_мързелив,
        '&диапазон_безкраен'      => &диапазон_безкраен,
        '&съединение_всички'     => &съединение_всички,
        '&съединение_всяко'   => &съединение_всяко,
        '&съединение_едно'    => &съединение_едно,
        '&съединение_никое' => &съединение_никое,
        '&присвои'          => &присвои,
        '&свържи'            => &свържи,
        '&присвои_ако_не'  => &присвои_ако_не,
        '&присвои_добави' => &присвои_добави,
        '&присвои_извади'  => &присвои_извади,
        '&присвои_умножи' => &присвои_умножи,
        '&присвои_раздели' => &присвои_раздели,
        
        # Special variables
        '&текуща_грешка'     => &текуща_грешка,
        '&съвпадение'         => &съвпадение,
        '&заместване_0'      => &заместване_0,
        '&заместване_1'      => &заместване_1,
        '&заместване_2'      => &заместване_2,
        '&тема'               => &тема,
        '&задай_тема'      => &задай_тема,
        '&версия_на_раку'        => &версия_на_раку,
        '&име_на_раку'           => &име_на_раку,
        '&версия_на_компилатор' => &версия_на_компилатор,
        '&име_на_компилатор'    => &име_на_компилатор,
        '&идентификатор_на_компилатор' => &идентификатор_на_компилатор,
        '&операционна_система' => &операционна_система,
        '&версия_на_ос'          => &версия_на_ос,
        '&издание_на_ос'          => &издание_на_ос,
        '&архитектура_на_ос'     => &архитектура_на_ос,
        '&битове_на_ос'            => &битове_на_ос,
        '&това_е_уин'            => &това_е_уин,
        '&име_на_ядро'           => &име_на_ядро,
        # '&издание_на_ядрото'        => &издание_на_ядрото, # duplicate
        # '&хардуер'         => &хардуер, # duplicate
        '&архитектура'         => &архитектура,
        '&битове'               => &битове,
        '&име_на_виртуална_машина' => &име_на_виртуална_машина,
        '&версия_на_виртуална_машина' => &версия_на_виртуална_машина,
        '&свойства_на_вм'        => &свойства_на_вм,
        '&конфигурация_на_вм'    => &конфигурация_на_вм,
        '&префикс_на_вм'         => &префикс_на_вм,
        '&препроцесор'       => &препроцесор,
        '&хранилища'        => &хранилища,
        '&спецификация'       => &спецификация,
        '&низ_на_подкана'   => &низ_на_подкана,
        
        # Unicode
        '&юникод_име'         => &юникод_име,
        '&юникод_стойност'    => &юникод_стойност,
        '&юникод_блок'        => &юникод_блок,
        '&юникод_категория'   => &юникод_категория,
        '&юникод_свойство'    => &юникод_свойство,
        '&юникод_версия'      => &юникод_версия,
        '&нормализирай_НФК'     => &нормализирай_НФК,
        '&нормализирай_НФД'     => &нормализирай_НФД,
        '&нормализирай_НФКК'    => &нормализирай_НФКК,
        '&нормализирай_НФКД'    => &нормализирай_НФКД,
        '&графеми_на_низ'     => &графеми_на_низ,
        '&кодови_точки_на_низ' => &кодови_точки_на_низ,
        
        # Advanced
        '&мързелив'            => &мързелив,
        '&безкраен_списък' => &безкраен_списък,
        '&събери'             => &събери,
        '&вземи_стойност'    => &вземи_стойност,
        '&поток_събития'      => &поток_събития,
        '&излъчи_събитие'     => &излъчи_събитие,
        '&абонирай_се_за_събития' => &абонирай_се_за_събития,
        '&филтрирай_събития'   => &филтрирай_събития,
        '&преобразувай_събития' => &преобразувай_събития,
        '&обедини_потоци'    => &обедини_потоци,
        '&избери_поток'       => &избери_поток,
        '&ограничи_поток'     => &ограничи_поток,
        '&пропусни_събития'   => &пропусни_събития,
        '&уникални_събития' => &уникални_събития,
        '&стабилен_поток'   => &стабилен_поток,
        '&интервален_поток' => &интервален_поток,
        '&резултат_или_грешка' => &резултат_или_грешка,
        '&безопасно'          => &безопасно,
        '&прихванете_тип'      => &прихванете_тип,
        '&изисквай'             => &изисквай,
        '&осигури'           => &осигури,
        '&провери_тип'        => &провери_тип,
        
        # Custom operators
        '&infix:<плюс>'       => &infix:<плюс>,
        '&infix:<минус>'      => &infix:<минус>,
        '&infix:<умножи>'   => &infix:<умножи>,
        '&infix:<раздели>'  => &infix:<раздели>,
        '&infix:<остатък>'    => &infix:<остатък>,
        '&infix:<степен>'    => &infix:<степен>,
        '&infix:<равно>'      => &infix:<равно>,
        '&infix:<не_равно>'   => &infix:<не_равно>,
        '&infix:<по_голямо>'     => &infix:<по_голямо>,
        '&infix:<по_малко>'      => &infix:<по_малко>,
        '&infix:<по_голямо_равно>' => &infix:<по_голямо_равно>,
        '&infix:<по_малко_равно>' => &infix:<по_малко_равно>,
        '&infix:<низ_равен>' => &infix:<низ_равен>,
        '&infix:<низ_не_равен>' => &infix:<низ_не_равен>,
        '&infix:<низ_по_голям>' => &infix:<низ_по_голям>,
        '&infix:<низ_по_малък>' => &infix:<низ_по_малък>,
        '&infix:<и>'          => &infix:<и>,
        '&infix:<или>'        => &infix:<или>,
        '&infix:<изкл_или>'   => &infix:<изкл_или>,
        '&prefix:<не_е>'        => &prefix:<не_е>,
        '&infix:<бит_и>'      => &infix:<бит_и>,
        '&infix:<бит_или>'    => &infix:<бит_или>,
        '&infix:<бит_изкл_или>' => &infix:<бит_изкл_или>,
        '&prefix:<бит_не>'    => &prefix:<бит_не>,
        '&infix:<ляв_сдвиг>' => &infix:<ляв_сдвиг>,
        '&infix:<десен_сдвиг>' => &infix:<десен_сдвиг>,
        '&infix:<до>'         => &infix:<до>,
        '&infix:<до_изкл>'    => &infix:<до_изкл>,
        '&infix:<съедини>'    => &infix:<съедини>,
    )
}
