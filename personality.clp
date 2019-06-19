;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Graphical version of PC Diagnostic Assistant from part 4 of 
;; "Jess in Action"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Import some commonly-used classes
(import javax.swing.*)
(import java.awt.*)
(import java.awt.event.*)

;; Don't clear defglobals on (reset)
(set-reset-globals FALSE)

(defglobal ?*crlf* = "
")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Question and answer templates

(deftemplate question
  (slot text)
  (multislot valid)
  (slot ident))

(deftemplate answer
  (slot ident)
  (slot text))

(do-backward-chaining answer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Module trigger

(defmodule trigger)

(defrule trigger::supply-answers
  (declare (auto-focus TRUE))
  (MAIN::need-answer (ident ?id))
  (not (MAIN::answer (ident ?id)))
  (not (MAIN::ask ?))
  =>
  (assert (MAIN::ask ?id))
  (return))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; personality rules

(defrule MAIN::check1
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù†Ø¹Ù…))
  (answer (ident two) (text Ù†Ø¹Ù…))
  (answer (ident three) (text Ù†Ø¹Ù…))
  (answer (ident six) (text Ù†Ø¹Ù…))
  (answer (ident nine) (text Ù†Ø¹Ù…))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ø¨Ø§Ø­Ø«Ù‡ Ø¹Ù† Ø§Ù„ÙƒÙ…Ø§Ù„")
  (halt))

(defrule MAIN::check2
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù†Ø¹Ù…))
  (answer (ident two) (text Ù†Ø¹Ù…))
  (answer (ident three) (text Ù†Ø¹Ù…))
  (answer (ident six) (text Ù†Ø¹Ù…))
  (answer (ident nine) (text Ù„Ø§))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ø§Ø¬ØªÙ…Ø§Ø¹ÙŠÙ‡")
  (halt))

(defrule MAIN::check3
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù†Ø¹Ù…))
  (answer (ident two) (text Ù†Ø¹Ù…))
  (answer (ident three) (text Ù†Ø¹Ù…))
  (answer (ident six) (text Ù„Ø§))
  (answer (ident four) (text Ù†Ø¹Ù…))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ù‡Ø§Ø¯Ø¦Ù‡")
  (halt))

(defrule MAIN::check4
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù†Ø¹Ù…))
  (answer (ident two) (text Ù†Ø¹Ù…))
  (answer (ident three) (text Ù†Ø¹Ù…))
  (answer (ident six) (text Ù„Ø§))
  (answer (ident four) (text Ù„Ø§))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ù‚ÙŠØ§Ø¯ÙŠÙ‡")
  (halt))

(defrule MAIN::check5
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù†Ø¹Ù…))
  (answer (ident two) (text Ù†Ø¹Ù…))
  (answer (ident three) (text Ù„Ø§))
  (answer (ident four) (text Ù†Ø¹Ù…))
  (answer (ident ten) (text Ù†Ø¹Ù…))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ù‡Ø§Ø¯Ø¦Ù‡")
  (halt))

(defrule MAIN::check6
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù†Ø¹Ù…))
  (answer (ident two) (text Ù†Ø¹Ù…))
  (answer (ident three) (text Ù„Ø§))
  (answer (ident four) (text Ù†Ø¹Ù…))
  (answer (ident ten) (text Ù„Ø§))
  (answer (ident nine) (text Ù†Ø¹Ù…))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ø¨Ø§Ø­Ø«Ù‡ Ø¹Ù† Ø§Ù„ÙƒÙ…Ø§Ù„")
  (halt))

(defrule MAIN::check7
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù†Ø¹Ù…))
  (answer (ident two) (text Ù†Ø¹Ù…))
  (answer (ident three) (text Ù„Ø§))
  (answer (ident four) (text Ù†Ø¹Ù…))
  (answer (ident ten) (text Ù„Ø§))
  (answer (ident nine) (text Ù„Ø§))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ù‚ÙŠØ§Ø¯ÙŠÙ‡")
  (halt))

(defrule MAIN::check8
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù†Ø¹Ù…))
  (answer (ident two) (text Ù†Ø¹Ù…))
  (answer (ident three) (text Ù„Ø§))
  (answer (ident four) (text Ù„Ø§))
  (answer (ident eleven) (text Ù†Ø¹Ù…))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ø¨Ø§Ø­Ø«Ù‡ Ø¹Ù† Ø§Ù„ÙƒÙ…Ø§Ù„")
  (halt))

