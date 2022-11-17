; INFO ������������������������������������������������������������������������������
; FileName : 01_mypbhelp.hs
; Version  : 0.3.1
; Date     : 2022/11/16
; Author   : YUZRANIUM�i�䂸��ɂ��ށj
; Twitter  : https://twitter.com/YUZRANIUM
; GitHub   : https://github.com/YUZRANIUM/01_mypb
;������������������������������������������������������������������������������������
; Description
; HSP3�Ńv���O���X�o�[��ݒu���郂�W���[�� 01_mypb �̃w���v�t�@�C���ł��B
;������������������������������������������������������������������������������������

%dll
01_mypb
%ver
0.3.1
%date
2022/11/16
%author
YUZRANIUM
%url
https://twitter.com/YUZRANIUM
https://github.com/YUZRANIUM/01_mypb
%note
01_mypb.hsp���C���N���[�h���邱��
%port
Win

;===============================================================================

%index
mypb
�v���O���X�o�[�ݒu
%prm
p1,p2,p3,p4
p1,p2 : X�T�C�Y, Y�T�C�Y
p3    : �I�u�W�F�N�g�n���h�����󂯎��ϐ�
p4(0) : �X�^�C��(0 = �ʏ�, 1 = ����, 2 = �}�[�L�[)
%inst
���̖��߂�winobj���߂��g�p���ăv���O���X�o�[��ݒu������̂ł��B�ݒu�ʒu�̓J�����g�|�W�V�����ɂȂ�܂��B
^
p1, p2�Ńv���O���X�o�[��X�T�C�Y��Y�T�C�Y���w�肵�܂��B
p3�ŃI�u�W�F�N�g�n���h�����󂯎��ϐ����w�肵�܂��B�ϐ��͂��炩���ߗp�ӂ��Ă����K�v������܂��B
p4�̓v���O���X�o�[�̃E�B���h�E�X�^�C����ݒ肵�܂��B�����l�ł�0�ƂȂ��Ă��܂��̂ŏȗ��\�ł��B
^
�ȉ��Ap4�Ŏw��ł���l
^
    �l |   ������
----------------------------------------
    0  : �����̃v���O���X�o�[
    1  : �����̃v���O���X�o�[
    2  : �}�[�L�[�E�A�j���[�V����
^
�}�[�L�[�E�A�j���[�V�����ł͕s�m��̃A�j���[�V�����̑��삪�ł���悤�ɂȂ�܂��B
^
�����ӎ����Ƃ��āA���̖��߂̓I�u�W�F�N�g��ݒu���邾���ł��̂ŁA�P�̂ł͓��삵�܂���B
����ɂ͕ʓr�ݒ薽�߂�u���K�v������܂��B
�ݒ薽�߂ɂ́Ap4��0, 1�̏ꍇ�� pbset���߂��Ap4��2, 3�̏ꍇ�� pbswmarq���߂��g�p���܂��B

%sample
#include "01_mypb.hsp"

    mypb 300, 15, hProg1, 0
    pbset hProg, 0, 100, 1, 0

    mypb 300, 15, hProg2, 2
    pbswmarq hProg2, 1, 30

*main
    wait 8

    pbstep hProg1

    goto *main

%group
�I�u�W�F�N�g���䖽��
%type
���[�U�[��`����
%href
winobj
pbset
pbstep
pbrepos
pbsetst
pbstcol
pbstcol2
pbswmarq

;===============================================================================

%index
pbset
�v���O���X�o�[�ݒ�
%prm
p1,p2,p3,p4,p5
p1      : �I�u�W�F�N�g�n���h��
p2(0)   : �ŏ��l (int)
p3(100) : �ő�l (int)
p4(0)   : �J�n�ʒu (int)
p5(1)   : 1�X�e�b�v������̕ω��� (+/-int)
%inst
���̖��߂�mypb���߂ɂ���Đݒu���ꂽ�v���O���X�o�[�̐ݒ���s�����̂ł��B
^
p1�Ɉȍ~�̃p�����[�^�̓��e��K�p���������v���O���X�o�[�̃I�u�W�F�N�g�n���h�����w�肵�ĉ������B
p2, p3�Ŏw�肵���l�͈̔͂��v���O���X�o�[�͈̔͂ƂȂ�܂��Bp2���ŏ��l�Ap3���ő�l�ƂȂ�܂��B
p4�ɂ̓o�[�̊J�n�ʒu�𐮐��l�Ŏw�肵�܂��B
p5�ɂ̓v���O���X�o�[��1��̓���Ői�ޕω��ʂ𐮐��l�Ŏw�肵�܂��B����������邱�Ƃ��ł��A���̐����l���w�肵���ꍇ�͌������Ă����܂��B
^
�����ӎ����Ƃ��āA������̃p�����[�^�������l�iint�j�ƂȂ��Ă��܂��B�����l�idouble�j�͈����܂���B����̓E�B���h�E���b�Z�[�W�������l(int)�݂̂̑Ή��ƂȂ��Ă��邽�߂ł��B
%sample
#include "01_mypb.hsp"

    mypb 300, 15, hProg1, 0
    pbset hProg1, 0, 200, 0, 1      ;  �ŏ��l          �ő�l
                                    ;  0                 200
                                    ;  [###############    ]
                                    ;  ��         -->
                                    ;  �J�n�ʒu0    �ω��� +1
    mypb 300, 15, hProg2, 0
    pbset hProg2, 0, 100, 100, -1   ;  0                 100
                                    ;  [#########          ]
                                    ;        <--           ��
                                    ; �ω��� -1    �J�n�ʒu100
*main
    wait 8

    pbstep hProg1   ; �ݒ肳�ꂽ�ω��ʂ����i�߂�
    pbstep hProg2   ;

    goto *main

%group
�I�u�W�F�N�g���䖽��
%type
���[�U�[��`����
%href
pbstep
pbrepos
pbsetst
pbswmarq

;===============================================================================

%index
pbstep
�ω��ʂ����i�߂�
%prm
p1
p1 : �I�u�W�F�N�g�n���h��
%inst
���̖��߂̓v���O���X�o�[��ݒ肵���ω��ʂ����i�߂���̂ł��B
^
p1�ɃI�u�W�F�N�g�n���h�����w�肵�ĉ������B
��{�I�ɂ͊e�����̍Ō�ɒu���ĉ������B�������I�����邽�тɃv���O���X�o�[��i�߂邱�Ƃ��ł��܂��B
^
�����ӎ����Ƃ��āA�o�[���ő�l�i�ŏ��l�j�ɓ��B�����ꍇ�ɂ��̖��߂����s�����ƍēx�����ʒu����i�ݎn�߂܂��B
�o�[���[�ɓ��B���Ă��~�܂邱�Ƃ͂Ȃ��̂ŁA�i����c�������������Q���m�F����pbset���߂œ��O�ɐݒ���s���ĉ������B
%sample

%group
�I�u�W�F�N�g���얽��
%type
���[�U�[��`����
%href
pbset
pbrepos
pbswmarq

;===============================================================================

%index
pbrepos
�o�[�ʒu�Đݒ�
%prm
p1,p2,p3
p1    : �I�u�W�F�N�g�n���h��
p2    : �V�����ݒ肷��ʒu (+/-int)
p3(0) : �ݒ�^�C�v(0 = ��Έʒu, 1 = ���Έʒu)
%inst
���̖��߂́A�v���O���X�o�[�̌��݈ʒu���Đݒ肷����̂ł��B
^
p1�ɂ̓I�u�W�F�N�g�n���h�����w�肵�ĉ������B
p2�ŐV�����ݒ肷��ʒu�𐮐��l�Ŏw�肵�ĉ������B
p3�Őݒ�^�C�v���w�肵�ĉ������B�w��ł���^�C�v�͈ȉ��ɂȂ�܂��B
^
�^�C�v |          ���e             |         ����
--------------------------------------------------------------------
    0  :  ��Έʒu (PBM_SETPOS)    :  �w�肳�ꂽ�l�����݈ʒu�Ƃ���
    1  :  ���Έʒu (PBM_DELTAPOS)  :  �w�肳�ꂽ�l�����݈ʒu�ɉ��Z
^
�܂��Ap2�ɂ͕��̐����l���w�肷�邱�Ƃ��ł��A�o�[�̌��݈ʒu����w��l���������邱�Ƃ��\�ł��B
���̖��߂̍ő�̓����͕ω��ʂɂƂ��ꂸ�A�C�ӂ̃^�C�~���O�ŔC�ӂ̐��l�������݈ʒu���ړ��A�܂��͎w��ł���Ƃ���ɂ���܂��B
pbstep���߈ȊO�̗v���Œl���ϓ�����ꍇ����������������ꍇ�A�ω��ʂ��s�K���A�����_���A�܂��͎w��ł��Ȃ��A�������͖ʓ|�ȏꍇ�Ȃǂ͌��ʓI�ł��B
^
�����ӎ����Ƃ��āApbset���߂Ŏw�肵���ŏ��l�y�эő�l�͈̔͂𒴂��Ĉʒu���w�肷�邱�Ƃ͂ł��܂���B�܂��A������̃p�����[�^�������l�iint�j�ƂȂ��Ă��܂��B�����l�idouble�j�͈����܂���B

%sample
    mes "Battery"
    mypb 200, 15, hProg1, 0
    pbset hProg1, 0, 1000, 1000, -1     ; ������1�ʂ܂ł����������ꍇ��1,000���A
                                        ; ��2�ʂ܂ň����ꍇ��10,000���ő�l�Ɏw�肵�ĉ�����
    pos 20, 50
    winobj "static", "", , $50000000 | $800000, 150, 120
    hStatic(0) = objinfo(stat, 2)

    pos 230, ginfo_mesy
    winobj "static", "", , $50000000 | $800000, 80, 20
    hStatic(1) = objinfo(stat, 2)

*main
    await 32
    power -= 0.1
    if power <= 0 : power = 100.0

    pbrepos hProg1, int(power * 10), 0  ; �l���w�肷��ꍇ�͏����_�ȉ��𖳂����悤�ɍH�v���ĉ�����
                                        ; �����l���w�肵�Ă��܂��Ƃ��̒l����������Ă��܂��܂�

    moni(0) = "hProg1"
    repeat 6, 1
        moni(0) += "\n " + moni(cnt) + pbinfo(hProg1, cnt - 1)
    loop
    sendmsg hStatic(0), $C, 0, moni


    moni2 = "" + strf(" %.2f%%", double(pb_now(hProg1)) / 10)
    sendmsg hStatic(1), $C, 0, moni2

    goto *main

%group
�I�u�W�F�N�g���얽��
%type
���[�U�[��`����
%href
pbset
pbstep
pbswmarq

;===============================================================================

%index
pbswmarq
�}�[�L�[����
%prm
p1,p2,p3
p1     : �I�u�W�F�N�g�n���h��
p2(1)  : �A�j���[�V��������
p3(30) : �A�j���[�V�����X�V�Ԋu(ms)
%inst
���̖��߂́A�}�[�L�[�E�A�j���[�V�����𑀍삷����̂ł��B
^
p1�ɃI�u�W�F�N�g�n���h�����w�肵�ĉ������B
p2�Ń}�[�L�[�E�A�j���[�V������ON/OFF��؂�ւ��܂��B
    0  :  ��~
    1  :  �Đ�
�}�[�L�[�E�A�j���[�V�������~��A�ĊJ������ƕK�����[����̃X�^�[�g�ɂȂ�܂��B
^
p3�̓}�[�L�[�E�A�j���[�V�����̍X�V�Ԋu��ms(�~���b)�Ŏw�肵�ĉ������B�ȗ������ꍇ��30ms�ƂȂ�܂��B
�}�[�L�[�Ƃ͓d���f���̂悤�Ɉ��̕����A�Ԋu�ŗ����A�j���[�V�������w�����̂ŁA���Ƀv���O���X�o�[�̏ꍇ�ł� "�o�b�N�O���E���h�ł̕ʃv���Z�X�̎��s��" �� "�v���Z�X�̑ҋ@��"�A"�s�m��" �������[�U�[�Ɏ������̂Ƃ��ė��p���܂��B
^
html{
<b>
�����ӎ����Ƃ��āA�Z���Ԃɉ��x���Ăяo�����̂ł͂���܂���B<br>
<span style="border-bottom: solid 1px red;">
�܂��A��x�Đ���������A��~���������ꍇ�͓����߂ɂĒ�~������K�v������܂��B<br>
F10�L�[��Alt�L�[�A�f�o�b�O�E�B���h�E����̑���ł͒�~���܂���B</span>
</b>
}html

%sample
    butstr = "start", "stop"

    mes "hProg(3) (MARQUEE)"
    mypb 300, 15, hProg(3), 2

    button gosub "statrt", *marqueesw
    butid(0) = stat

    stop

*marqueesw
    a = a * -1
    if (a == -1) {b = 1}
    else         {b = 0}

    pbswmarq hProg(3), b, 30
    objprm butid(0), butstr(b)
    return

%group
�I�u�W�F�N�g���얽��
%type
���[�U�[��`����
%href
mypb
pbset
pbstep

;===============================================================================

%index
pbsetst
�o�[�̏�Ԑݒ�
%prm
p1,p2
p1  :  �I�u�W�F�N�g�n���h��
p2  :  �o�[�̏��
%inst
���̖��߂́A�v���O���X�o�[�̏�Ԃ�ݒ肷����̂ł��B
^
p1�ɃI�u�W�F�N�g�n���h�����w�肵�ĉ������B
p2�ɂ́A�ȉ��̒l���w�肵�ĉ������B
^
�w��l |         ���e             |  �o�[�̐F
-------------------------------------------------
    1  :  PBST_NORMAL (�ʏ�)      :  �ΐF
    2  :  PBST_ERROR  (�G���[)    :  �ԐF
    3  :  PBST_PAUSED (�ꎞ��~)  :  ���F
^
���̐ݒ�ɂ��A�o�[�̐F��ύX���邱�Ƃ��\�ł��B

%sample

*main
    pbstep hProg(0)

    if      (pb_now(hProg(0)) > 40) {pbsetst hProg(0), 1}  ; 40���߂ŗΐF
    else:if (pb_now(hProg(0)) < 25) {pbsetst hProg(0), 2}  ; 25�����ŐԐF
    else                            {pbsetst hProg(0), 3}  ; 25�ȏ�40�ȉ��͉��F

    goto *main

%group
�I�u�W�F�N�g���䖽��
%type
���[�U�[��`����
%href
pbset
pbinfo
pb_now
pbstcol
pbstcol2

;===============================================================================

%index
pbstcol
�o�[�F�ύX
%prm
p1,p2,p3,p4,p5,p6
p1     :  �I�u�W�F�N�g�n���h��
p2(25) :  ���Ԉ�̉����l(int)
p3(40) :  ���Ԉ�̏���l(int)
p4(2)  :  ���ʈ�̏�� (PBST_ERROR  (�ԐF))
p5(3)  :  ���Ԉ�̏�� (PBST_PAUSED (���F))
p6(1)  :  ��ʈ�̏�� (PBST_NORMAL (�ΐF))
%inst
���̖��߂́A�v���O���X�o�[�̌��݈ʒu�ɂ���ăo�[�̐F��ύX����̂��ł��B
^
p1�ɃI�u�W�F�N�g�n���h�����w�肵�ĉ������B
p2, p3�ł̓v���O���X�o�[��3�������邽�߂̒l���w�肵�ĉ������B
p4, p5, p6�ł�3�������ꂽ���ꂼ��̗̈���Ɍ��݈ʒu�����B�����ꍇ�A�o�[�ɓK�p����������Ԃ��w�肵�ĉ������B
^
p4,p5,p6�Ŏw��ł����Ԃ�\�����l�͈ȉ��̂��̂ƂȂ�܂��B(pbsetst���߂Ɠ������̂ł��B)
�w��l |         ���e             |  �o�[�̐F
-------------------------------------------------
    1  :  PBST_NORMAL (�ʏ�)      :  �ΐF
    2  :  PBST_ERROR  (�G���[)    :  �ԐF
    3  :  PBST_PAUSED (�ꎞ��~)  :  ���F
^
���̖��߂́Apbsetst���߂ł̃T���v���X�N���v�g�����̂܂ܖ��߉��������̂ł��B
p2�ȍ~�̃p�����[�^�͏ȗ��\�ŁA�ȗ�����40���߂ŗΐF�A25�����ŐԐF�A25�ȏ�40�ȉ��ŉ��F�ƂȂ�܂��B

%sample
    #include "01_mypb.hsp"

    mes "hProg(0) (min:0, Max:100, start:0, step:+1)"
    mypb 300, 15, hProg(0), 0
    pbset hProg(0), 0, 100, 0, 1

*main
    wait 16
    pbstep hProg(0)     ; �X�e�b�v�i�s
    pbstcol hProg(0)    ; ���݈ʒu���擾���A���̒l�ɉ����ď�Ԃ�ύX
                        ; 40���߂ŗΐF, 25�����ŐԐF, 25�ȏ�40�ȉ��͉��F
    goto *main

%group
�I�u�W�F�N�g���䖽��
%type
���[�U�[��`����
%href
pbinfo
pb_now
pb_rag
pb_sts
pbsetst
pbstcol2

;===============================================================================

%index
pbstcol2
�o�[�F�ύX �S����
%prm
p1,p2,p3,p4,p5,p6
p1     :  �I�u�W�F�N�g�n���h��
p2(25) :  ���Ԉ�̉����l(int:�S����)
p3(40) :  ���Ԉ�̏���l(int:�S����)
p4(2)  :  ���ʈ�̏�� (PBST_ERROR  (�ԐF))
p5(3)  :  ���Ԉ�̏�� (PBST_PAUSED (���F))
p6(1)  :  ��ʈ�̏�� (PBST_NORMAL (�ΐF))
%inst
���̖��߂́Apbstcol���߂̑�2,3�p�����[�^��S�����Ŏw��ł���悤�ɂ������̂ł��B
�S�����Ŏw��ł���悤�ɂȂ����̂ŁA�ő�l���؂�̈����ꍇ�␳�m�Ȑ��l���w�肷�邱�Ƃ��ʓ|�ȏꍇ�Ɍ��ʓI�ł��B
^
�Ⴆ�΁A�ŏ��l : 0, �ő�l : 17931, �����l : 0 �Ƃ���������
25%�����͐ԐF�A25%�ȏ�40%�ȉ��͉��F�A40%���߂ŗΐF�ɂ������ꍇ�A

    pbstcol2 objhwnd, 25, 40, 2, 3, 1

�ƂȂ�܂��B
�܂��A
    pbstcol2 objhwnd, 25, 40

�Ƃ����悤�ɑ�4�p�����[�^�ȍ~���ȗ����Ă��\���܂���B
��L�̐ݒ�ł́A17931��25%��4482.75�A40%��7172.40�ƂȂ�܂���������int�֐��ɂ�肻�ꂼ��4482�A7172�Ə����_�ȉ��؂�̂Ăŏ�������܂��B
^
����ȍ~�̃p�����[�^���̉����pbstcol���߂Ɠ������̂ƂȂ�܂��B
^
�����ӎ����Ƃ��āA������̃p�����[�^�������l�iint�j�ƂȂ��Ă��܂��B�����l�idouble�j�͈����܂���B

%sample
    #include "01_mypb.hsp"

    mes "hProg(0)"
    mypb 300, 15, hProg(0), 0
    pbset hProg(0), 0, 1783, 0, 2

*main
    wait 16

    pbstep hProg(0)                     ; �X�e�b�v�i�s
    pbstcol2 hProg(0), 25, 35           ; �S�����w��

    goto *main

%group
�I�u�W�F�N�g���䖽��
%type
���[�U�[��`����
%href
pbinfo
pb_now
pb_rag
pb_sts
pbsetst
pbstcol
pbstcol2

;===============================================================================

%index
pbinfo
�o�[�̏��擾
%prm
p1,p2
p1 : �I�u�W�F�N�g�n���h��
p2 : �擾�^�C�v
%inst
���̊֐��̓v���O���X�o�[�̊e������擾������̂ł��B
^
p1�ɃI�u�W�F�N�g�n���h�����w�肵�ĉ������B
p2�Ɏ擾���������̎擾�^�C�v���w�肵�ĉ������B�Ԃ�l�̓V�X�e���ϐ�stat�Ɋi�[����܂��B
^
�^�C�v |            ���e          |         �Ԃ�l�istat�j
------------------------------------------------------------------------------------
    0  :  ���݈ʒu (PBM_GETPOS)   :  pbinfo�֐����s���_�ł̌��݈ʒu�������ŕԂ�܂�
    1  :  �ŏ��l   (PBM_GETRANGE) :  pbset���߂Őݒ肵�������l
    2  :  �ő�l   (PBM_GETRANGE) :           ����
    3  :  ��  ��                  :  (�ő�l) - (�ŏ��l)
    4  :  �ω���   (PBM_GETSTEP)  :  pbset���߂Őݒ肵�������l
    5  :  ��  ��   (PBM_GETSTATE) :  pbinfo�֐��Ăяo�����_�ł̃o�[�̏��
^
�擾�^�C�v4�̏�Ԃ͎��̂����ꂩ�ɂȂ�܂��B
    1  :  PBST_NORMAL (�ΐF)
    2  :  PBST_ERROR  (�ԐF)
    3  :  PBST_PAUSED (���F)
^
�����ӎ����Ƃ��āApbinfo�֐��� �֐��`���̃}�N���ł��̂ŕK���p�����[�^���ۊ��ʂň͂�ŉ������B

%sample
    #include "01_mypb.hsp"

    sdim moni, 256, 7                   ; �v���O���X�o�[�̏��\���p
    moni(0) = "hProg(" + n + ")"
    moni(1) = "���݈ʒu = "
    moni(2) = "�ŏ��l   = "
    moni(3) = "�ő�l   = "
    moni(4) = "��  ��   = "
    moni(5) = "�ω���   = "
    moni(6) = "��  ��   = "

    mes "hProg(0) (min:0, Max:100, start:0, step:+1)"
    mypb 300, 15, hProg(0), 0
    pbset hProg(0), 0, 100, 0, 1

    winobj "static", "", , $50000000 | $800000, 250, 130
    id_static = stat  :  hStatic = objinfo(stat, 2)

*main
    wait 16
    pbstep hProg(0)      ; �X�e�b�v�i�s
    pbstcol hProg(0)     ; ���݈ʒu���擾���A���̒l�ɉ����ď�Ԃ�ύX

    moni(0) = "hProg(" + n + ")"

    repeat 6, 1
        moni(0) += "\n " + moni(cnt) + pbinfo(hProg(n), cnt - 1)    ; �ʏ�^ : ���[�v���Ŏg�p��
    loop

    sendmsg hStatic, $C, 0, moni

    goto *main

%group
���擾�֐�
%type
���[�U�[��`�֐�
%href
pbinfo
pb_now
pb_min
pb_max
pb_rag
pb_var
pb_sts

;===============================================================================

%index
pb_now
���݈ʒu�}�N��
%prm
p1
p1 : �I�u�W�F�N�g�n���h��
%inst
���̊֐��́Apbinfo�֐��̌��݈ʒu��Ԃ��֐��`���̃}�N���ł��B
p1�ɂ̓I�u�W�F�N�g�n���h�����w�肵�ĉ������B
^
pb_now(p1) �� pbinfo(p1, 0) �͑S�������l��Ԃ��܂��B

%sample

*main
    wait 16
    pbstep hProg(0)      ; �X�e�b�v�i�s
    pbstcol hProg(0)     ; ���݈ʒu���擾���A���̒l�ɉ����ď�Ԃ�ύX

    moni(0) = "hProg(" + n + ")"

    moni(0) += "\n ���݈ʒu = " + pb_now(hProg(n))   ; �p�����[�^���̌^
    moni(0) += "\n �ŏ��l   = " + pb_min(hProg(n))   ; �����b�g
    moni(0) += "\n �ő�l   = " + pb_max(hProg(n))   ; * ���̒l��Ԃ��Ă���̂����X�N���v�g��ł킩��
    moni(0) += "\n ��  ��   = " + pb_rag(hProg(n))   ;
    moni(0) += "\n �ω���   = " + pb_var(hProg(n))   ;
    moni(0) += "\n ��  ��   = " + pb_sts(hProg(n))   ;

    sendmsg hStatic, $C, 0, moni

    goto *main

%group
���擾�֐�
%type
���[�U�[��`�֐�
%href
pbinfo
pb_now
pb_min
pb_max
pb_rag
pb_var
pb_sts

;===============================================================================

%index
pb_min
�ŏ��l�}�N��
%prm
p1
p1 : �I�u�W�F�N�g�n���h��
%inst
���̊֐��́Apbinfo�֐��̍ŏ��l��Ԃ��֐��`���̃}�N���ł��B
p1�ɂ̓I�u�W�F�N�g�n���h�����w�肵�ĉ������B
^
pb_min(p1) �� pbinfo(p1, 1) �͑S�������l��Ԃ��܂��B
%sample

*main
    wait 16
    pbstep hProg(0)      ; �X�e�b�v�i�s
    pbstcol hProg(0)     ; ���݈ʒu���擾���A���̒l�ɉ����ď�Ԃ�ύX

    moni(0) = "hProg(" + n + ")"

    moni(0) += "\n ���݈ʒu = " + pb_now(hProg(n))   ; �p�����[�^���̌^
    moni(0) += "\n �ŏ��l   = " + pb_min(hProg(n))   ; �����b�g
    moni(0) += "\n �ő�l   = " + pb_max(hProg(n))   ; * ���̒l��Ԃ��Ă���̂����X�N���v�g��ł킩��
    moni(0) += "\n ��  ��   = " + pb_rag(hProg(n))   ;
    moni(0) += "\n �ω���   = " + pb_var(hProg(n))   ;
    moni(0) += "\n ��  ��   = " + pb_sts(hProg(n))   ;

    sendmsg hStatic, $C, 0, moni

    goto *main

%group
���擾�֐�
%type
���[�U�[��`�֐�
%href
pbinfo
pb_now
pb_min
pb_max
pb_rag
pb_var
pb_sts

;===============================================================================

%index
pb_max
�ő�l�}�N��
%prm
p1
p1 : �I�u�W�F�N�g�n���h��
%inst
���̊֐��́Apbinfo�֐��̍ő�l��Ԃ��֐��`���̃}�N���ł��B
p1�ɂ̓I�u�W�F�N�g�n���h�����w�肵�ĉ������B
^
pb_max(p1) �� pbinfo(p1, 2) �͑S�������l��Ԃ��܂��B
%sample

*main
    wait 16
    pbstep hProg(0)      ; �X�e�b�v�i�s
    pbstcol hProg(0)     ; ���݈ʒu���擾���A���̒l�ɉ����ď�Ԃ�ύX

    moni(0) = "hProg(" + n + ")"

    moni(0) += "\n ���݈ʒu = " + pb_now(hProg(n))   ; �p�����[�^���̌^
    moni(0) += "\n �ŏ��l   = " + pb_min(hProg(n))   ; �����b�g
    moni(0) += "\n �ő�l   = " + pb_max(hProg(n))   ; * ���̒l��Ԃ��Ă���̂����X�N���v�g��ł킩��
    moni(0) += "\n ��  ��   = " + pb_rag(hProg(n))   ;
    moni(0) += "\n �ω���   = " + pb_var(hProg(n))   ;
    moni(0) += "\n ��  ��   = " + pb_sts(hProg(n))   ;

    sendmsg hStatic, $C, 0, moni

    goto *main

%group
���擾�֐�
%type
���[�U�[��`�֐�
%href
pbinfo
pb_now
pb_min
pb_max
pb_rag
pb_var
pb_sts

;===============================================================================

%index
pb_rag
�͈̓}�N��
%prm
p1
p1 : �I�u�W�F�N�g�n���h��
%inst
���̊֐��́Apbinfo�֐��͈̔͂�Ԃ��֐��`���̃}�N���ł��B
p1�ɂ̓I�u�W�F�N�g�n���h�����w�肵�ĉ������B
^
pb_rag(p1) �� pbinfo(p1, 3) �͑S�������l��Ԃ��܂��B
%sample

*main
    wait 16
    pbstep hProg(0)      ; �X�e�b�v�i�s
    pbstcol hProg(0)     ; ���݈ʒu���擾���A���̒l�ɉ����ď�Ԃ�ύX

    moni(0) = "hProg(" + n + ")"

    moni(0) += "\n ���݈ʒu = " + pb_now(hProg(n))   ; �p�����[�^���̌^
    moni(0) += "\n �ŏ��l   = " + pb_min(hProg(n))   ; �����b�g
    moni(0) += "\n �ő�l   = " + pb_max(hProg(n))   ; * ���̒l��Ԃ��Ă���̂����X�N���v�g��ł킩��
    moni(0) += "\n ��  ��   = " + pb_rag(hProg(n))   ;
    moni(0) += "\n �ω���   = " + pb_var(hProg(n))   ;
    moni(0) += "\n ��  ��   = " + pb_sts(hProg(n))   ;

    sendmsg hStatic, $C, 0, moni

    goto *main

%group
���擾�֐�
%type
���[�U�[��`�֐�
%href
pbinfo
pb_now
pb_min
pb_max
pb_rag
pb_var
pb_sts

;===============================================================================

%index
pb_var
�ω��ʃ}�N��
%prm
p1
p1 : �I�u�W�F�N�g�n���h��
%inst
���̊֐��́Apbinfo�֐��̕ω��ʂ�Ԃ��֐��`���̃}�N���ł��B
p1�ɂ̓I�u�W�F�N�g�n���h�����w�肵�ĉ������B
^
pb_var(p1) �� pbinfo(p1, 4) �͑S�������l��Ԃ��܂��B
%sample

*main
    wait 16
    pbstep hProg(0)      ; �X�e�b�v�i�s
    pbstcol hProg(0)     ; ���݈ʒu���擾���A���̒l�ɉ����ď�Ԃ�ύX

    moni(0) = "hProg(" + n + ")"

    moni(0) += "\n ���݈ʒu = " + pb_now(hProg(n))   ; �p�����[�^���̌^
    moni(0) += "\n �ŏ��l   = " + pb_min(hProg(n))   ; �����b�g
    moni(0) += "\n �ő�l   = " + pb_max(hProg(n))   ; * ���̒l��Ԃ��Ă���̂����X�N���v�g��ł킩��
    moni(0) += "\n ��  ��   = " + pb_rag(hProg(n))   ;
    moni(0) += "\n �ω���   = " + pb_var(hProg(n))   ;
    moni(0) += "\n ��  ��   = " + pb_sts(hProg(n))   ;

    sendmsg hStatic, $C, 0, moni

    goto *main

%group
���擾�֐�
%type
���[�U�[��`�֐�
%href
pbinfo
pb_now
pb_min
pb_max
pb_rag
pb_var
pb_sts

;===============================================================================

%index
pb_sts
��ԃ}�N��
%prm
p1
p1 : �I�u�W�F�N�g�n���h��
%inst
���̊֐��́Apbinfo�֐��̏�Ԃ�Ԃ��֐��`���̃}�N���ł��B
p1�ɂ̓I�u�W�F�N�g�n���h�����w�肵�ĉ������B
^
pb_sts(p1) �� pbinfo(p1, 5) �͑S�������l��Ԃ��܂��B
%sample

*main
    wait 16
    pbstep hProg(0)      ; �X�e�b�v�i�s
    pbstcol hProg(0)     ; ���݈ʒu���擾���A���̒l�ɉ����ď�Ԃ�ύX

    moni(0) = "hProg(" + n + ")"

    moni(0) += "\n ���݈ʒu = " + pb_now(hProg(n))   ; �p�����[�^���̌^
    moni(0) += "\n �ŏ��l   = " + pb_min(hProg(n))   ; �����b�g
    moni(0) += "\n �ő�l   = " + pb_max(hProg(n))   ; * ���̒l��Ԃ��Ă���̂����X�N���v�g��ł킩��
    moni(0) += "\n ��  ��   = " + pb_rag(hProg(n))   ;
    moni(0) += "\n �ω���   = " + pb_var(hProg(n))   ;
    moni(0) += "\n ��  ��   = " + pb_sts(hProg(n))   ;

    sendmsg hStatic, $C, 0, moni

    goto *main

%group
���擾�֐�
%type
���[�U�[��`�֐�
%href
pbinfo
pb_now
pb_min
pb_max
pb_rag
pb_var
pb_sts

;===============================================================================

%index
PBST_NORMAL
�ʏ�(�ΐF)
%prm
0x0001
0x0001 : �ΐF
%inst
�o�[�S�̂��ΐF�ɂȂ�܂��B
�ʏ�Ƃ���܂����A�����܂ł��������\���Ȃ̂ł��傤�B
^
�o�[�̐i�s�A��~�͂��̒萔�ɍ��E����܂���B
%sample
#const PBST_NORMAL  0x0001
%group
�萔
%type
win32API�萔
%href
pbinfo
pb_sts
pbsetst
pbstcol
pbstcol2

;===============================================================================

%index
PBST_ERROR
�G���[(�ԐF)
%prm
0x0002
0x0002 : �ԐF
%inst
�o�[�S�̂��ԐF�ɂȂ�܂��B
��~�͂��܂���B�����܂ł��������\���Ȃ̂ł��傤�B
^
�o�[�̐i�s�A��~�͂��̒萔�ɍ��E����܂���B
%sample
#const PBST_ERROR   0x0002
%group
�萔
%type
win32API�萔
%href
pbinfo
pb_sts
pbsetst
pbstcol
pbstcol2

;===============================================================================

%index
PBST_PAUSED
�ꎞ��~ (���F)
%prm
0x0003
0x0003 : ���F
%inst
�o�[�S�̂����F�ɂȂ�܂��B
�ꎞ��~�͂��܂���B�����܂ł��������\���Ȃ̂ł��傤�B
^
�o�[�̐i�s�A��~�͂��̒萔�ɍ��E����܂���B
%sample
#const PBST_PAUSED  0x0003
%group
�萔
%type
win32API�萔
%href
pbinfo
pb_sts
pbsetst
pbstcol
pbstcol2

;===============================================================================