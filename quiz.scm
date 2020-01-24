
(define lessons-dhn '(
    (katakana-1
      (ア a n) (イ i n) (ウ u n) (エ e n) (オ o n)
      (カ ka n) (キ ki n) (ク ku n) (ケ ke n) (コ ko n)
      (ガ ga d) (ギ gi d) (グ gu d) (ゲ ge d) (ゴ go d))
    (katakana-2
      (サ sa n) (シ shi n) (ス su n) (セ se n) (ソ so n)
      (ザ za d) (ジ ji d) (ズ zu d) (ゼ ze d) (ゾ zo d)
      (タ ta n) (チ chi n) (ツ tsu n) (テ te n) (ト to n)
      (ダ da d) (ヂ ji d) (ヅ zu d) (デ de d) (ド do d))
    (katakana-3
      (ナ na n) (ニ ni n) (ヌ nu n) (ネ ne n) (ノ no n)
      (ハ ha n) (ヒ hi n) (フ fu n) (ヘ he n) (ホ ho n)
      (バ ba d) (ビ bi d) (ブ bu d) (ベ be d) (ボ bo d)
      (パ pa h) (ピ pi h) (プ pu h) (ペ pe h) (ポ po h))
    (katakana-4a
      (マ ma n) (ミ mi n) (ム mu n) (メ me n) (モ mo n)
      (ヤ ya n) (ユ yu n) (ヨ yo n))
    (katakana-4b
      (ラ ra n) (リ ri n) (ル ru n) (レ re n) (ロ ro n)
      (ワ wa n) (ヰ wi n) (ヱ we n) (ヲ wo n)
      (ン n n))
    (katakana-5
      (キャ kya n) (キュ kyu n) (キョ kyo n)
      (シャ sha n) (シュ shu n) (ショ sho n)
      (チャ cha n) (チュ chu n) (チョ cho n)
      (ニャ nya n) (ニュ nyu n) (ニョ nyo n))
    (katakana-6
      (ヒャ hya n) (ヒュ hyu n) (ヒョ hyo n)
      (ミャ mya n) (ミュ myu n) (ミョ myo n)
      (リャ rya n) (リュ ryu n) (リョ ryo n)
      (ー long-previous-vowel n)
      (ッ double-next-consonant n) (ヽ repeat-unvoiced n) (ヾ repeat-voiced d))
    (katakana-7
      (ギャ gya d) (ギュ gyu d) (ギョ gyo d)
      (ジャ ja d) (ジュ ju d) (ジョ jo d)
      (ヂャ ja d) (ヂュ ju d) (ヂョ jo d)
      (ビャ bya d) (ビュ byu d) (ビョ byo d)
      (ピャ pya h) (ピュ pyu h) (ピョ pyo h))
    (hiragana-1
      (あ a n) (い i n) (う u n) (え e n) (お o n)
      (か ka n) (き ki n) (く ku n) (け ke n) (こ ko n)
      (が ga d) (ぎ gi d) (ぐ gu d) (げ ge d) (ご go d))
    (hiragana-2
      (さ sa n) (し shi n) (す su n) (せ se n) (そ so n)
      (ざ za d) (じ ji d) (ず zu d) (ぜ ze d) (ぞ zo d)
      (た ta n) (ち chi n) (つ tsu n) (て te n) (と to n)
      (だ da d) (ぢ ji d) (づ zu d) (で de d) (ど do d))
    (hiragana-3
      (な na n) (に ni n) (ぬ nu n) (ね ne n) (の no n)
      (は ha n) (ひ hi n) (ふ fu n) (へ he n) (ほ ho n)
      (ば ba d) (び bi d) (ぶ bu d) (べ be d) (ぼ bo d)
      (ぱ pa h) (ぴ pi h) (ぷ pu h) (ぺ pe h) (ぽ po h))
    (hiragana-4a
      (ま ma n) (み mi n) (む mu n) (め me n) (も mo n)
      (や ya n) (ゆ yu n) (よ yo n))
    (hiragana-4b
      (ら ra n) (り ri n) (る ru n) (れ re n) (ろ ro n)
      (わ wa n) (ゐ wi n) (ゑ we n) (を wo n)
      (ん n n))
    (hiragana-5
      (きゃ kya n) (きゅ kyu n) (きょ kyo n)
      (しゃ sha n) (しゅ shu n) (しょ sho n)
      (ちゃ cha n) (ちゅ chu n) (ちょ cho n)
      (にゃ nya n) (にゅ nyu n) (にょ nyo n))
    (hiragana-6
      (ひゃ hya n) (ひゅ hyu n) (ひょ hyo n)
      (みゃ mya n) (みゅ myu n) (みょ myo n)
      (りゃ rya n) (りゅ ryu n) (りょ ryo n)
      (っ double-next-consonant n) (ゝ repeat-unvoiced n) (ゞ repeat-voiced d))
    (hiragana-7
      (ぎゃ gya d) (ぎゅ gyu d) (ぎょ gyo d)
      (じゃ ja d) (じゅ ju d) (じょ jo d)
      (ぢゃ ja d) (ぢゅ ju d) (ぢょ jo d)
      (びゃ bya d) (びゅ byu d) (びょ byo d)
      (ぴゃ pya h) (ぴゅ pyu h) (ぴょ pyo h))
      ))