(defrule MAIN::check9
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù†Ø¹Ù…))
  (answer (ident two) (text Ù†Ø¹Ù…))
  (answer (ident three) (text Ù„Ø§))
  (answer (ident four) (text Ù„Ø§))
  (answer (ident eleven) (text Ù„Ø§))
  (answer (ident twelve) (text Ù†Ø¹Ù…))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ù‚ÙŠØ§Ø¯ÙŠÙ‡")
  (halt))

(defrule MAIN::check10
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù†Ø¹Ù…))
  (answer (ident two) (text Ù†Ø¹Ù…))
  (answer (ident three) (text Ù„Ø§))
  (answer (ident four) (text Ù„Ø§))
  (answer (ident eleven) (text Ù„Ø§))
  (answer (ident twelve) (text Ù„Ø§))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ø¨Ø§Ø­Ø«Ù‡ Ø¹Ù† Ø§Ù„ÙƒÙ…Ø§Ù„")
  (halt))

(defrule MAIN::check11
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù†Ø¹Ù…))
  (answer (ident two) (text Ù„Ø§))
  (answer (ident four) (text Ù†Ø¹Ù…))
  (answer (ident five) (text Ù†Ø¹Ù…))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ù‡Ø§Ø¯Ø¦Ù‡")
  (halt))

(defrule MAIN::check12
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù†Ø¹Ù…))
  (answer (ident two) (text Ù„Ø§))
  (answer (ident four) (text Ù†Ø¹Ù…))
  (answer (ident five) (text Ù„Ø§))
  (answer (ident eight) (text Ù†Ø¹Ù…))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ø¨Ø§Ø­Ø«Ù‡ Ø¹Ù† Ø§Ù„ÙƒÙ…Ø§Ù„")
  (halt))

(defrule MAIN::check13
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù†Ø¹Ù…))
  (answer (ident two) (text Ù„Ø§))
  (answer (ident four) (text Ù†Ø¹Ù…))
  (answer (ident five) (text Ù„Ø§))
  (answer (ident eight) (text Ù„Ø§))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ø§Ø¬ØªÙ…Ø§Ø¹ÙŠÙ‡")
  (halt))

(defrule MAIN::check14
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù†Ø¹Ù…))
  (answer (ident two) (text Ù„Ø§))
  (answer (ident four) (text Ù„Ø§))
  (answer (ident three) (text Ù†Ø¹Ù…))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ù‚ÙŠØ§Ø¯ÙŠÙ‡")
  (halt))

(defrule MAIN::check15
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù†Ø¹Ù…))
  (answer (ident two) (text Ù„Ø§))
  (answer (ident four) (text Ù„Ø§))
  (answer (ident three) (text Ù„Ø§))
  (answer (ident seven) (text Ù†Ø¹Ù…))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ø¨Ø§Ø­Ø«Ù‡ Ø¹Ù† Ø§Ù„ÙƒÙ…Ø§Ù„")
  (halt))

(defrule MAIN::check16
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù†Ø¹Ù…))
  (answer (ident two) (text Ù„Ø§))
  (answer (ident four) (text Ù„Ø§))
  (answer (ident three) (text Ù„Ø§))
  (answer (ident seven) (text Ù„Ø§))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ø§Ø¬ØªÙ…Ø§Ø¹ÙŠÙ‡")
  (halt))

(defrule MAIN::check17
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù„Ø§))
  (answer (ident two) (text Ù†Ø¹Ù…))
  (answer (ident three) (text Ù†Ø¹Ù…))
  (answer (ident six) (text Ù†Ø¹Ù…))
  (answer (ident nine) (text Ù†Ø¹Ù…))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ø¨Ø§Ø­Ø«Ù‡ Ø¹Ù† Ø§Ù„ÙƒÙ…Ø§Ù„")
  (halt))

(defrule MAIN::check18
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù„Ø§))
  (answer (ident two) (text Ù†Ø¹Ù…))
  (answer (ident three) (text Ù†Ø¹Ù…))
  (answer (ident six) (text Ù†Ø¹Ù…))
  (answer (ident nine) (text Ù„Ø§))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ø§Ø¬ØªÙ…Ø§Ø¹ÙŠÙ‡")
  (halt))

