# Hiragana / Katakana Quiz Program in Gambit Scheme

This is a simple quiz program I wrote in Gambit Scheme.

The code can quiz on *any* subject, but I wrote it to quiz myself on the Japanese kana, so that is included. I got
the [hiragana](https://en.wikipedia.org/wiki/Hiragana) and [katakana](https://en.wikipedia.org/wiki/Katakana) from
their respective Wikipedia articles.

The quiz program does *not* use [spaced repetition](https://en.wikipedia.org/wiki/Spaced_repetition). It just uses
plain random numbers, which makes it as good as flash cards. Having hundreds of flash cards at a time is hard to
learn, though, so I (sort of arbitrarily) divided the cards into *lessons.* You can quiz yourself on any one lesson or
any combination of lessons.

My intention was to start with a single lesson, master it, then move to the next one, master that, then try both
together, and so forth.

I am only just starting to quiz myself so I don&rsquo;t even know if I will successfully learn this way... but I
figured it was worth a try.

This program requires a terminal with UTF-8 support so that you can actually *see* the kana. I have set up vncserver
in Amazon Linux 2, and the kana display just fine in the MATE terminal. (You will need to have the Japanese fonts
installed.) I have not tried this in Windows, but it *might* work in the more modern Windows terminal. It *does* work
to remote into a Linux system from Windows using [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/).

You use it like this:

```
gsi -:t8,f8
(load "quiz.scm")
(list-lessons) ; if you want to see them
(define b (make-bank 'katakana-1)) ; or pick the lessons you want
(randomize!)
(run-quiz b 4) ; 4 is the number of wrong answers per question
```

I hope this program is useful, but I offer no warranty.

Here are some notes on the program.

`with-add` calls a procedure `proc` with an `add!` function. The procedure can loop and traverse and do whatever, and
`add!` any items it chooses. When `proc` returns, the value it returns is discarded, but `with-add` returns the list
of all the items that `proc` added.  Later I started passing `add-list!` to the procedure as well, so that it can add
a list of items, all at once. I also started passing `items-so-far` so that the procedure could examine the list of
items it had added up to that point.

`for-each-lesson` calls a procedure `proc` for each defined lesson. `proc` is called as `(proc lesson-name
lesson-items)`.

`any` takes a `proc` and a list of `items` and returns `#t` if `proc` returns a true value for any of the `items`.

`make-bank` takes zero or more lesson names and returns a vector of question-answer pairs. (It is not really useful to
provide zero lesson names, but if you do, you will get an empty vector.)

`make-bank-except` takes zero or more lesson names and returns a question bank that uses all the lessons *except*
those named. If you provide zero lesson names, you will get all the questions for all the lessons.

`for` implements a simple &ldquo;for&rdquo; loop.

`lookup` takes a lesson name and a question or answer, and returns the corresponding answer or question, or `#f` if
the question or answer is not found, or `#t` if the lesson is not found. (The `#f` and `#t` return values are not
really useful.)

`indistinguishable-items` is a variable constructed with `lookup`. I noticed that some kana look the same, or almost
the same, and thought it would be &ldquo;unfair&rdquo; if one of them were the right answer and the other were
presented as a wrong answer, so I created this variable.

(Also, I wrote `lookup` because I myself can&rsquo;t type the kana, I have to paste them, and when they are
indistinguishable, it is hard to tell if I even pasted the correct one. So I look them up...)

`indistinguishable?` is a test to see if two symbols are indistinguishable. It uses `indistinguishable-items`. Also,
two symbols that are `equal?` are considered indistinguishable.

So this quiz program will never generate a question like this:

```
フ

   0) fu
   1) fu
```

This question might otherwise be generated if you combined `hiragana-3` and `katakana-3` in the same bank. One of the
`fu` answers corresponds to `フ` and is correct. But the quiz program draws the wrong answers from other questions in
the same bank. So the other `fu` corresponds to `ふ` and is incorrect &mdash; but there is no way for you to tell
which `fu` is which. So I wrote code to make sure that no wrong answer is presented if it is `indistinguishable?` from
the correct answer &mdash; or from any other wrong answer.  A check is also made to ensure that the *questions* are
distinguishable, so you will also never see:

```
fu

  0) フ
  1) ふ
```

I did go ahead and include `っ` and `つ` as indistinguishable, and `ッ` and `ツ`, even though they are different sizes
and so should be distinguishable after all. It&rsquo;s harder to see the size when the symbol is all by itself.

(Note that symbols that you *should* learn to distinguish, such as `シ` and `ツ`, and `ソ` and `ン`, should *not* be
marked as &ldquo;indistinguishable,&rdquo; otherwise, the quiz will never ask you to distinguish them.)

`make-distinct` creates a list of distinct items. The `init` argument can add any initial items.  `count` is an
integer indicating how many items to generate. `random-item` is a procedure which takes no arguments and returns a new
proposed item for the list. `eq?` tests whether two items are &ldquo;equal.&rdquo;

`shuffle!` randomly shuffles a vector.

`find-index` returns the index of the first item in the vector `vec` to cause `proc` to return a true value. If there
is no such item, `find-index` returns `#f`.

`make-question` makes a question, drawn from a given bank, and with a given number of wrong answers. I suppose this
function is a little inefficient, because it uses `shuffle!` to hide the right answer among the wrong answers, and
then uses `find-index` to find it again after shuffling. Really, the wrong answers are already in random order, so a
*full* shuffle is not necessary &mdash; and if the right answer is the only thing being moved, it should be much
easier to know where it has been moved to. But I was lazy. (I did think of writing some kind of &ldquo;tracking
shuffle&rdquo; so that you could track specific items in the shuffle and see where they had been moved to...)

`randomize!` randomizes the random number generator in Gambit.

`read-line-2` exists because, when you call `read` and read an item, any newline after the item is left in the input
stream. The regular `read-line` function will read an empty line in that case. I want the user to enter something, so
`read-line-2` reads a line and, if it is empty, reads *another* line. (Just once. It does not loop.)

`run-quiz` is of course the primary function of this program. Mostly it is concerned with printing and getting input.
(I had to use `(shell-command "clear")` to clear the screen. Using `display` with various escape codes didn&rsquo;t
seem to work. Using `clear` breaks compatibility with Windows, but I wonder if `(shell-command "cls")` would work...)

In the distant future, I intend to add support for [kanji](https://en.wikipedia.org/wiki/Kanji). But those will be
&ldquo;three-way&rdquo; questions &mdash; I will want the kanji, the pronunciation, and the meaning (in English).
This will not be hard to add, but I want to learn the kana first...
