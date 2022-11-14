; INFO ������������������������������������������������������������������������������
; FileName : 01_mypbhelp.hs
; Version  : 0.3.0
; Date     : 2022/11/14
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
0.3.0
%date
2022/11/14
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
mypb
pbset
pbstep
pbinfo
pbrepos
pbsetst
pbsetst2
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
�����ӎ����Ƃ��āA������̃p�����[�^�������l�iint�j�ƂȂ��Ă��܂��B�����l�idouble�j�͈����܂���B
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
mypb
pbset
pbstep
pbinfo
pbrepos
pbsetst
pbsetst2
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
�I�u�W�F�N�g���䖽��
%type
���[�U�[��`����
%href
mypb
pbset
pbstep
pbinfo
pbrepos
pbsetst
pbsetst2
pbswmarq

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
�^�C�v |            ���e           |         �Ԃ�l�istat�j
------------------------------------------------------------------------------------
    0  :  ���݈ʒu (PBM_GETPOS)    :  pbinfo�֐����s���_�ł̌��݈ʒu�������ŕԂ�܂�
    1  :  �ŏ��l   (PBM_GETRANGE)  :  pbset���߂Őݒ肵�������l
    2  :  �ő�l   (PBM_GETRANGE)  :           ����
    3  :  �ω���   (PBM_GETSTEP)   :           ����
    4  :  ��  ��   (PBM_GETSTATE)  :  pbinfo�֐��Ăяo�����_�ł̃o�[�̏��
^
�擾�^�C�v4�̏�Ԃ͎��̂����ꂩ�ɂȂ�܂��B
    1  :  PBST_NORMAL (�ΐF)
    2  :  PBST_ERROR  (�ԐF)
    3  :  PBST_PAUSED (���F)

%sample
    #include "01_mypb.hsp"

    mes "hProg(0) (min:0, Max:100, start:0, step:+1)"
    mypb 300, 15, hProg(0), 0
    pbset hProg(0), 0, 100, 0, 1

    winobj "static", "", , $50000000 | $800000, 250, 130
    id_static = stat  :  hStatic = objinfo(stat, 2)

*main
    wait 16
    pbstep hProg(0)      ; �X�e�b�v�i�s
    pbsetst2 hProg(0)    ; ���݈ʒu���擾���A���̒l�ɉ����ď�Ԃ�ύX

    sdim moni, 64
    moni += "hProg(0)"
    moni += "\n ���݈ʒu = " + pbinfo(hProg(0), 0)
    moni += "\n �ŏ��l   = " + pbinfo(hProg(0), 1)
    moni += "\n �ő�l   = " + pbinfo(hProg(0), 2)
    moni += "\n �ω���   = " + pbinfo(hProg(0), 3)
    moni += "\n ��  ��   = " + pbinfo(hProg(0), 4)

    sendmsg hStatic, $C, 0, moni

    goto *main

%group
�I�u�W�F�N�g���䖽��
%type
���[�U�[��`�֐�
%href
mypb
pbset
pbstep
pbinfo
pbrepos
pbsetst
pbsetst2
pbswmarq

;===============================================================================

%index
pbrepos
�o�[�̈ʒu�ݒ�
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
^
�����ӎ����Ƃ��āApbset���߂Ŏw�肵���ŏ��l�y�эő�l�͈̔͂𒴂��Ĉʒu���w�肷�邱�Ƃ͂ł��܂���B

%sample

%group
�I�u�W�F�N�g���䖽��
%type
���[�U�[��`����
%href
mypb
pbset
pbstep
pbinfo
pbrepos
pbsetst
pbsetst2
pbswmarq

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

    if      (pbinfo(hProg(0), 0) > 40) {pbsetst hProg(0), 1}  ; 40���߂ŗΐF
    else:if (pbinfo(hProg(0), 0) < 25) {pbsetst hProg(0), 2}  ; 25�����ŐԐF
    else                               {pbsetst hProg(0), 3}  ; 25�ȏ�40�ȉ��͉��F

    goto *main

%group
�I�u�W�F�N�g���䖽��
%type
���[�U�[��`����
%href
mypb
pbset
pbstep
pbinfo
pbrepos
pbsetst
pbsetst2
pbswmarq

;===============================================================================

%index
pbsetst2
�o�[�̐F�ύX
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
p4, p5, p6�ł�3�������ꂽ���ꂼ��̗̈���Ɍ��݈ʒu�����݂���ꍇ�A�o�[�ɓK�p����������Ԃ��w�肵�ĉ������B
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
    pbsetst2 hProg(0)   ; ���݈ʒu���擾���A���̒l�ɉ����ď�Ԃ�ύX
                        ; 40���߂ŗΐF, 25�����ŐԐF, 25�ȏ�40�ȉ��͉��F
    goto *main

%group
�I�u�W�F�N�g���䖽��
%type
���[�U�[��`����
%href
mypb
pbset
pbstep
pbinfo
pbrepos
pbsetst
pbsetst2
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
�I�u�W�F�N�g���䖽��
%type
���[�U�[��`����
%href
mypb
pbset
pbstep
pbinfo
pbrepos
pbsetst
pbsetst2
pbswmarq

;===============================================================================
;===============================================================================
;===============================================================================