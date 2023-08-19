(defparameter sample "sample.txt")
(defparameter input "input.txt")

(defun read-file (filename)
  (with-open-file (stream filename)
    (loop :for line = (read-line stream nil)
	  :while line
	  :collect line)))

(defun part1 (filename)
  (let ((sum 0)
	(ret nil)
	(lines (read-file filename)))
    (loop :for elem :in lines
	  :do (if (string-equal "" elem)
		  (progn
		    (push sum ret)
		    (setf sum 0))
		  (incf sum (parse-integer elem))))
    (apply #'max ret)))

(defun part2 (filename)
  (let ((sum 0)
	(ret nil)
	(lines (read-file filename)))
    (loop :for elem :in lines
	  :do (if (string-equal "" elem)
		  (progn
		    (push sum ret)
		    (setf sum 0))
		  (incf sum (parse-integer elem))))
    (apply #'+ (subseq (sort ret #'>) 0 3))))

(progn
  (format t "Sample:~%part1:~A~%part2:~A~%"
	  (part1 sample) (part2 sample))
  (format t "Input:~%part1:~A~%part2:~A~%"
	  (part1 input) (part2 input)))

