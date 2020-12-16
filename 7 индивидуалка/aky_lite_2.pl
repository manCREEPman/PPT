read_str(A):-get0(X),r_str(X,A,[]).
r_str(10,A,A):-!.
r_str(X,A,B):-append(B,[X],B1),get0(X1),r_str(X1,A,B1).


:- dynamic q1/2.
:- dynamic q2/2.
:- dynamic q3/2.
:- dynamic q4/2.
:- dynamic q5/2.
:- dynamic q6/2.
:- dynamic q7/2.
:- dynamic q8/2.
:- dynamic q9/2.
:- dynamic q10/2.
:- dynamic q11/2.
:- dynamic q12/2.
:- dynamic q13/2.

predicates_dir(Path):- Path = 'D:/������/������/����������������/Prolog/������������/7 ������������/predicates/'.


write_q1(X, Y):-
	repeat,
    (q1(X,Y) -> (
         nl,
         write(X),
         nl,
         write(Y),
         write("."),
         retract(q1(X,Y)));
    X=nil,
    Y=nil).

write_q2(X, Y):-
	repeat,
    (q2(X,Y) -> (
         nl,
         write(X),
         nl,
         write(Y),
         write("."),
         retract(q2(X,Y)));
    X=nil,
    Y=nil).

write_q3(X, Y):-
	repeat,
    (q3(X,Y) -> (
         nl,
         write(X),
         nl,
         write(Y),
         write("."),
         retract(q3(X,Y)));
    X=nil,
    Y=nil).

write_q4(X, Y):-
	repeat,
    (q4(X,Y) -> (
         nl,
         write(X),
         nl,
         write(Y),
         write("."),
         retract(q4(X,Y)));
    X=nil,
    Y=nil).

write_q4(X, Y):-
	repeat,
    (q4(X,Y) -> (
         nl,
         write(X),
         nl,
         write(Y),
         write("."),
         retract(q4(X,Y)));
    X=nil,
    Y=nil).

write_q5(X, Y):-
	repeat,
    (q5(X,Y) -> (
         nl,
         write(X),
         nl,
         write(Y),
         write("."),
         retract(q5(X,Y)));
    X=nil,
    Y=nil).

write_q6(X, Y):-
	repeat,
    (q6(X,Y) -> (
         nl,
         write(X),
         nl,
         write(Y),
         write("."),
         retract(q6(X,Y)));
    X=nil,
    Y=nil).

write_q7(X, Y):-
	repeat,
    (q7(X,Y) -> (
         nl,
         write(X),
         nl,
         write(Y),
         write("."),
         retract(q7(X,Y)));
    X=nil,
    Y=nil).

write_q8(X, Y):-
	repeat,
    (q8(X,Y) -> (
         nl,
         write(X),
         nl,
         write(Y),
         write("."),
         retract(q8(X,Y)));
    X=nil,
    Y=nil).

write_q9(X, Y):-
	repeat,
    (q9(X,Y) -> (
         nl,
         write(X),
         nl,
         write(Y),
         write("."),
         retract(q9(X,Y)));
    X=nil,
    Y=nil).

write_q10(X, Y):-
	repeat,
    (q10(X,Y) -> (
         nl,
         write(X),
         nl,
         write(Y),
         write("."),
         retract(q10(X,Y)));
    X=nil,
    Y=nil).

write_q11(X, Y):-
	repeat,
    (q11(X,Y) -> (
         nl,
         write(X),
         nl,
         write(Y),
         write("."),
         retract(q11(X,Y)));
    X=nil,
    Y=nil).

write_q12(X, Y):-
	repeat,
    (q12(X,Y) -> (
         nl,
         write(X),
         nl,
         write(Y),
         write("."),
         retract(q12(X,Y)));
    X=nil,
    Y=nil).

write_q13(X, Y):-
	repeat,
    (q13(X,Y) -> (
         nl,
         write(X),
         nl,
         write(Y),
         write("."),
         retract(q13(X,Y)));
    X=nil,
    Y=nil).

save_q1:-
    predicates_dir(Path),
    atom_concat(Path, q1, FPath),
    atom_concat(FPath, '.txt', FileQuestionPath),
    tell(FileQuestionPath),
    write_q1(X, _),
    X = nil,
    told.

save_q2:-
    predicates_dir(Path),
    atom_concat(Path, q2, FPath),
    atom_concat(FPath, '.txt', FileQuestionPath),
    tell(FileQuestionPath),
    write_q2(X, _),
    X = nil,
    told.

save_q3:-
    predicates_dir(Path),
    atom_concat(Path, q3, FPath),
    atom_concat(FPath, '.txt', FileQuestionPath),
    tell(FileQuestionPath),
    write_q3(X, _),
    X = nil,
    told.