(defrule MAIN::check19
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù„Ø§))
  (answer (ident two) (text Ù†Ø¹Ù…))
  (answer (ident three) (text Ù†Ø¹Ù…))
  (answer (ident six) (text Ù„Ø§))
  (answer (ident four) (text Ù†Ø¹Ù…))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ù‡Ø§Ø¯Ø¦Ù‡")
  (halt))

(defrule MAIN::check20
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù„Ø§))
  (answer (ident two) (text Ù†Ø¹Ù…))
  (answer (ident three) (text Ù†Ø¹Ù…))
  (answer (ident six) (text Ù„Ø§))
  (answer (ident four) (text Ù„Ø§))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ù‚ÙŠØ§Ø¯ÙŠÙ‡")
  (halt))



(defrule MAIN::check21
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù„Ø§))
  (answer (ident two) (text Ù†Ø¹Ù…))
  (answer (ident three) (text Ù„Ø§))
  (answer (ident four) (text Ù†Ø¹Ù…))
  (answer (ident ten) (text Ù†Ø¹Ù…))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ù‡Ø§Ø¯Ø¦Ù‡")
  (halt))


(defrule MAIN::check22
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù„Ø§))
  (answer (ident two) (text Ù†Ø¹Ù…))
  (answer (ident three) (text Ù„Ø§))
  (answer (ident four) (text Ù†Ø¹Ù…))
  (answer (ident ten) (text Ù„Ø§))
  (answer (ident nine) (text Ù†Ø¹Ù…))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ø¨Ø§Ø­Ø«Ù‡ Ø¹Ù† Ø§Ù„ÙƒÙ…Ø§Ù„")
  (halt))



(defrule MAIN::check23
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù„Ø§))
  (answer (ident two) (text Ù†Ø¹Ù…))
  (answer (ident three) (text Ù„Ø§))
  (answer (ident four) (text Ù†Ø¹Ù…))
  (answer (ident ten) (text Ù„Ø§))
  (answer (ident nine) (text Ù„Ø§))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ù‚ÙŠØ§Ø¯ÙŠÙ‡")
  (halt))

       
(defrule MAIN::check24
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù„Ø§))
  (answer (ident two) (text Ù†Ø¹Ù…))
  (answer (ident three) (text Ù„Ø§))
  (answer (ident four) (text Ù„Ø§))
  (answer (ident eleven) (text Ù†Ø¹Ù…))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ø¨Ø§Ø­Ø«Ù‡ Ø¹Ù† Ø§Ù„ÙƒÙ…Ø§Ù„")
  (halt))


(defrule MAIN::check25
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù„Ø§))
  (answer (ident two) (text Ù†Ø¹Ù…))
  (answer (ident three) (text Ù„Ø§))
  (answer (ident four) (text Ù„Ø§))
  (answer (ident eleven) (text Ù„Ø§))
  (answer (ident twelve) (text Ù†Ø¹Ù…))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ù‚ÙŠØ§Ø¯ÙŠÙ‡")
  (halt))


(defrule MAIN::check26
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù„Ø§))
  (answer (ident two) (text Ù†Ø¹Ù…))
  (answer (ident three) (text Ù„Ø§))
  (answer (ident four) (text Ù„Ø§))
  (answer (ident eleven) (text Ù„Ø§))
  (answer (ident twelve) (text Ù„Ø§))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ø¨Ø§Ø­Ø«Ù‡ Ø¹Ù† Ø§Ù„ÙƒÙ…Ø§Ù„")
  (halt))

   

(defrule MAIN::check27
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù„Ø§))
  (answer (ident two) (text Ù„Ø§))
  (answer (ident four) (text Ù†Ø¹Ù…))
  (answer (ident five) (text Ù†Ø¹Ù…))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ù‡Ø§Ø¯Ø¦Ù‡")
  (halt))


(defrule MAIN::check28
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù„Ø§))
  (answer (ident two) (text Ù„Ø§))
  (answer (ident four) (text Ù†Ø¹Ù…))
  (answer (ident five) (text Ù„Ø§))
  (answer (ident eight) (text Ù†Ø¹Ù…))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ø¨Ø§Ø­Ø«Ù‡ Ø¹Ù† Ø§Ù„ÙƒÙ…Ø§Ù„")
  (halt))


