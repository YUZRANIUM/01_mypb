; INFO ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; FileName : 01_mypbhelp.hs
; Version  : 0.1.1
; Date     : 2022/11/11
; Author   : YUZURANIUM（ゆずらにうむ）
; Twitter  : https://twitter.com/YUZRANIUM
; GitHub   : https://github.com/YUZURANIUM/01_mypb
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; Description
; HSP3でプログレスバーを設置するモジュール 01_mypb のヘルプファイルです。
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

%dll
01_mypb
%ver
0.1.1
%date
2022/11/10
%author
YUZURANIUM(ゆずらにうむ)
%url
https://twitter.com/YUZRANIUM
https://github.com/YUZURANIUM/01_mypb
%note
01_mypb.hspをインクルードすること
%port
Win

;===============================================================================

%index
mypb
プログレスバーの設置
%prm
p1,p2,p3,p4
p1,p2 : Xサイズ, Yサイズ
p3    : オブジェクトハンドルを受け取る変数
p4(0) : スタイル(0 = 通常, 1 = 垂直, 2 = マーキー)
%inst
この命令はwinobj命令を使用してプログレスバーを設置するものです。設置位置はカレントポジションになります。
p1, p2でプログレスバーのXサイズとYサイズを指定します。
p3でオブジェクトハンドルを受け取る変数を指定します。変数はあらかじめ用意しておく必要があります。
p4はプログレスバーのウィンドウスタイルを設定します。初期値では0となっていますので省略可能です。
^
以下、p4で指定できる値
^
    値 |   見た目
----------------------------------------
    0  | 水平のプログレスバー
    1  | 垂直のプログレスバー
    2  | マーキー・アニメーション
^
マーキー・アニメーションでは不確定のアニメーションの操作ができるようになります。
^
この命令はオブジェクトを設置するだけですので、単体では動作しません。動作には別途設定命令を置く必要があります。
^
設定命令には、p4が0, 1の場合は pbset命令を、p4が2, 3の場合は pbmarq命令を使用します。
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
オブジェクト制御命令
%type
ユーザー定義命令
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
プログレスバーの設定
%prm
p1,p2,p3,p4,p5
p1      : オブジェクトハンドル
p2(0)   : 最小値 (int)
p3(100) : 最大値 (int)
p4(0)   : 開始位置 (int)
p5(1)   : 1ステップ当たりの変化量 (+/-int)
%inst
この命令はmypb命令によって設置されたプログレスバーの設定を行うものです。
^
p1に以降のパラメータの内容を適用させたいプログレスバーのオブジェクトハンドルを指定して下さい。
p2, p3で指定した値の範囲がプログレスバーの範囲となります。p2が最小値、p3が最大値となります。
p4にはバーの開始位置を整数値で指定します。
p5にはプログレスバーが1回の動作で進む変化量を整数値で指定します。正負両方取ることができ、負の整数値を指定した場合は減少していきます。
^
注意事項として、いずれのパラメータも整数値（int）となっています。実数値（double）は扱えません。
^
pbset <オブジェクトハンドル>, <min>, <Max>, <start>, <step>

%sample
#include "01_mypb.hsp"

    mypb 300, 15, hProg1, 0
    pbset hProg1, 0, 200, 0, 1      ;  最小値          最大値
                                    ;  0                 200
                                    ;  [###############    ]
                                    ;  ↑         -->
                                    ;  開始位置0    変化量 +1
    mypb 300, 15, hProg2, 0
    pbset hProg2, 0, 100, 100, -1   ;  0                 100
                                    ;  [#########          ]
                                    ;        <--           ↑
                                    ; 変化量 -1    開始位置100


*main
    wait 8

    pbstep hProg1   ; 設定された変化量だけ進める
    pbstep hProg2   ;

    goto *main

%group
オブジェクト制御命令
%type
ユーザー定義命令
%href
mypb
pbmarq
pbsetpos
pbgetp
pbsetst
pbgetst
pbsetst2
pbstep