save_q4:-
    predicates_dir(Path),
    atom_concat(Path, q4, FPath),
    atom_concat(FPath, '.txt', FileQuestionPath),
    tell(FileQuestionPath),
    write_q4(X, _),
    X = nil,
    told.

save_q5:-
    predicates_dir(Path),
    atom_concat(Path, q5, FPath),
    atom_concat(FPath, '.txt', FileQuestionPath),
    tell(FileQuestionPath),
    write_q5(X, _),
    X = nil,
    told.

save_q6:-
    predicates_dir(Path),
    atom_concat(Path, q6, FPath),
    atom_concat(FPath, '.txt', FileQuestionPath),
    tell(FileQuestionPath),
    write_q6(X, _),
    X = nil,
    told.

save_q7:-
    predicates_dir(Path),
    atom_concat(Path, q7, FPath),
    atom_concat(FPath, '.txt', FileQuestionPath),
    tell(FileQuestionPath),
    write_q7(X, _),
    X = nil,
    told.

save_q8:-
    predicates_dir(Path),
    atom_concat(Path, q8, FPath),
    atom_concat(FPath, '.txt', FileQuestionPath),
    tell(FileQuestionPath),
    write_q8(X, _),
    X = nil,
    told.

save_q9:-
    predicates_dir(Path),
    atom_concat(Path, q9, FPath),
    atom_concat(FPath, '.txt', FileQuestionPath),
    tell(FileQuestionPath),
    write_q9(X, _),
    X = nil,
    told.

save_q10:-
    predicates_dir(Path),
    atom_concat(Path, q10, FPath),
    atom_concat(FPath, '.txt', FileQuestionPath),
    tell(FileQuestionPath),
    write_q10(X, _),
    X = nil,
    told.

save_q11:-
    predicates_dir(Path),
    atom_concat(Path, q11, FPath),
    atom_concat(FPath, '.txt', FileQuestionPath),
    tell(FileQuestionPath),
    write_q11(X, _),
    X = nil,
    told.

save_q12:-
    predicates_dir(Path),
    atom_concat(Path, q12, FPath),
    atom_concat(FPath, '.txt', FileQuestionPath),
    tell(FileQuestionPath),
    write_q12(X, _),
    X = nil,
    told.

save_q13:-
    predicates_dir(Path),
    atom_concat(Path, q13, FPath),
    atom_concat(FPath, '.txt', FileQuestionPath),
    tell(FileQuestionPath),
    write_q13(X, _),
    X = nil,
    told.

read_question1(-1):- !.
read_question1(_):-
    read_str(HeroStr),
    name(HeroAtom, HeroStr),
    read(HeroProperty),
    asserta(q1(HeroAtom, HeroProperty)),
    get0(Sym),
    read_question1(Sym).

read_question2(-1):- !.
read_question2(_):-
    read_str(HeroStr),
    name(HeroAtom, HeroStr),
    read(HeroProperty),
    asserta(q2(HeroAtom, HeroProperty)),
    get0(Sym),
    read_question2(Sym).

read_question3(-1):- !.
read_question3(_):-
    read_str(HeroStr),
    name(HeroAtom, HeroStr),
    read(HeroProperty),
    asserta(q3(HeroAtom, HeroProperty)),
    get0(Sym),
    read_question3(Sym).

read_question4(-1):- !.
read_question4(_):-
    read_str(HeroStr),
    name(HeroAtom, HeroStr),
    read(HeroProperty),
    asserta(q4(HeroAtom, HeroProperty)),
    get0(Sym),
    read_question4(Sym).

read_question5(-1):- !.
read_question5(_):-
    read_str(HeroStr),
    name(HeroAtom, HeroStr),
    read(HeroProperty),
    asserta(q5(HeroAtom, HeroProperty)),
    get0(Sym),
    read_question5(Sym).

read_question6(-1):- !.
read_question6(_):-
    read_str(HeroStr),
    name(HeroAtom, HeroStr),
    read(HeroProperty),
    asserta(q6(HeroAtom, HeroProperty)),
    get0(Sym),
    read_question6(Sym).

read_question7(-1):- !.
read_question7(_):-
    read_str(HeroStr),
    name(HeroAtom, HeroStr),
    read(HeroProperty),
    asserta(q7(HeroAtom, HeroProperty)),
    get0(Sym),
    read_question7(Sym).

read_question8(-1):- !.
read_question8(_):-
    read_str(HeroStr),
    name(HeroAtom, HeroStr),
    read(HeroProperty),
    asserta(q8(HeroAtom, HeroProperty)),
    get0(Sym),
    read_question8(Sym).

read_question9(-1):- !.
read_question9(_):-
    read_str(HeroStr),
    name(HeroAtom, HeroStr),
    read(HeroProperty),
    asserta(q9(HeroAtom, HeroProperty)),
    get0(Sym),
    read_question9(Sym).