(defrule MAIN::check29
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù„Ø§))
  (answer (ident two) (text Ù„Ø§))
  (answer (ident four) (text Ù†Ø¹Ù…))
  (answer (ident five) (text Ù„Ø§))
  (answer (ident eight) (text Ù„Ø§))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ø§Ø¬ØªÙ…Ø§Ø¹ÙŠÙ‡")
  (halt))


(defrule MAIN::check30
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù„Ø§))
  (answer (ident two) (text Ù„Ø§))
  (answer (ident four) (text Ù„Ø§))
  (answer (ident three) (text Ù†Ø¹Ù…))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ù‚ÙŠØ§Ø¯ÙŠÙ‡")
  (halt))

(defrule MAIN::check31
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù„Ø§))
  (answer (ident two) (text Ù„Ø§))
  (answer (ident four) (text Ù„Ø§))
  (answer (ident three) (text Ù„Ø§))
  (answer (ident seven) (text Ù†Ø¹Ù…))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ø¨Ø§Ø­Ø«Ù‡ Ø¹Ù† Ø§Ù„ÙƒÙ…Ø§Ù„")
  (halt))


(defrule MAIN::check32
  (declare (auto-focus TRUE))
  (answer (ident one) (text Ù„Ø§))
  (answer (ident two) (text Ù„Ø§))
  (answer (ident four) (text Ù„Ø§))
  (answer (ident three) (text Ù„Ø§))
  (answer (ident seven) (text Ù„Ø§))
  =>
  (result "Ø´Ø®ØµÙŠÙ‡ Ø§Ø¬ØªÙ…Ø§Ø¹ÙŠÙ‡")
  (halt))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Results output

(deffunction result (?action)
  "Give final instructions to the user"
  (call JOptionPane showMessageDialog ?*frame*
        (str-cat "Ø§Ø¹ØªÙ‚Ø¯ Ø§Ù† Ø´Ø®ØµÙŠØªÙƒ  " ?action)
        "Recommendation"
        (get-member JOptionPane INFORMATION_MESSAGE)))
  
