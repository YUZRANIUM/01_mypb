; INFO ������������������������������������������������������������������������������
; FileName : 01_mypbhelp.hs
; Version  : 0.1.1
; Date     : 2022/11/11
; Author   : YUZURANIUM�i�䂸��ɂ��ށj
; Twitter  : https://twitter.com/YUZRANIUM
; GitHub   : https://github.com/YUZURANIUM/01_mypb
;������������������������������������������������������������������������������������
; Description
; HSP3�Ńv���O���X�o�[��ݒu���郂�W���[�� 01_mypb �̃w���v�t�@�C���ł��B
;������������������������������������������������������������������������������������

%dll
01_mypb
%ver
0.1.1
%date
2022/11/10
%author
YUZURANIUM(�䂸��ɂ���)
%url
https://twitter.com/YUZRANIUM
https://github.com/YUZURANIUM/01_mypb
%note
01_mypb.hsp���C���N���[�h���邱��
%port
Win

;===============================================================================

%index
mypb
�v���O���X�o�[�̐ݒu
%prm
p1,p2,p3,p4
p1,p2 : X�T�C�Y, Y�T�C�Y
p3    : �I�u�W�F�N�g�n���h�����󂯎��ϐ�
p4(0) : �X�^�C��(0 = �ʏ�, 1 = ����, 2 = �}�[�L�[)
%inst
���̖��߂�winobj���߂��g�p���ăv���O���X�o�[��ݒu������̂ł��B�ݒu�ʒu�̓J�����g�|�W�V�����ɂȂ�܂��B
p1, p2�Ńv���O���X�o�[��X�T�C�Y��Y�T�C�Y���w�肵�܂��B
p3�ŃI�u�W�F�N�g�n���h�����󂯎��ϐ����w�肵�܂��B�ϐ��͂��炩���ߗp�ӂ��Ă����K�v������܂��B
p4�̓v���O���X�o�[�̃E�B���h�E�X�^�C����ݒ肵�܂��B�����l�ł�0�ƂȂ��Ă��܂��̂ŏȗ��\�ł��B
^
�ȉ��Ap4�Ŏw��ł���l
^
    �l |   ������
----------------------------------------
    0  | �����̃v���O���X�o�[
    1  | �����̃v���O���X�o�[
    2  | �}�[�L�[�E�A�j���[�V����
^
�}�[�L�[�E�A�j���[�V�����ł͕s�m��̃A�j���[�V�����̑��삪�ł���悤�ɂȂ�܂��B
^
���̖��߂̓I�u�W�F�N�g��ݒu���邾���ł��̂ŁA�P�̂ł͓��삵�܂���B����ɂ͕ʓr�ݒ薽�߂�u���K�v������܂��B
^
�ݒ薽�߂ɂ́Ap4��0, 1�̏ꍇ�� pbset���߂��Ap4��2, 3�̏ꍇ�� pbmarq���߂��g�p���܂��B
^
%sample
#include "01_mypb.hsp"

    mypb 300, 15, hProg1, 0
    pbset hProg, 0, 100, 1, 0

    mypb 300, 15, hProg2, 2
    pbmarq hProg2, 1, 30

*main
    wait 8

    pbstep hProg1

    goto *main

%group
�I�u�W�F�N�g���䖽��
%type
���[�U�[��`����
%href
pbset
pbmarq
pbsetpos
pbgetp
pbsetst
pbgetst
pbsetst2
pbstep


;===============================================================================


%index
pbset
�v���O���X�o�[�̐ݒ�
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
���ӎ����Ƃ��āA������̃p�����[�^�������l�iint�j�ƂȂ��Ă��܂��B�����l�idouble�j�͈����܂���B
^
pbset <�I�u�W�F�N�g�n���h��>, <min>, <Max>, <start>, <step>

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
pbmarq
pbsetpos
pbgetp
pbsetst
pbgetst
pbsetst2
pbstep