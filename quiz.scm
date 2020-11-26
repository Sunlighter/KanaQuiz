
(define lessons '())

(define add-lesson! (lambda (name qlist)
    (set! lessons
      (cons (cons name qlist) lessons))))

(add-lesson! 'katakana-1 '(
    #(n ア a) #(n イ i) #(n ウ u) #(n エ e) #(n オ o)
    #(n カ ka) #(n キ ki) #(n ク ku) #(n ケ ke) #(n コ ko)
    #(d ガ ga) #(d ギ gi) #(d グ gu) #(d ゲ ge) #(d ゴ go)))

(add-lesson! 'katakana-2 '(
    #(n サ sa) #(n シ shi) #(n ス su) #(n セ se) #(n ソ so)
    #(d ザ za) #(d ジ ji) #(d ズ zu) #(d ゼ ze) #(d ゾ zo)
    #(n タ ta) #(n チ chi) #(n ツ tsu) #(n テ te) #(n ト to)
    #(d ダ da) #(d ヂ ji) #(d ヅ zu) #(d デ de) #(d ド do)))

(add-lesson! 'katakana-3 '(
    #(n ナ na) #(n ニ ni) #(n ヌ nu) #(n ネ ne) #(n ノ no)
    #(n ハ ha) #(n ヒ hi) #(n フ fu) #(n ヘ he) #(n ホ ho)
    #(d バ ba) #(d ビ bi) #(d ブ bu) #(d ベ be) #(d ボ bo)
    #(h パ pa) #(h ピ pi) #(h プ pu) #(h ペ pe) #(h ポ po)))

(add-lesson! 'katakana-4a '(
    #(n マ ma) #(n ミ mi) #(n ム mu) #(n メ me) #(n モ mo)
    #(n ヤ ya) #(n ユ yu) #(n ヨ yo)))

(add-lesson! 'katakana-4b '(
    #(n ラ ra) #(n リ ri) #(n ル ru) #(n レ re) #(n ロ ro)
    #(n ワ wa) #(n ヰ wi) #(n ヱ we) #(n ヲ wo)
    #(n ン n)))

(add-lesson! 'katakana-5 '(
    #(n2 キャ kya) #(n2 キュ kyu) #(n2 キョ kyo)
    #(n2 シャ sha) #(n2 シュ shu) #(n2 ショ sho)
    #(n2 チャ cha) #(n2 チュ chu) #(n2 チョ cho)
    #(n2 ニャ nya) #(n2 ニュ nyu) #(n2 ニョ nyo)))

(add-lesson! 'katakana-6 '(
    #(n2 ヒャ hya) #(n2 ヒュ hyu) #(n2 ヒョ hyo)
    #(n2 ミャ mya) #(n2 ミュ myu) #(n2 ミョ myo)
    #(n2 リャ rya) #(n2 リュ ryu) #(n2 リョ ryo)
    #(n ー long-previous-vowel)
    #(n ッ double-next-consonant) #(n ヽ repeat-unvoiced) #(d ヾ repeat-voiced)))

(add-lesson! 'katakana-7 '(
    #(d2 ギャ gya) #(d2 ギュ gyu) #(d2 ギョ gyo)
    #(d2 ジャ ja) #(d2 ジュ ju) #(d2 ジョ jo)
    #(d2 ヂャ ja) #(d2 ヂュ ju) #(d2 ヂョ jo)
    #(d2 ビャ bya) #(d2 ビュ byu) #(d2 ビョ byo)
    #(h2 ピャ pya) #(h2 ピュ pyu) #(h2 ピョ pyo)))

(add-lesson! 'hiragana-1 '(
    #(n あ a) #(n い i) #(n う u) #(n え e) #(n お o)
    #(n か ka) #(n き ki) #(n く ku) #(n け ke) #(n こ ko)
    #(d が ga) #(d ぎ gi) #(d ぐ gu) #(d げ ge) #(d ご go)))

(add-lesson! 'hiragana-2 '(
    #(n さ sa) #(n し shi) #(n す su) #(n せ se) #(n そ so)
    #(d ざ za) #(d じ ji) #(d ず zu) #(d ぜ ze) #(d ぞ zo)
    #(n た ta) #(n ち chi) #(n つ tsu) #(n て te) #(n と to)
    #(d だ da) #(d ぢ ji) #(d づ zu) #(d で de) #(d ど do)))

(add-lesson! 'hiragana-3 '(
    #(n な na) #(n に ni) #(n ぬ nu) #(n ね ne) #(n の no)
    #(n は ha) #(n ひ hi) #(n ふ fu) #(n へ he) #(n ほ ho)
    #(d ば ba) #(d び bi) #(d ぶ bu) #(d べ be) #(d ぼ bo)
    #(h ぱ pa) #(h ぴ pi) #(h ぷ pu) #(h ぺ pe) #(h ぽ po)))

(add-lesson! 'hiragana-4a '(
    #(n ま ma) #(n み mi) #(n む mu) #(n め me) #(n も mo)
    #(n や ya) #(n ゆ yu) #(n よ yo)))

(add-lesson! 'hiragana-4b '(
    #(n ら ra) #(n り ri) #(n る ru) #(n れ re) #(n ろ ro)
    #(n わ wa) #(n ゐ wi) #(n ゑ we) #(n を wo)
    #(n ん n)))

(add-lesson! 'hiragana-5 '(
    #(n2 きゃ kya) #(n2 きゅ kyu) #(n2 きょ kyo)
    #(n2 しゃ sha) #(n2 しゅ shu) #(n2 しょ sho)
    #(n2 ちゃ cha) #(n2 ちゅ chu) #(n2 ちょ cho)
    #(n2 にゃ nya) #(n2 にゅ nyu) #(n2 にょ nyo)))

(add-lesson! 'hiragana-6 '(
    #(n2 ひゃ hya) #(n2 ひゅ hyu) #(n2 ひょ hyo)
    #(n2 みゃ mya) #(n2 みゅ myu) #(n2 みょ myo)
    #(n2 りゃ rya) #(n2 りゅ ryu) #(n2 りょ ryo)
    #(n っ double-next-consonant) #(n ゝ repeat-unvoiced) #(d ゞ repeat-voiced)))

(add-lesson! 'hiragana-7 '(
    #(d2 ぎゃ gya) #(d2 ぎゅ gyu) #(d2 ぎょ gyo)
    #(d2 じゃ ja) #(d2 じゅ ju) #(d2 じょ jo)
    #(d2 ぢゃ ja) #(d2 ぢゅ ju) #(d2 ぢょ jo)
    #(d2 びゃ bya) #(d2 びゅ byu) #(d2 びょ byo)
    #(h2 ぴゃ pya) #(h2 ぴゅ pyu) #(h2 ぴょ pyo)))

(define make-adder (lambda ()
    (let* (
        (results '())
        (add! (lambda (i) (set! results (cons i results)) #t))
        (add-list! (lambda (l)
            (let loop ((l l))
              (if (null? l) #t
                (begin (add! (car l)) (loop (cdr l)))))))
        (items-so-far (lambda () results)))
      (lambda (key)
        (case key
          ((add!) add!)
          ((add-list!) add-list!)
          ((items) (lambda () (reverse results)))
          (else (abort `("Unknown key " ,key))))))))
        
(define with-add (lambda (proc)
    (let* (
        (a (make-adder)))
      (proc (a 'add!) (a 'add-list!) (a 'items))
      ((a 'items)))))

(define for-each-lesson (lambda (proc)
    (let loop ((lessons lessons))
      (if (null? lessons) #t
        (let* (
            (lesson (car lessons))
            (lesson-name (car lesson))
            (lesson-items (cdr lesson))
            (lessons (cdr lessons)))
          (proc lesson-name lesson-items)
          (loop lessons))))))

(define list-lessons (lambda ()
    (with-add (lambda (add! add-list! items-so-far)
        (for-each-lesson (lambda (name items) (add! name)))))))

(define any? (lambda (proc items)
    (let loop ((items items))
      (cond
        ((null? items) #f)
        ((proc (car items)) #t)
        (else (loop (cdr items)))))))

(define filter (lambda (proc items)
    (let loop ((items items) (result '()))
      (if (null? items) (reverse result)
        (let (
            (item (car items))
            (items (cdr items)))
          (if (proc item) (loop items (cons item result))
            (loop items result)))))))

(define filter-vector (lambda (proc itemvec) (list->vector (filter proc (vector->list itemvec)))))

(define stringify (lambda (x)
    (cond
      ((char? x) (make-string 1 x))
      ((string? x) x)
      ((symbol? x) (symbol->string x))
      ((number? x) (number->string x 10))
      (else (abort "stringify not implemented for type")))))
      
(define starts-with? (lambda (prefix str)
    (let* (
        (prefix (stringify prefix))
        (str (stringify str))
        (prefixlen (string-length prefix)))
      (if (< (string-length str) prefixlen) #f
        (string=? prefix (substring str 0 prefixlen))))))

(define ends-with? (lambda (suffix str)
    (let* (
        (suffix (stringify suffix))
        (str (stringify str))
        (suffixlen (string-length suffix))
        (strlen (string-length str)))
      (if (< strlen suffixlen) #f
        (string=? suffix (substring str (- strlen suffixlen) strlen))))))

(define contains? (lambda (infix str)
    (let* (
        (infix (stringify infix))
        (str (stringify str))
        (infixlen (string-length infix))
        (strlen (string-length str)))
      (if (< strlen infixlen) #f
        (let loop ((pos 0))
          (if (> (+ pos infixlen) strlen) #f
            (if (string=? infix (substring str pos (+ pos infixlen))) #t
              (loop (+ pos 1)))))))))

; a compiled rule is a function called as (<rule> <lesson-name> <question-type>)

(define compile-rule (lambda (context rule)
    (let (
        (get-by-context (lambda (context) (lambda (lesson-name question-type)
              (if (eq? context 'question-type) question-type lesson-name)))))
      (cond
        ((procedure? rule) rule)
        ((eq? rule #t) (lambda (lesson-name question-type) #t))
        ((eq? rule #f) (lambda (lesson-name question-type) #f))
        ((pair? rule)
          (case (car rule)
            ((not)
              (let (
                  (irule (compile-rule context (cdr rule))))
                (lambda (lesson-name question-type) (not (irule lesson-name question-type)))))
            ((or)
              (let (
                  (irules (map (lambda (x) (compile-rule context x)) (cdr rule))))
                (lambda (lesson-name question-type) (any? (lambda (r) (r lesson-name question-type)) irules))))
            ((and)
              (let (
                  (irules (map (lambda (x) (compile-rule context x)) (cdr rule))))
                (lambda (lesson-name question-type) (not (any? (lambda (r) (not (r lesson-name question-type))) irules)))))
            ((lesson-name)
              (compile-rule 'lesson-name (cdr rule)))
            ((question-type)
              (compile-rule 'question-type (cdr rule)))
            ((is)
              (let (
                  (gbc (get-by-context context))
                  (the-strings (map stringify (cdr rule))))
                (lambda (lesson-name question-type)
                  (let (
                      (x (stringify (gbc lesson-name question-type))))
                    (any? (lambda (y) (string=? y x)) the-strings)))))
            ((starts-with)
              (let (
                  (gbc (get-by-context context))
                  (the-strings (map stringify (cdr rule))))
                (lambda (lesson-name question-type)
                  (let (
                      (x (stringify (gbc lesson-name question-type))))
                    (any? (lambda (y) (starts-with? y x)) the-strings)))))
            ((ends-with)
              (let (
                  (gbc (get-by-context context))
                  (the-strings (map stringify (cdr rule))))
                (lambda (lesson-name question-type)
                  (let (
                      (x (stringify (gbc lesson-name question-type))))
                    (any? (lambda (y) (ends-with? y x)) the-strings)))))
            ((contains includes)
              (let (
                  (gbc (get-by-context context))
                  (the-strings (map stringify (cdr rule))))
                (lambda (lesson-name question-type)
                  (let (
                      (x (stringify (gbc lesson-name question-type))))
                    (any? (lambda (y) (contains? y x)) the-strings)))))           
            (else (abort `("unknown rule " ,(car rule))))))
          (else (abort "unknown rule type"))))))

(define make-bank (lambda (q-proc w-proc)
    (let (
        (q-proc (compile-rule 'lesson-name q-proc))
        (w-proc (compile-rule 'lesson-name w-proc))
        (q-adder (make-adder))
        (w-adder (make-adder)))
      (for-each-lesson (lambda (lesson-name lesson-items)
          (for-each (lambda (lesson-item)
              (if (q-proc lesson-name (vector-ref lesson-item 0))
                ((q-adder 'add!) lesson-item)
                (if (w-proc lesson-name (vector-ref lesson-item 0))
                  ((w-adder 'add!) lesson-item)
                  #t)))
            lesson-items)))
      (vector (list->vector ((q-adder 'items))) (list->vector ((w-adder 'items)))))))

(define bank-info (lambda (bank)
    `((questions . ,(vector-length (vector-ref bank 0)))
      (additional-wrongs . ,(vector-length (vector-ref bank 1))))))

(define for (lambda (s e proc)
    (let loop ((i s))
      (if (< i e) (begin (proc i) (loop (+ i 1)))
        #t))))

(define lookup (lambda (rule ix1 ix2 item)
    (let ((crule (compile-rule 'lesson-name rule)))
      (call-with-current-continuation (lambda (return)
          (for-each-lesson (lambda (lesson-name lesson-items)
              (for-each (lambda (lesson-item)
                  (if (crule lesson-name (vector-ref lesson-item 0))
                    (if (equal? (vector-ref lesson-item ix1) item)
                      (return (vector-ref lesson-item ix2))
                      (if (equal? (vector-ref lesson-item ix2) item)
                        (return (vector-ref lesson-item ix1))
                        #t))
                    #t))
                lesson-items))))))))

(define indistinguishable-items
    (let (
        (lookup (lambda (s t) (lookup `(is ,s) 1 2 t))))
      `(
        (,(lookup 'katakana-3 'he) . ,(lookup 'hiragana-3 'he))
        (,(lookup 'katakana-3 'be) . ,(lookup 'hiragana-3 'be))
        (,(lookup 'katakana-3 'pe) . ,(lookup 'hiragana-3 'pe))
        (,(lookup 'hiragana-6 'double-next-consonant) . ,(lookup 'hiragana-2 'tsu))
        (,(lookup 'katakana-6 'double-next-consonant) . ,(lookup 'katakana-2 'tsu)))))

(define indistinguishable? (lambda (a b)
    (or
      (equal? a b)
      (any?
        (lambda (p)
          (or
            (and (equal? a (car p)) (equal? b (cdr p)))
            (and (equal? b (car p)) (equal? a (cdr p)))))
        indistinguishable-items))))

; generate a list of up to <count> random items from <candidate-list> which are distinct according to <eq?>

(define make-distinct (lambda (candidate-list count eq?)
    (let loop (
        (results '())
        (count-so-far 0)
        (candidate-list candidate-list))
      (cond
        ((null? candidate-list) results)
        ((>= count-so-far count) results)
        (else
          (let* (
              (candidate-vector (list->vector candidate-list))
              (i (random-integer (vector-length candidate-vector)))
              (filtered-candidates (let loop ((results '()) (j 0))
                  (if (>= j (vector-length candidate-vector))
                    results
                    (if (and (not (= i j)) (not (eq? (vector-ref candidate-vector i) (vector-ref candidate-vector j))))
                      (loop (cons (vector-ref candidate-vector j) results) (+ j 1))
                      (loop results (+ j 1)))))))
            (loop (cons (vector-ref candidate-vector i) results) (+ count-so-far 1) filtered-candidates)))))))

(define shuffle! (lambda (vec)
    (let (
        (swap! (lambda (i j)
            (if (= i j) #t
              (let (
                  (ii (vector-ref vec i))
                  (jj (vector-ref vec j)))
                (vector-set! vec i jj)
                (vector-set! vec j ii)
                #t)))))
      (let loop ((c (vector-length vec)))
        (if (<= c 0) vec
          (let (
              (i (random-integer c))
              (j (- c 1)))
            (swap! i j)
            (loop j)))))))

(define find-index (lambda (proc vec)
    (let loop ((i 0))
      (if (< i (vector-length vec))
        (if (proc (vector-ref vec i))
          i
          (loop (+ i 1)))
        #f))))
          
(define make-question (lambda (bank wrong-count)
    (let* (
        (bank-length (vector-length (vector-ref bank 0)))
        (item-index (random-integer bank-length))
        (item (vector-ref (vector-ref bank 0) item-index))
        (item-kind (vector-ref item 0))
        (item-length (vector-length item))
        (item-indexes (iota (- (vector-length item) 1) 1))
        (index-picks (make-distinct item-indexes 2 =))
        (q-idx (car index-picks))
        (a-idx (cadr index-picks))
        (item-q (vector-ref item q-idx))
        (item-a (vector-ref item a-idx))
        (is-same-type (lambda (x) (and (eq? (vector-ref x 0) item-kind) (= (vector-length x) item-length))))
        (is-distinguishable-same-type (lambda (x)
            (and
              (is-same-type x)
              (not (indistinguishable? item-q (vector-ref x q-idx)))
              (not (indistinguishable? item-a (vector-ref x a-idx))))))
        (wrongs
          (vector-append
            (filter-vector is-distinguishable-same-type (vector-ref bank 0))
            (filter-vector is-distinguishable-same-type (vector-ref bank 1))))
        (unfair (lambda (i j)
            (or
              (= i j)
              (indistinguishable? (vector-ref (vector-ref wrongs i) q-idx) (vector-ref (vector-ref wrongs j) q-idx))
              (indistinguishable? (vector-ref (vector-ref wrongs i) a-idx) (vector-ref (vector-ref wrongs j) a-idx)))))
        (selected-wrongs (make-distinct (iota (vector-length wrongs)) wrong-count unfair))
        (q (vector-ref item q-idx))
        (a-indexes (shuffle! (list->vector (cons -1 selected-wrongs))))
        (a-values (vector-map (lambda (k) (if (= k -1) (vector-ref item a-idx) (vector-ref (vector-ref wrongs k) a-idx))) a-indexes))
        (a-pick (find-index (lambda (i) (= i -1)) a-indexes)))
      `(,q ,a-values ,a-pick))))

(define randomize! (lambda () (random-source-randomize! default-random-source)))

(define read-line-2 (lambda ()
    (let ((l (read-line)))
      (if (zero? (string-length l)) (read-line) l))))

(define present-question (lambda (q a-values a-pick loop)
    (shell-command "clear")
    (display q) (newline) (newline)
    (for 0 (vector-length a-values) (lambda (i)
        (display "  ")
        (display i)
        (display ") ")
        (display (vector-ref a-values i))
        (newline)))
    (newline)
    (display "Enter your answer or q to quit.")
    (newline)
    (display "? ")
    (let ((a (read)))
      (cond
        ((equal? a 'q) #t)
        ((equal? a a-pick) (display "Correct!") (newline) (newline) (loop #t))
        (else (display "Wrong - it was ") (display a-pick) (display ".") (newline) (newline) (loop #f))))))

(define run-quiz (lambda (bank wrong-count)
    (let loop ((do-prompt #f))
      (let* (
          (qdata (make-question bank wrong-count))
          (q (car qdata))
          (a-values (cadr qdata))
          (a-pick (caddr qdata)))
        (let (
            (present-question
              (lambda ()
                (present-question q a-values a-pick
                  (lambda (right?) (loop #t))))))
          (if do-prompt
            (begin
              (display "Enter q to quit or press enter to continue.")
              (newline)
              (display "? ")
              (let ((b (read-line-2)))
                (if (equal? b "q") #t
                  (present-question))))
            (present-question)))))))

(randomize!)