(defadvice before halt (?*qfield* setText "Ø§ØºÙ„Ù‚ Ø§Ù„Ù†Ø§Ù�Ø°Ù‡......"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Module ask

(defmodule ask)

(deffunction ask-user (?question ?valid)
  "Set up the GUI to ask a question"
  (?*qfield* setText ?question)
  (?*apanel* removeAll)
  
    (?*apanel* add ?*acombo*)
    (?*apanel* add ?*acombo-ok*)
    (?*acombo* removeAllItems)
    (foreach ?item ?valid
             (?*acombo* addItem ?item))
    
  (?*apanel* validate)
  (?*apanel* repaint))


(defrule ask::ask-question-by-id
  "Given the identifier of a question, ask it"
  (declare (auto-focus TRUE))
  (MAIN::question (ident ?id) (text ?text) (valid $?valid))
  (not (MAIN::answer (ident ?id)))
  (MAIN::ask ?id)
  =>
  (ask-user ?text ?valid)
  ((engine) waitForActivations))

(defrule ask::collect-user-input
  "Check an answer returned from the GUI, and optionally return it"
  (declare (auto-focus TRUE))
  (MAIN::question (ident ?id) (text ?text) (valid $?valid))
  (not (MAIN::answer (ident ?id)))
  ?user <- (user-input ?input)
  ?ask <- (MAIN::ask ?id)
  =>
    (retract ?ask ?user)
    (assert (MAIN::answer (ident ?id) (text ?input)))
    (return)
    )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Main window
(defglobal ?*frame* = (new JFrame "Ø§Ø¹Ø±Ù‚ Ø´Ø®ØµÙŠØªÙƒ "))
(?*frame* setDefaultCloseOperation (get-member JFrame EXIT_ON_CLOSE))
(?*frame* setSize 300 200)
(?*frame* setVisible TRUE)
(?*frame* setLocation 550 230)

;; Question field
(defglobal ?*qfield* = (new JTextArea 5 40))
((?*frame* getContentPane) add ?*qfield*)
(?*qfield* setText "Ø§Ù†ØªØ¸Ø± Ù…Ù† Ù�Ø¶Ù„Ùƒ...")

;; Answer area
(defglobal ?*apanel* = (new JPanel))

(defglobal ?*acombo* = (new JComboBox (create$ "Ù†Ø¹Ù…" "Ù„Ø§")))
(defglobal ?*acombo-ok* = (new JButton OK))

(?*apanel* add ?*acombo*)
(?*apanel* add ?*acombo-ok*)
((?*frame* getContentPane) add ?*apanel* (get-member BorderLayout SOUTH))
(?*frame* validate)
(?*frame* repaint)

(deffunction combo-input (?EVENT)
  "An event handler for the combo box"
  (assert (ask::user-input (sym-cat (?*acombo* getSelectedItem)))))

(bind ?handler (new jess.awt.ActionListener combo-input (engine)))
(?*acombo-ok* addActionListener ?handler)

(deffacts MAIN::question-data
  (question (ident one) (valid Ù†Ø¹Ù… Ù„Ø§)
            (text "Ù‡Ù„ ØªÙ†Ø³Ø¬Ù… Ù…Ø¹ Ø¬Ù…ÙŠØ¹ Ø§Ù„Ø´Ø®ØµÙŠØ§Øª "))
  (question (ident two) (valid Ù†Ø¹Ù… Ù„Ø§)
            (text "Ù‡Ù„ Ø§Ù†Øª ÙƒØ«ÙŠØ± Ø§Ù„Ø§ØµØ¯Ù‚Ø§Ø¡"))
  (question (ident three) (valid Ù†Ø¹Ù… Ù„Ø§)
            (text "Ù‡Ù„ Ø§Ù†Øª Ù‚ÙˆÙ‰ Ø§Ù„Ø¹Ø²ÙŠÙ…Ù‡"))
  (question (ident four) (valid Ù†Ø¹Ù… Ù„Ø§)
            (text "Ù‡Ù„ Ø§Ù†Øª Ù‡Ø§Ø¯Ø¦ Ø§Ù„Ø·Ø¨Ø¹ "))
  (question (ident five) (valid Ù†Ø¹Ù… Ù„Ø§)
            (text "Ù‡Ù„ Ø§Ù†Øª Ø§Ù…ÙŠÙ† ÙˆØµØ§Ø¯Ù‚"))
  (question (ident six) (valid Ù†Ø¹Ù… Ù„Ø§)
            (text "Ù‡Ù„ Ø§Ù†Øª Ù„Ø¯ÙŠÙƒ Ø§Ù„Ù‚Ø¯Ø±Ù‡ Ø¹Ù„ ØªØ­Ù„ÙŠÙ„ Ø§Ù„Ø§Ù…ÙˆØ±"))
  (question (ident seven) (valid Ù†Ø¹Ù… Ù„Ø§)
            (text "Ù‡Ù„ Ø§Ù†Øª Ù„Ùƒ Ø´ÙƒÙ„ Ø®Ø§Øµ Ù� Ø§Ù„ØªÙ�ÙƒÙŠØ±"))
  (question (ident eight) (valid Ù†Ø¹Ù… Ù„Ø§)
            (text "Ù‡Ù„ ØªØ­Ø¨ Ø§Ù„Ù�Ù†ÙˆÙ† Ø§Ù„Ø¬Ù…ÙŠÙ„Ù‡"))
  (question (ident nine) (valid Ù†Ø¹Ù… Ù„Ø§)
            (text "Ù‡Ù„ Ø§Ù†Øª ØªØ­Ø¨ Ø§Ù„Ø¹Ø²Ù„Ù‡"))
  (question (ident ten) (valid Ù†Ø¹Ù… Ù„Ø§)
            (text "Ù‡Ù„ Ø§Ù†Øª ØªØ´Ø¹Ø± Ø¨Ø§Ù„ÙƒØ³Ù„"))
  (question (ident eleven) (valid Ù†Ø¹Ù… Ù„Ø§)
            (text "Ù‡Ù„ Ø§Ù†Øª Ù‚Ø§Ø¯Ø± Ø§Ø°Ø§ Ø·Ù„Ø¨ Ù…Ù†Ùƒ Ø¹Ù…Ù„ Ø§Ù† ØªØªÙ…Ù‡"))
  (question (ident twelve) (valid Ù†Ø¹Ù… Ù„Ø§)
            (text "Ù‡Ù„ Ø§Ù†Øª Ù‚ÙˆÙ‰ Ø§Ù„Ø§Ø±Ø§Ø¯Ù‡ ÙˆØªØ§Ø®Ø° Ø§Ù„Ù‚Ø±Ø§Ø± Ø¯ÙˆÙ† ØªØ±Ø¯Ø¯"))
  (ask one))

  
(reset)
(run-until-halt)

