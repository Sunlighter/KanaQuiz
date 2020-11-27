# Hiragana / Katakana Quiz Program in Gambit Scheme

This is a simple quiz program I wrote in Gambit Scheme.

I hope this program is useful, but I offer no warranty.

Some parts of this code can quiz on *any* subject, but I wrote it to quiz myself on Japanese, starting with the kana,
and the code is becoming more adapted to that purpose. I got the [hiragana](https://en.wikipedia.org/wiki/Hiragana)
and [katakana](https://en.wikipedia.org/wiki/Katakana) from their respective Wikipedia articles.

The quiz program does *not* use [spaced repetition](https://en.wikipedia.org/wiki/Spaced_repetition). It just uses
plain random numbers, which makes it as good as flash cards. Having hundreds of flash cards at a time is hard to
learn, though, so I (sort of arbitrarily) divided the cards into *lessons.* You can quiz yourself on any one lesson or
any combination of lessons.

My intention was to start with a single lesson, master it, then move to the next one, master that, then try both
together, and so forth.

I did successfully learn the kana this way &mdash; go, me! &mdash; so I figure it is worth continuing, but I had to do
a big refactoring in order to support vocabulary including kanji.

Right now I am actually keeping a non-public fork where I enter vocabulary from the second-edition *Genki* books. I
don&rsquo;t think I can publish that fork because of copyright, but I can publish the quiz program without the
vocabulary lists. The third edition of the Genki books is out now, anyway, so you might want to enter your own
vocabulary, to match the books you are learning from.

I am using the Windows Japanese IME and Windows Notepad to enter kana and kanji into the source code. Then I push from
Windows, pull to Linux, and use Linux to run the quiz. I have not been able to get a Japanese IME to work in Linux,
but I think part of the problem is that I am using VNC, and the special keystrokes to turn the IME on and off are
probably being intercepted by my local system.

This program requires a terminal with UTF-8 support so that you can actually *see* the kana and kanji. I have set up
vncserver in Amazon Linux 2, and everything displays just fine in the MATE terminal. (You will need to have the
Japanese fonts installed.) I have not tried this in Windows, but it *might* work in the more modern Windows
terminal. It *does* work to remote into a Linux system from Windows using
[PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/).  It helps to set a large font size.

For a while, there were *two* quiz programs in the source code, but now I&rsquo;m back to only one.

You use the quiz like this:

```
gsi -:t8,f8
(load "quiz.scm")
(list-lessons) ; if you want to see them
(define b (make-bank '(starts-with katakana) #f)) ; or pick the lessons you want
(run-quiz b 4) ; 4 is the number of wrong answers per question
```

Here are some notes on the program.

`lessons` is a variable containing all the data for the program. An `add-lesson!` function has been defined for
convenience; this simply adds a new lesson to `lessons` and probably will only be used inside the source code. A
lesson is a list of questions. Each question is a vector, and the first element in the vector is the question&rsquo;s
type. The length of the vector is also part of the question&rsquo;s type.  The rest of the vector consists of things
that you want to learn to associate with each other.

Right now I&rsquo;ve defined the following question types:

* `d` indicating a kana with a dakuten.
* `h` indicating a kana with a handakuten.
* `n` indicating a kana with neither.
* `d2` indicating a digraph with a dakuten.
* `h2` indicating a digraph with a handakuten.
* `n2` indicating a digraph with neither.
* I use `*` to indicate a vocabulary question, but none of these appear in the code.

You don&rsquo;t have to do anything special to &ldquo;define&rdquo; a question type. Just start using a new type
(which can be any Scheme symbol). The quiz program will only draw wrong answers from questions of the same type;
that&rsquo;s generally what the type is for.

A kanji question might look like this:

```
#(* "七時" "しちじ" "seven o'clock")
```

That&rsquo;s just a vocabulary question. It is also possible to set up questions to help you learn on-yomi and
kun-yomi, but that would probably be a different question type.

To run a quiz, first you create a *bank* from one or more lessons. You do this with the `make-bank` function.
`make-bank` takes two *rules* which are used to filter lessons, and returns a question bank, which should be stored in
a variable. The first rule indicates which lessons to include in the quiz. The second rule indicates additional
lessons which can be used to supply additional wrong answers. If a lesson is accepted by the first rule, it will not
be offered to the second rule.

The syntax of a rule is like this:

* `#t` includes all lessons.
* `#f` does not include any lessons.
* If you pass a Scheme procedure, it is expected to take two arguments, a lesson name and a question type, and to
return `#t` if it matches the rule or `#f` if it does not.
* `(lesson-name . `*rule*`)` indicates that its sub-rule should be applied against the lesson name. This is the default.
The sub-rule is the tail of the list, not a separate list, so it is possible to write something like
`(lesson-name starts-with katakana)`.
* `(question-type . `*rule*`)` indicates that its sub-rule should be applied against the question type. So for example you
can write `(question-type is n)` and get only kana (and not digraphs) without dakuten or handakuten.
* `(is `*name*` `...`)` includes values which match any of the given *name* items *exactly.*
* `(starts-with `*prefix*` `...`)` includes values which start with any of the given *prefix* items.
* `(ends-with `*suffix*` `...`)` includes values which end with any of the given *suffix* items.
* `(contains `*infix*` `...`)` includes values which contain any of the given *infix* items.
* `(includes `*infix*` `...`)` is the same as `contains`.
* `(or `*rule*` `...`)` takes a list of sub-rules and matches if any of the sub-rules match.
* `(and `*rule*` `...`)` takes a list of sub-rules and matches only if all of the sub-rules match.
* `(not . `*rule*`)` takes one sub-rule (the tail of the list) and matches only if the sub-rule does not,
so you can write something like `(not ends-with 4)`.

These rules use the `stringify` function to turn everything into strings. So you can say `(ends-with 3)` and it
matches `hiragana-3` and `katakana-3`.

Once you have the bank, you can pass it to `run-quiz` along with the desired number of wrong answers per question.

Each time the quiz asks you a question, it randomly picks one of the questions from the bank. It picks a random column
out of the question which it will ask you for, and it picks another random column that it will expect from you. It
then makes a multiple-choice question with the right answer as a choice, and with wrong answers drawn from the same
column of other questions of the same type.

It checks to make sure the question is fair, in the sense that it will not offer a wrong answer if it is
indistinguishable from the right answer or if its question is indistinguishable from the question it is asking
you. For this, it uses the `indistinguishable?` function, which does use `equal?` but also includes some symbols which
are hard to distinguish, such as `っ` and `つ`, and `ッ` and `ツ` (because of font size), and hiragana `へ` and
katakana `ヘ`. (This function can be extended if necessary. Note, however, that symbols that you *should* learn to
distinguish, such as `シ` and `ツ`, and `ソ` and `ン`, should *not* be marked as &ldquo;indistinguishable,&rdquo;
otherwise, the quiz will never ask you to distinguish them.)

One of the results of the `indistinguishable?` function is that, if something has two pronunciations, like なな and
しち, you can make a separate question for each pronunciation, and the program will quiz you on both of them without
ever forcing you to choose between two correct answers.
