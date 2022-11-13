; INFO ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; FileName : 01_mypbhelp.hs
; Version  : 0.2.2
; Date     : 2022/11/13
; Author   : YUZRANIUM（ゆずらにうむ）
; Twitter  : https://twitter.com/YUZRANIUM
; GitHub   : https://github.com/YUZRANIUM/01_mypb
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; Description
; HSP3でプログレスバーを設置するモジュール 01_mypb のヘルプファイルです。
;━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

%dll
01_mypb
%ver
0.2.2
%date
2022/11/13
%author
YUZRANIUM
%url
https://twitter.com/YUZRANIUM
https://github.com/YUZRANIUM/01_mypb
%note
01_mypb.hspをインクルードすること
%port
Win

;===============================================================================

%index
mypb
プログレスバー設置
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
pbstep
pbinfo
pbsetpos
pbsetst
pbsetst2
pbmarq


;===============================================================================


%index
pbset
プログレスバー設定
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
pbstep
pbinfo
pbsetpos
pbsetst
pbsetst2
pbmarq

;===============================================================================

%index
pbstep
変化量だけ進める
%prm
p1
p1 : オブジェクトハンドル
%inst
この命令はプログレスバーを設定した変化量だけ進めるものです。
p1にオブジェクトハンドルを指定して下さい。
^
基本的には各処理の最後に置いて下さい。処理が終了するたびにプログレスバーを進めることができます。
^
注意事項として、バーが最大値（最小値）に到達した場合にこの命令が実行されると再度初期位置から進み始めます。
バーが端に到達したからといって止まることはないので、進捗を把握したい処理群を確認してpbset命令で入念に設定を行って下さい。
%sample

%group
オブジェクト制御命令
%type
ユーザー定義命令
%href
mypb
pbset
pbinfo
pbsetpos
pbsetst
pbsetst2
pbmarq

;===============================================================================

%index
pbinfo
情報取得
%prm
p1,p2
p1 : オブジェクトハンドル
p2 : 取得タイプ
%inst
この関数はプログレスバーの各種情報を取得するものです。
p1にオブジェクトハンドルを指定して下さい。
p2に取得したい情報の取得タイプを指定して下さい。返り値はシステム変数statに格納されます。
^
    取得タイプ  |    内容    |         返り値（stat）
---------------------------------------------------------------------------------------------------
            0     :  現在位置 (PBM_GETPOS)           :  pbinfo関数実行時点での現在位置が整数で返ります
            1     :  最小値    (PBM_GETRANGE)       :  pbset命令で設定した整数値
            2     :  最大値    (PBM_GETRANGE)       :           同上
            3     :  変化量    (PBM_GETSTEP)          :           同上
            4     :  状   態    (PBM_GETSTATE)        :  pbinfo関数実行時点でのバーの状態※
            5     :  バーの色 (PBM_GETBARCOLOR) :  COLORREF
            6     :  背景色    (PBM_GETBKCOLOR)   :  COLORREF
^
取得タイプ4の状態は次のいずれかになります。
^
    1   :   PBST_NORMAL (緑色)
    2   :   PBST_ERROR   (赤色)
    3   :   PBST_PAUSED (黄色)


%sample
    #include "01_mypb.hsp"

    mes "hProg(0) (min:0, Max:100, start:0, step:+1)"
    mypb 300, 15, hProg(0), 0
    pbset hProg(0), 0, 100, 0, 1

    winobj "static", "", , $50000000 | $800000, 250, 130
    id_static = stat  :  hStatic = objinfo(stat, 2)

*main
    wait 16
    pbstep hProg(0)      ; ステップ進行
    pbsetst2 hProg(0)    ; 現在位置を取得し、その値に応じて状態を変更

    sdim moni, 64
    moni += "hProg(0)"
    moni += "\n 現在位置 = " + pbinfo(hProg(0), 0)
    moni += "\n 最小値   = " + pbinfo(hProg(0), 1)
    moni += "\n 最大値   = " + pbinfo(hProg(0), 2)
    moni += "\n 変化量   = " + pbinfo(hProg(0), 3)
    moni += "\n 状  態   = " + pbinfo(hProg(0), 4)
    moni += "\n バー色   = " + pbinfo(hProg(0), 5)
    moni += "\n 背景色   = " + pbinfo(hProg(0), 6)

    sendmsg hStatic, $C, 0, moni

    goto *main

%group
オブジェクト制御命令
%type
ユーザー定義関数
%href
mypb
pbset
pbstep
pbsetpos
pbsetst
pbsetst2
pbmarq
