from __future__ import print_function
from pyswip import Prolog, Functor, Variable, Query, call
from tkinter import *
from textwrap import wrap

file_path = u"D:/7/aky_lite_2.pl"
questions = [
    "У вашего персонажа есть скиллы-модификаторы атаки(автоприменяемые)?",
    "Ваш персонаж может уходить в невидимость?",
    "У вашего персонажа есть пассивные способности(полу-активные тоже считаются)?",
    "У вашего персонажа есть способности с оглушением/оцепенением/страхом?",
    "У вашего персонажа есть замедляющие способности?",
    "У вашего персонажа есть способности с безмолвием?",
    "Ваш персонаж может вызывать подконтрольные юниты/иллюзии",
    "Ваш персонаж может наносить урон по области?",
    "Ваш персонаж обладает способностями на мобильность (телепортация, блинки)",
    "Ваш персонаж дальнего боя?",
    "Ваш персонаж может лечить союзников?",
    "Ваш персонаж имеет способность, усиливающую его или союзников "
    "(скиллы, которые имеют другие механики помимо бафа не считаются)?",
    "Ваш персонаж может влиять на ландшафт карты(ломать деревья, создавать преграды)?"
]
answers = [0, 0, 0, 0,
           0, 0, 0, 0,
           0, 0, 0, 0, 0]


current_question = 0


def check_prolog_knowledge_base():
    global answers
    consult = Functor("consult", 1)
    call(consult(file_path))
    prolog = Prolog()
    arr = list(prolog.query("run({}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, X)".format(*answers)))
    if len(arr) > 0:
        v = arr[0]['X']
        return True, v
    else:
        v = "Такого героя нет. Добавьте его."
        return False, v


def append_prolog_knowledge_base():
    global answers, hero_name
    prolog = Prolog()
    answ = hero_name.get()
    print(answ)
    print(answers)
    query_str = "add_hero({}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, \"{}\", Res)".format(*answers, answ)
    prolog.query(query_str)
    arr = list(prolog.query(query_str))
    print(arr)


def set_label_width(cur_question):
    global questions, question_label
    text_width = len(questions[cur_question])
    width = question_label.winfo_width()
    n = 800
    if width > n:
        char_width = width / text_width
        wrapped_text = '\n'.join(wrap(questions[cur_question], int(n / char_width)))
        question_label['text'] = wrapped_text


def window_init():
    global window_buttons, window
    window_buttons['right-arrow'].grid(row=2, column=2, sticky=E)
    window_buttons['left-arrow'].grid(row=2, column=0, sticky=W)
    window_buttons['left-arrow']['state'] = 'disabled'
    window_buttons['radio-alt1'].grid(row=1, column=1)
    window_buttons['radio-alt2'].grid(row=2, column=1)
    question_label.grid(row=0, column=0, columnspan=1)


def swipe_right():
    global current_question, window_buttons, current_choice, question_label
    if current_question < 12:
        answers[current_question] = current_choice.get()
        if current_question == 11:
            window_buttons['right-arrow'].grid_remove()
            window_buttons['confirm-btn'].grid(row=2, column=2, sticky=E)
        current_question += 1
        question_label['text'] = questions[current_question]
        set_label_width(current_question)
        if window_buttons['left-arrow']['state'] == 'disabled':
            window_buttons['left-arrow']['state'] = 'active'


def swipe_left():
    global current_question, window_buttons
    if current_question > 0:
        if current_question == 1:
            window_buttons['left-arrow']['state'] = 'disabled'
        current_question -= 1
        question_label['text'] = questions[current_question]
        set_label_width(current_question)
        if not(bool(window_buttons['right-arrow'].grid_info())):
            window_buttons['confirm-btn'].grid_remove()
            window_buttons['right-arrow'].grid(row=2, column=2, sticky=E)


def confirm_answers():
    global answers, current_choice, window_buttons
    answers[current_question] = current_choice.get()
    window_buttons['left-arrow'].grid_remove()
    window_buttons['radio-alt1'].grid_remove()
    window_buttons['radio-alt2'].grid_remove()
    window_buttons['confirm-btn'].grid_remove()
    question_label.grid_remove()

    check_base = check_prolog_knowledge_base()
    answer_label['text'] = check_base[1]
    answer_label.grid(row=0, column=0)
    if check_base[0]:
        window_buttons['again-btn'].grid(row=2, column=1)
    else:
        hero_entry.grid(row=1, column=0)
        window_buttons['add-btn'].grid(row=2, column=1)


def play_again():
    global window_buttons, current_question, answer_label
    current_question = 0
    answer_label.grid_remove()
    window_init()
    question_label['text'] = questions[0]
    window_buttons['again-btn'].grid_remove()


def add_new_hero():
    global window_buttons, current_question, answer_label
    append_prolog_knowledge_base()
    current_question = 0
    answer_label.grid_remove()
    window_init()
    question_label['text'] = questions[0]
    hero_entry.grid_remove()
    window_buttons['add-btn'].grid_remove()


window = Tk()
window.title("Akinator po pomoyke")
window.option_add("*Font", "ubuntu 14")
current_choice = IntVar()
current_choice.set(0)
hero_name = StringVar()
window_buttons = {
    'right-arrow': Button(window, text='---->', command=swipe_right),
    'left-arrow': Button(window, text='<----', command=swipe_left),
    'radio-alt1': Radiobutton(window, text='Нет', variable=current_choice, value=0),
    'radio-alt2': Radiobutton(window, text='Да', variable=current_choice, value=1),
    'confirm-btn': Button(window, text='Принять', command=confirm_answers),
    'again-btn': Button(window, text='Играть снова', command=play_again),
    'add-btn': Button(window, text='Добавить', command=add_new_hero)
}
question_label = Label(window, text=questions[0], width=100, height=10)
answer_label = Label(window, width=100, height=10)
hero_entry = Entry(window, textvariable=hero_name)
window_init()
window.mainloop()