(define lessons
  (map (lambda (lesson)
      (let* (
          (lesson-name (car lesson))
          (lesson-items (cdr lesson)))
        `(,lesson-name
          ,@(map (lambda (lesson-item)
              `(,(car lesson-item) ,(cadr lesson-item)))
            lesson-items))))
    lessons-dhn))

(define get-dhn (lambda (k)
    (let loop ((lessons-dhn lessons-dhn))
      (if (null? lessons-dhn) #f
        (let (
            (lesson-dhn (car lessons-dhn))
            (next-lesson (lambda () (loop (cdr lessons-dhn)))))
          (let loop2 ((items-dhn (cdr lesson-dhn)))
            (if (null? items-dhn) (next-lesson)
              (let (
                  (item-dhn (car items-dhn))
                  (next-item (lambda () (loop2 (cdr items-dhn)))))
                (if (eq? (car item-dhn) k) (caddr item-dhn) (next-item))))))))))

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

(define for-each-lesson-dhn (lambda (proc)
    (let loop ((lessons lessons-dhn))
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

(define any (lambda (proc items)
    (let loop ((items items))
      (cond
        ((null? items) #f)
        ((proc (car items)) #t)
        (else (loop (cdr items)))))))

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
              
(define compile-rule (lambda (rule)
    (cond
      ((procedure? rule) rule)
      ((eq? rule #t) (lambda (x) #t))
      ((eq? rule #f) (lambda (x) #f))
      ((pair? rule)
        (case (car rule)
          ((not)
            (let (
                (irule (compile-rule (cdr rule))))
              (lambda (x) (not (irule x)))))
          ((or)
            (let (
                (irules (map compile-rule (cdr rule))))
              (lambda (x) (any (lambda (r) (r x)) irules))))
          ((and)
            (let (
                (irules (map compile-rule (cdr rule))))
              (lambda (x) (not (any (lambda (r) (not (r x))) irules)))))
          ((is)
            (let (
                (the-strings (map stringify (cdr rule))))
              (lambda (x)
                (let (
                    (x (stringify x)))
                  (any (lambda (y) (string=? y x)) the-strings)))))
          ((starts-with)
            (let (
                (the-strings (map stringify (cdr rule))))
              (lambda (x)
                (let (
                    (x (stringify x)))
                  (any (lambda (y) (starts-with? y x)) the-strings)))))
          ((ends-with)
            (let (
                (the-strings (map stringify (cdr rule))))
              (lambda (x)
                (let (
                    (x (stringify x)))
                  (any (lambda (y) (ends-with? y x)) the-strings)))))
          ((contains)
            (let (
                (the-strings (map stringify (cdr rule))))
              (lambda (x)
                (let (
                    (x (stringify x)))
                  (any (lambda (y) (contains? y x)) the-strings)))))           
          (else (abort `("unknown rule " ,(car rule))))))
        (else (abort "unknown rule type")))))

(define dhn-filter (lambda (dhn item)
    (let (
        (item-dhn (get-dhn (car item))))
      (contains? item-dhn dhn))))
      
(define make-bank (lambda (q-proc w-proc dhn)
    (let (
        (q-proc (compile-rule q-proc))
        (w-proc (compile-rule w-proc))
        (q-adder (make-adder))
        (w-adder (make-adder))
        (add-dhn! (lambda (add! items)
            (let loop ((items items))
              (if (null? items) #t
                (begin
                  (if (dhn-filter dhn (car items)) (add! (car items)))
                  (loop (cdr items))))))))
      (for-each-lesson (lambda (lesson-name lesson-items)
          (if (q-proc lesson-name)
            (add-dhn! (q-adder 'add!) lesson-items)
            (if (w-proc lesson-name)
              (add-dhn! (w-adder 'add!) lesson-items)
              #t))))
      (vector (list->vector ((q-adder 'items))) (list->vector ((w-adder 'items)))))))

(define make-bank-dhn (lambda (q-proc w-proc)
    (let (
        (q-proc (compile-rule q-proc))
        (w-proc (compile-rule w-proc))
        (q-adder (make-adder))
        (w-adder (make-adder)))
      (for-each-lesson-dhn (lambda (lesson-name lesson-items)
          (if (q-proc lesson-name)
            ((q-adder 'add-list!) lesson-items)
            (if (w-proc lesson-name)
              ((w-adder 'add-list!) lesson-items)
              #t))))
      (vector (list->vector ((q-adder 'items))) (list->vector ((w-adder 'items)))))))

(define bank-info (lambda (bank)
    `((questions . ,(vector-length (vector-ref bank 0)))
      (additional-wrongs . ,(vector-length (vector-ref bank 1))))))

(define for (lambda (s e proc)
    (let loop ((i s))
      (if (< i e) (begin (proc i) (loop (+ i 1)))
        #t))))

(define lookup (lambda (desired-lesson-name item)
    (call-with-current-continuation (lambda (return)
        (for-each-lesson (lambda (lesson-name lesson-items)
            (if (eq? desired-lesson-name lesson-name)
              (let loop ((li lesson-items))
                (cond
                  ((equal? (caar li) item) (return (cadar li)))
                  ((equal? (cadar li) item) (return (caar li)))
                  ((null? (cdr li)) (return #f))
                  (else (loop (cdr li)))))
              #t)))))))

(define lookup-1-from-bank (lambda (bank item)
    (let* (
        (bank1 (vector-ref bank 0))
        (len (vector-length bank1)))
      (call-with-current-continuation (lambda (return)
          (for 0 len (lambda (i)
              (let (
                  (q (vector-ref bank1 i)))
                (if (eq? (car q) item) (return (cadr q)))
                (if (eq? (cadr q) item) (return (car q))))))
          #f)))))
      
(define lookup-from-bank (lambda (bank items)
    (with-add (lambda (add! add-list! get-items)
        (let loop ((remain items))
          (if (null? remain) #t
            (let (
                (item (car remain))
                (remain (cdr remain)))
              (add! (lookup-1-from-bank bank item))
              (loop remain))))))))

(define indistinguishable-items `(
    (,(lookup 'katakana-3 'he) . ,(lookup 'hiragana-3 'he))
    (,(lookup 'katakana-3 'be) . ,(lookup 'hiragana-3 'be))
    (,(lookup 'katakana-3 'pe) . ,(lookup 'hiragana-3 'pe))
    (,(lookup 'hiragana-6 'double-next-consonant) . ,(lookup 'hiragana-2 'tsu))
    (,(lookup 'katakana-6 'double-next-consonant) . ,(lookup 'katakana-2 'tsu))))

(define indistinguishable? (lambda (a b)
    (or
      (equal? a b)
      (any
        (lambda (p)
          (or
            (and (equal? a (car p)) (equal? b (cdr p)))
            (and (equal? b (car p)) (equal? a (cdr p)))))
        indistinguishable-items))))          

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

(define filter (lambda (proc lst)
    (let loop ((lst lst) (result '()))
      (if (null? lst) result
        (if (proc (car lst))
          (loop (cdr lst) (cons (car lst) result))
          (loop (cdr lst) (reverse result)))))))
          
(define make-question (lambda (bank wrong-count)
    (let* (
        (flip (random-integer 2))
        (bank-length (vector-length (vector-ref bank 0)))
        (bank-length-with-wrongs (+ bank-length (vector-length (vector-ref bank 1))))
        (ref (lambda (i)
            (if (< i bank-length)
              (vector-ref (vector-ref bank 0) i)
              (vector-ref (vector-ref bank 1) (- i bank-length)))))
        (get-q (lambda (i) ((if (= flip 0) car cadr) (ref i))))
        (get-a (lambda (i) ((if (= flip 0) cadr car) (ref i))))
        (unfair? (lambda (i j)
            (or
              (= i j)
              (indistinguishable? (get-q i) (get-q j))
              (indistinguishable? (get-a i) (get-a j)))))
        (item-index (random-integer bank-length))
        (options
          (cons item-index
            (make-distinct
              (filter (lambda (j) (not (unfair? item-index j))) (iota bank-length-with-wrongs))
              wrong-count
              unfair?)))
        (q (get-q item-index))
        (a-indexes (shuffle! (list->vector options)))
        (a-values (list->vector (map get-a (vector->list a-indexes))))
        (a-pick (find-index (lambda (i) (= i item-index)) a-indexes)))
      `(,q ,a-values ,a-pick))))

(define make-question-dhn (lambda (q bank-dhn wrong-count)
    (let* (
        (bank-length (vector-length (vector-ref bank-dhn 0)))
        (bank-length-with-wrongs (+ bank-length (vector-length (vector-ref bank-dhn 1))))
        (ref (lambda (i)
            (if (< i bank-length)
              (vector-ref (vector-ref bank-dhn 0) i)
              (vector-ref (vector-ref bank-dhn 1) (- i bank-length)))))
        (flip-item-index
          (let loop ((i 0))
            (if (>= i bank-length)
              (abort "Question not found")
              (let (
                  (item (ref i)))
                (cond
                  ((eq? (car item) q) (cons 0 i))
                  ((eq? (cadr item) q) (cons 1 i))
                  (else (loop (+ i 1))))))))
        (flip (car flip-item-index))
        (item-index (cdr flip-item-index))
        (get-q (lambda (i) ((if (= flip 0) car cadr) (ref i))))
        (get-a (lambda (i) ((if (= flip 0) cadr car) (ref i))))
        (get-dhn (lambda (i) (caddr (ref i))))
        (unfair? (lambda (i j)
            (or
              (= i j)
              (indistinguishable? (get-q i) (get-q j))
              (indistinguishable? (get-a i) (get-a j)))))
        (dhn-item-index (get-dhn item-index))
        (options
          (cons item-index
            (make-distinct
              (filter (lambda (i) (and (not (unfair? i item-index)) (eq? (get-dhn i) dhn-item-index)))
                (iota bank-length-with-wrongs))
              wrong-count
              unfair?)))
        (q (get-q item-index))
        (a-indexes (shuffle! (list->vector options)))
        (a-values (list->vector (map get-a (vector->list a-indexes))))
        (a-pick (find-index (lambda (i) (= i item-index)) a-indexes)))
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

(define run-quiz-dhn (lambda (qs bank wrong-count)
    (let loop ((do-prompt #f) (qs qs))
      (if (null? qs)
        (begin
	  (display "Done!")
	  (newline))
        (let* (
            (qdata (make-question-dhn (car qs) bank wrong-count))
	    (q (car qdata))
	    (a-values (cadr qdata))
	    (a-pick (caddr qdata)))
	  (let (
	      (present-question
	        (lambda ()
		  (present-question q a-values a-pick
		    (lambda (right?)
		      (if right? (loop #t (cdr qs)) (loop #t qs)))))))
	    (if do-prompt
	      (begin
		(display "Enter q to quit or press enter to continue.")
		(newline)
		(display "? ")
		(let ((b (read-line-2)))
		  (if (equal? b "q") #t
		    (present-question))))
	      (present-question))))))))

(define bh (make-bank '(and (starts-with hiragana) (ends-with 1 2 3 |4a| |4b|)) #f 'n))
(define bhn (make-bank-dhn '(and (starts-with hiragana) (ends-with 1 2 3 |4a| |4b|)) #f))
(define bk (make-bank '(and (starts-with katakana) (ends-with 1 2 3 |4a| |4b|)) #f 'n))
(define bkn (make-bank-dhn '(and (starts-with katakana) (ends-with 1 2 3 |4a| |4b|)) #f))

(randomize!)
