
(define lessons '(
    (katakana-1
      (ア a) (イ i) (ウ u) (エ e) (オ o)
      (カ ka) (キ ki) (ク ku) (ケ ke) (コ ko)
      (ガ ga) (ギ gi) (グ gu) (ゲ ge) (ゴ go))
    (katakana-2
      (サ sa) (シ shi) (ス su) (セ se) (ソ so)
      (ザ za) (ジ ji) (ズ zu) (ゼ ze) (ゾ zo)
      (タ ta) (チ chi) (ツ tsu) (テ te) (ト to)
      (ダ da) (ヂ dji) (ヅ dzu) (デ de) (ド do))
    (katakana-3
      (ナ na) (ニ ni) (ヌ nu) (ネ ne) (ノ no)
      (ハ ha) (ヒ hi) (フ fu) (ヘ he) (ホ ho)
      (バ ba) (ビ bi) (ブ bu) (ベ be) (ボ bo)
      (パ pa) (ピ pi) (プ pu) (ペ pe) (ポ po))
    (katakana-4
      (マ ma) (ミ mi) (ム mu) (メ me) (モ mo)
      (ヤ ya) (ユ yu) (ヨ yo)
      (ラ ra) (リ ri) (ル ru) (レ re) (ロ ro)
      (ワ wa) (ヲ wo)
      (ン n))
    (katakana-5
      (キャ kya) (キュ kyu) (キョ kyo)
      (シャ sha) (シュ shu) (ショ sho)
      (チャ cha) (チュ chu) (チョ cho)
      (ニャ nya) (ニュ nyu) (ニョ nyo))
    (katakana-6
      (ヒャ hya) (ヒュ hyu) (ヒョ hyo)
      (ミャ mya) (ミュ myu) (ミョ myo)
      (リャ rya) (リュ ryu) (リョ ryo)
      (ー long-previous-vowel)
      (ッ double-next-consonant) (ヽ repeat-unvoiced) (ヾ repeat-voiced))
    (katakana-7
      (ギャ gya) (ギュ gyu) (ギョ gyo)
      (ジャ ja) (ジュ ju) (ジョ jo)
      (ヂャ ja) (ヂュ ju) (ヂョ jo)
      (ビャ bya) (ビュ byu) (ビョ byo)
      (ピャ pya) (ピュ pyu) (ピョ pyo))
    (hiragana-1
      (あ a) (い i) (う u) (え e) (お o)
      (か ka) (き ki) (く ku) (け ke) (こ ko)
      (が ga) (ぎ gi) (ぐ gu) (げ ge) (ご go))
    (hiragana-2
      (さ sa) (し shi) (す su) (せ se) (そ so)
      (ざ za) (じ ji) (ず zu) (ぜ ze) (ぞ zo)
      (た ta) (ち chi) (つ tsu) (て te) (と to)
      (だ da) (ぢ dji) (づ dzu) (で de) (ど do))
    (hiragana-3
      (な na) (に ni) (ぬ nu) (ね ne) (の no)
      (は ha) (ひ hi) (ふ fu) (へ he) (ほ ho)
      (ば ba) (び bi) (ぶ bu) (べ be) (ぼ bo)
      (ぱ pa) (ぴ pi) (ぷ pu) (ぺ pe) (ぽ po))
    (hiragana-4
      (ま ma) (み mi) (む mu) (め me) (も mo)
      (や ya) (ゆ yu) (よ yo)
      (ら ra) (り ri) (る ru) (れ re) (ろ ro)
      (わ wa) (を wo)
      (ん n))
    (hiragana-5
      (きゃ kya) (きゅ kyu) (きょ kyo)
      (しゃ sha) (しゅ shu) (しょ sho)
      (ちゃ cha) (ちゅ chu) (ちょ cho)
      (にゃ nya) (にゅ nyu) (にょ nyo))
    (hiragana-6
      (ひゃ hya) (ひゅ hyu) (ひょ hyo)
      (みゃ mya) (みゅ myu) (みょ myo)
      (りゃ rya) (りゅ ryu) (りょ ryo)
      (っ double-next-consonant) (ゝ repeat-unvoiced) (ゞ repeat-voiced))
    (hiragana-7
      (ぎゃ gya) (ぎゅ gyu) (ぎょ gyo)
      (じゃ ja) (じゅ ju) (じょ jo)
      (ぢゃ ja) (ぢゅ ju) (ぢょ jo)
      (びゃ bya) (びゅ byu) (びょ byo)
      (ぴゃ pya) (ぴゅ pyu) (ぴょ pyo))
      ))

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
      (else (abort "stringify not implemented for type")))))
      
(define starts-with? (lambda (prefix str)
    (let* (
        (pprefix (stringify prefix))
        (pstr (stringify str))
        (prefixlen (string-length pprefix)))
      (if (< (string-length pstr) prefixlen) #f
        (string=? pprefix (substring pstr 0 prefixlen))))))

(define ends-with? (lambda (suffix str)
    (let* (
        (psuffix (stringify suffix))
        (pstr (stringify str))
        (suffixlen (string-length psuffix))
        (strlen (string-length pstr)))
      (if (< (string-length pstr) suffixlen) #f
        (string=? psuffix (substring pstr (- strlen suffixlen) strlen))))))

(define make-bank (lambda (q-proc w-proc)
    (let (
        (q-adder (make-adder))
        (w-adder (make-adder)))
      (for-each-lesson (lambda (lesson-name lesson-items)
          (if (q-proc lesson-name)
            ((q-adder 'add-list!) lesson-items)
            (if (w-proc lesson-name)
              ((w-adder 'add-list!) lesson-items)
              #t))))
      (vector (list->vector ((q-adder 'items))) (list->vector ((w-adder 'items)))))))

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
          
(define make-distinct (lambda (init count random-item eq?)
    (with-add (lambda (add! add-list! items-so-far)
        (init add!)
        (let loop ((count count))
          (if (= count 0) #t
            (let loop2 ()
              (let ((candidate (random-item)))
                (let loop3 ((items (items-so-far)))
                  (cond
                    ((null? items) (add! candidate) (loop (- count 1)))
                    ((eq? (car items) candidate) (loop2))
                    (else (loop3 (cdr items)))))))))))))

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
        (options (make-distinct
            (lambda (add!) (add! item-index))
            wrong-count
            (lambda () (random-integer bank-length-with-wrongs))
            unfair?))
        (q (get-q item-index))
        (a-indexes (shuffle! (list->vector options)))
        (a-values (list->vector (map get-a (vector->list a-indexes))))
        (a-pick (find-index (lambda (i) (= i item-index)) a-indexes)))
      `(,q ,a-values ,a-pick))))

(define randomize! (lambda () (random-source-randomize! default-random-source)))

(define read-line-2 (lambda ()
    (let ((l (read-line)))
      (if (zero? (string-length l)) (read-line) l))))
      
(define run-quiz (lambda (bank wrong-count)
    (let loop ((do-prompt #f))
      (let* (
          (qdata (make-question bank wrong-count))
          (q (car qdata))
          (a-values (cadr qdata))
          (a-pick (caddr qdata)))
        (let (
            (present-question (lambda ()
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
                    (else (display "Wrong - it was ") (display a-pick) (display ".") (newline) (newline) (loop #t)))))))
          (if do-prompt
            (begin
              (display "Enter q to quit or press enter to continue.")
              (newline)
              (display "? ")
              (let ((b (read-line-2)))
                (if (equal? b "q") #t
                  (present-question))))
            (present-question)))))))
                
