(define (play_guess target attempts)
  (define (guess-game target attempts)
    (display "Guess a number from 1 to 100:")
    (newline)
    (let loop ((attempts-left attempts)
               (low 1)
               (high 100))
      (if (= attempts-left 0)
          (begin
            (display "Out of attempts. The correct number was ")
            (display target)
            (newline)
            (display "Please enter your name:")
            (newline)
            (let ((name (read-line)))
              (display "Good game, ")
              (display name)
              (newline)
              (newline)
              (play_guess (+ (random 99) 1) 1)))
          (begin
            (display "Enter guess ")
            (flush-output)
            (let ((guess (string->number (read-line))))
              (if (not (integer? guess))
                  (begin
                    (display "Invalid input. Please enter a valid number.")
                    (newline)
                    (loop attempts-left low high))
                  (if (= guess target)
                      (begin
                        (display "Correct! ")
                        (display attempts)
                        (display " guesses... Please enter your name:")
                        (newline)
                        (let ((name (read-line)))
                          (display "Good game, ")
                          (display name)
                          (newline)
                          (newline)
                          (play_guess (+ (random 99) 1) 1)))
                      (if (< guess target)
                          (begin
                            (display "Lower...")
                            (newline)
                            (loop (- attempts-left 1) guess high))
                          (begin
                            (display "Higher...")
                            (newline)
                            (loop (- attempts-left 1) low guess)))))))))))
  
  (guess-game target attempts))

(play_guess (+ (random 99) 1) 1)