read_question10(-1):- !.
read_question10(_):-
    read_str(HeroStr),
    name(HeroAtom, HeroStr),
    read(HeroProperty),
    asserta(q10(HeroAtom, HeroProperty)),
    get0(Sym),
    read_question10(Sym).

read_question11(-1):- !.
read_question11(_):-
    read_str(HeroStr),
    name(HeroAtom, HeroStr),
    read(HeroProperty),
    asserta(q11(HeroAtom, HeroProperty)),
    get0(Sym),
    read_question11(Sym).

read_question12(-1):- !.
read_question12(_):-
    read_str(HeroStr),
    name(HeroAtom, HeroStr),
    read(HeroProperty),
    asserta(q12(HeroAtom, HeroProperty)),
    get0(Sym),
    read_question12(Sym).

read_question13(-1):- !.
read_question13(_):-
    read_str(HeroStr),
    name(HeroAtom, HeroStr),
    read(HeroProperty),
    asserta(q13(HeroAtom, HeroProperty)),
    get0(Sym),
    read_question13(Sym).

load_q1:-
	predicates_dir(Path),
    atom_concat(Path, q1, FPath),
    atom_concat(FPath, '.txt', FileQuestionPath),
    see(FileQuestionPath),
    get0(Sym),
    read_question1(Sym),
    seen.

load_q2:-
	predicates_dir(Path),
    atom_concat(Path, q2, FPath),
    atom_concat(FPath, '.txt', FileQuestionPath),
    see(FileQuestionPath),
    get0(Sym),
    read_question2(Sym),
    seen.

load_q3:-
	predicates_dir(Path),
    atom_concat(Path, q3, FPath),
    atom_concat(FPath, '.txt', FileQuestionPath),
    see(FileQuestionPath),
    get0(Sym),
    read_question3(Sym),
    seen.

load_q4:-
	predicates_dir(Path),
    atom_concat(Path, q4, FPath),
    atom_concat(FPath, '.txt', FileQuestionPath),
    see(FileQuestionPath),
    get0(Sym),
    read_question4(Sym),
    seen.

load_q5:-
	predicates_dir(Path),
    atom_concat(Path, q5, FPath),
    atom_concat(FPath, '.txt', FileQuestionPath),
    see(FileQuestionPath),
    get0(Sym),
    read_question5(Sym),
    seen.

load_q6:-
	predicates_dir(Path),
    atom_concat(Path, q6, FPath),
    atom_concat(FPath, '.txt', FileQuestionPath),
    see(FileQuestionPath),
    get0(Sym),
    read_question6(Sym),
    seen.

load_q7:-
	predicates_dir(Path),
    atom_concat(Path, q7, FPath),
    atom_concat(FPath, '.txt', FileQuestionPath),
    see(FileQuestionPath),
    get0(Sym),
    read_question7(Sym),
    seen.

load_q8:-
	predicates_dir(Path),
    atom_concat(Path, q8, FPath),
    atom_concat(FPath, '.txt', FileQuestionPath),
    see(FileQuestionPath),
    get0(Sym),
    read_question8(Sym),
    seen.

load_q9:-
	predicates_dir(Path),
    atom_concat(Path, q9, FPath),
    atom_concat(FPath, '.txt', FileQuestionPath),
    see(FileQuestionPath),
    get0(Sym),
    read_question9(Sym),
    seen.

load_q10:-
	predicates_dir(Path),
    atom_concat(Path, q10, FPath),
    atom_concat(FPath, '.txt', FileQuestionPath),
    see(FileQuestionPath),
    get0(Sym),
    read_question10(Sym),
    seen.

load_q11:-
	predicates_dir(Path),
    atom_concat(Path, q11, FPath),
    atom_concat(FPath, '.txt', FileQuestionPath),
    see(FileQuestionPath),
    get0(Sym),
    read_question11(Sym),
    seen.

load_q12:-
	predicates_dir(Path),
    atom_concat(Path, q12, FPath),
    atom_concat(FPath, '.txt', FileQuestionPath),
    see(FileQuestionPath),
    get0(Sym),
    read_question12(Sym),
    seen.

load_q13:-
	predicates_dir(Path),
    atom_concat(Path, q13, FPath),
    atom_concat(FPath, '.txt', FileQuestionPath),
    see(FileQuestionPath),
    get0(Sym),
    read_question13(Sym),
    seen.

question_constructor(Question, Alter1, Alter2):-
    write(Question), nl,
    atom_concat('0. ', Alter1, A1),
    atom_concat('1. ', Alter2, A2),
    write(A1), nl,
    write(A2), nl.


