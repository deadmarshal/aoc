#!/usr/bin/env sbcl --script

(ql:quickload :alexandria)

(defun read-file (filename)
  (with-open-file (stream filename)
    (loop :for line = (read-line stream nil)
	  :while line
	  :collect line)))

(defun part1 (filename)
  (let ((ht (alexandria:alist-hash-table '(("A X" . 4)
					   ("A Y" . 8)
					   ("A Z" . 3)
					   ("B X" . 1)
					   ("B Y" . 5)
					   ("B Z" . 9)
					   ("C X" . 7)
					   ("C Y" . 2)
					   ("C Z" . 6))))
	(lines (read-file filename))
	(score 0))
    (loop :for line :in lines
	  :do (incf score (gethash line ht)))
    score))

(defun part2 ()
  )