% 1-� ������
question1(X1):-
    question_constructor('� ������ ��������� ���� ������-������������ �����(���������������)?',
                         '���',
                         '��'),
    read(X1).

% 2-� ������
question2(X2):-
    question_constructor('��� �������� ����� ������� � �����������?',
                         '���',
                         '��'),
    read(X2).

% 3-� ������
question3(X3):-
    question_constructor('� ������ ��������� ���� ��������� �����������(����-�������� ���� ���������)?',
                         '���',
                         '��'),
    read(X3).

% 4-� ������
question4(X4):-
    question_constructor('� ������ ��������� ���� ����������� � ����������/�����������/�������?',
                         '���',
                         '��'),
    read(X4).

% 5-� ������
question5(X5):-
    question_constructor('� ������ ��������� ���� ����������� �����������?',
                         '���',
                         '��'),
    read(X5).

% 6-� ������
question6(X6):-
    question_constructor('� ������ ��������� ���� ����������� � ����������?',
                        '���',
                        '��'),
    read(X6).

% 7-� ������
question7(X7):-
    question_constructor('��� �������� ����� �������� �������������� �����/�������',
                         '���',
                         '��'),
    read(X7).

% 8-� ������
question8(X8):-
    question_constructor('��� �������� ����� �������� ���� �� �������?',
                         '���',
                         '���'),
    read(X8).

% 9-� ������
question9(X9):-
    question_constructor('��� �������� �������� ������������� �� ����������� (������������, ������)',
                         '���',
                         '��'),
    read(X9).

% 10-� ������
question10(X10):-
    question_constructor('����� ��� ����� � ������ ���������?',
                         '�������',
                         '�������'),
    read(X10).

% 11-� ������
question11(X11):-
    question_constructor('��� �������� ����� ������ ���������?',
                         '���',
                         '��'),
    read(X11).

% 12-� ������
question12(X12):-
    question_constructor('��� �������� ����� �����������, ����������� ��� ��� ��������� (������, ������� ����� ������ �������� ������ ���� �� ���������)?',
                         '���',
                         '��'),
    read(X12).

% 13-� ������
question13(X13):-
    question_constructor('��� �������� ����� ������ �� �������� �����(������ �������, ��������� ��������)?',
                         '���',
                         '��'),
    read(X13).

load:-
    load_q1,
    load_q2,
    load_q3,
    load_q4,
    load_q5,
    load_q6,
    load_q7,
    load_q8,
    load_q9,
    load_q10,
    load_q11,
    load_q12,
    load_q13.
save:-
    save_q1,
    save_q2,
    save_q3,
    save_q4,
    save_q5,
    save_q6,
    save_q7,
    save_q8,
    save_q9,
    save_q10,
    save_q11,
    save_q12,
    save_q13.

question(X1, X2, X3, X4, X5, X6, X7, X8, X9, X10, X11, X12, X13):-
    question1(X1),
    question2(X2),
    question3(X3),
    question4(X4),
    question5(X5),
    question6(X6),
    question7(X7),
    question8(X8),
    question9(X9),
    question10(X10),
    question11(X11),
    question12(X12),
    question13(X13).

q(X, X1, X2, X3, X4, X5, X6,
  X7, X8, X9, X10, X11, X12, X13):-
    q1(X, X1), q2(X, X2), q3(X, X3), q4(X, X4),
    q5(X, X5), q6(X, X6), q7(X, X7), q8(X, X8),
    q9(X, X9), q10(X, X10), q11(X, X11), q12(X, X12),
    q13(X, X13).

assert(Hero, X1, X2, X3, X4, X5, X6, X7, X8, X9, X10, X11,
       X12, X13):-
    asserta(q1(Hero, X1)), asserta(q2(Hero, X2)),
    asserta(q3(Hero, X3)), asserta(q4(Hero, X4)),
    asserta(q5(Hero, X5)), asserta(q6(Hero, X6)),
    asserta(q7(Hero, X7)), asserta(q8(Hero, X8)),
    asserta(q9(Hero, X9)), asserta(q10(Hero, X10)),
    asserta(q11(Hero, X11)), asserta(q12(Hero, X12)),
    asserta(q13(Hero, X13)).

run:-
    load,
    question(X1, X2, X3, X4, X5, X6, X7, X8, X9, X10, X11,
             X12, X13),
    (q(X, X1, X2, X3,
       X4, X5, X6, X7,
       X8, X9, X10, X11,
       X12, X13) ->
    write(X);
    writeln("�������� ���� �����: "),
    get0(Fuck),
    read_str(HeroAnswer),
    name(AtomHeroAnswer, HeroAnswer),
    assert(AtomHeroAnswer,
           X1, X2, X3, X4,
           X5, X6, X7, X8,
           X9, X10, X11, X12, X13),
     save,!).



















