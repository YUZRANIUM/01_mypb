; INFO ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
; FileName : 01_mypbhelp.hs
; Version  : 0.3.1
; Date     : 2022/11/16
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
0.3.1
%date
2022/11/16
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
^
p1, p2でプログレスバーのXサイズとYサイズを指定します。
p3でオブジェクトハンドルを受け取る変数を指定します。変数はあらかじめ用意しておく必要があります。
p4はプログレスバーのウィンドウスタイルを設定します。初期値では0となっていますので省略可能です。
^
以下、p4で指定できる値
^
    値 |   見た目
----------------------------------------
    0  : 水平のプログレスバー
    1  : 垂直のプログレスバー
    2  : マーキー・アニメーション
^
マーキー・アニメーションでは不確定のアニメーションの操作ができるようになります。
^
※注意事項として、この命令はオブジェクトを設置するだけですので、単体では動作しません。
動作には別途設定命令を置く必要があります。
設定命令には、p4が0, 1の場合は pbset命令を、p4が2, 3の場合は pbswmarq命令を使用します。

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
オブジェクト制御命令
%type
ユーザー定義命令
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
※注意事項として、いずれのパラメータも整数値（int）となっています。実数値（double）は扱えません。これはウィンドウメッセージが整数値(int)のみの対応となっているためです。
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
pbstep
pbrepos
pbsetst
pbswmarq

;===============================================================================

%index
pbstep
変化量だけ進める
%prm
p1
p1 : オブジェクトハンドル
%inst
この命令はプログレスバーを設定した変化量だけ進めるものです。
^
p1にオブジェクトハンドルを指定して下さい。
基本的には各処理の最後に置いて下さい。処理が終了するたびにプログレスバーを進めることができます。
^
※注意事項として、バーが最大値（最小値）に到達した場合にこの命令が実行されると再度初期位置から進み始めます。
バーが端に到達しても止まることはないので、進捗を把握したい処理群を確認してpbset命令で入念に設定を行って下さい。
%sample

%group
オブジェクト操作命令
%type
ユーザー定義命令
%href
pbset
pbrepos
pbswmarq

;===============================================================================

%index
pbrepos
バー位置再設定
%prm
p1,p2,p3
p1    : オブジェクトハンドル
p2    : 新しく設定する位置 (+/-int)
p3(0) : 設定タイプ(0 = 絶対位置, 1 = 相対位置)
%inst
この命令は、プログレスバーの現在位置を再設定するものです。
^
p1にはオブジェクトハンドルを指定して下さい。
p2で新しく設定する位置を整数値で指定して下さい。
p3で設定タイプを指定して下さい。指定できるタイプは以下になります。
^
タイプ |          内容             |         動作
--------------------------------------------------------------------
    0  :  絶対位置 (PBM_SETPOS)    :  指定された値を現在位置とする
    1  :  相対位置 (PBM_DELTAPOS)  :  指定された値を現在位置に加算
^
また、p2には負の整数値を指定することもでき、バーの現在位置から指定値だけ減ずることも可能です。
この命令の最大の特徴は変化量にとらわれず、任意のタイミングで任意の数値だけ現在位置を移動、または指定できるところにあります。
pbstep命令以外の要因で値が変動する場合や実数を扱いたい場合、変化量が不規則、ランダム、または指定できない、もしくは面倒な場合などは効果的です。
^
※注意事項として、pbset命令で指定した最小値及び最大値の範囲を超えて位置を指定することはできません。また、いずれのパラメータも整数値（int）となっています。実数値（double）は扱えません。

%sample
    mes "Battery"
    mypb 200, 15, hProg1, 0
    pbset hProg1, 0, 1000, 1000, -1     ; 小数第1位までを扱いたい場合は1,000を、
                                        ; 第2位まで扱う場合は10,000を最大値に指定して下さい
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

    pbrepos hProg1, int(power * 10), 0  ; 値を指定する場合は小数点以下を無くすように工夫して下さい
                                        ; 実数値を指定してしまうとその値が無視されてしまいます

    moni(0) = "hProg1"
    repeat 6, 1
        moni(0) += "\n " + moni(cnt) + pbinfo(hProg1, cnt - 1)
    loop
    sendmsg hStatic(0), $C, 0, moni


    moni2 = "" + strf(" %.2f%%", double(pb_now(hProg1)) / 10)
    sendmsg hStatic(1), $C, 0, moni2

    goto *main

%group
オブジェクト操作命令
%type
ユーザー定義命令
%href
pbset
pbstep
pbswmarq

;===============================================================================

%index
pbswmarq
マーキー操作
%prm
p1,p2,p3
p1     : オブジェクトハンドル
p2(1)  : アニメーション操作
p3(30) : アニメーション更新間隔(ms)
%inst
この命令は、マーキー・アニメーションを操作するものです。
^
p1にオブジェクトハンドルを指定して下さい。
p2でマーキー・アニメーションのON/OFFを切り替えます。
    0  :  停止
    1  :  再生
マーキー・アニメーションを停止後、再開させると必ず左端からのスタートになります。
^
p3はマーキー・アニメーションの更新間隔をms(ミリ秒)で指定して下さい。省略した場合は30msとなります。
マーキーとは電光掲示板のように一定の方向、間隔で流れるアニメーションを指すもので、特にプログレスバーの場合では "バックグラウンドでの別プロセスの実行中" や "プロセスの待機中"、"不確定" 等をユーザーに示すものとして利用します。
^
html{
<b>
※注意事項として、短時間に何度も呼び出すものではありません。<br>
<span style="border-bottom: solid 1px red;">
また、一度再生させた後、停止させたい場合は同命令にて停止させる必要があります。<br>
F10キーやAltキー、デバッグウィンドウからの操作では停止しません。</span>
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
オブジェクト操作命令
%type
ユーザー定義命令
%href
mypb
pbset
pbstep

;===============================================================================

%index
pbsetst
バーの状態設定
%prm
p1,p2
p1  :  オブジェクトハンドル
p2  :  バーの状態
%inst
この命令は、プログレスバーの状態を設定するものです。
^
p1にオブジェクトハンドルを指定して下さい。
p2には、以下の値を指定して下さい。
^
指定値 |         内容             |  バーの色
-------------------------------------------------
    1  :  PBST_NORMAL (通常)      :  緑色
    2  :  PBST_ERROR  (エラー)    :  赤色
    3  :  PBST_PAUSED (一時停止)  :  黄色
^
この設定により、バーの色を変更することが可能です。

%sample

*main
    pbstep hProg(0)

    if      (pb_now(hProg(0)) > 40) {pbsetst hProg(0), 1}  ; 40超過で緑色
    else:if (pb_now(hProg(0)) < 25) {pbsetst hProg(0), 2}  ; 25未満で赤色
    else                            {pbsetst hProg(0), 3}  ; 25以上40以下は黄色

    goto *main

%group
オブジェクト制御命令
%type
ユーザー定義命令
%href
pbset
pbinfo
pb_now
pbstcol
pbstcol2

;===============================================================================

%index
pbstcol
バー色変更
%prm
p1,p2,p3,p4,p5,p6
p1     :  オブジェクトハンドル
p2(25) :  中間域の下限値(int)
p3(40) :  中間域の上限値(int)
p4(2)  :  下位域の状態 (PBST_ERROR  (赤色))
p5(3)  :  中間域の状態 (PBST_PAUSED (黄色))
p6(1)  :  上位域の状態 (PBST_NORMAL (緑色))
%inst
この命令は、プログレスバーの現在位置によってバーの色を変更するのもです。
^
p1にオブジェクトハンドルを指定して下さい。
p2, p3ではプログレスバーを3分割するための値を指定して下さい。
p4, p5, p6では3分割されたそれぞれの領域内に現在位置が到達した場合、バーに適用させたい状態を指定して下さい。
^
p4,p5,p6で指定できる状態を表す数値は以下のものとなります。(pbsetst命令と同じものです。)
指定値 |         内容             |  バーの色
-------------------------------------------------
    1  :  PBST_NORMAL (通常)      :  緑色
    2  :  PBST_ERROR  (エラー)    :  赤色
    3  :  PBST_PAUSED (一時停止)  :  黄色
^
この命令は、pbsetst命令でのサンプルスクリプトをそのまま命令化したものです。
p2以降のパラメータは省略可能で、省略時は40超過で緑色、25未満で赤色、25以上40以下で黄色となります。

%sample
    #include "01_mypb.hsp"

    mes "hProg(0) (min:0, Max:100, start:0, step:+1)"
    mypb 300, 15, hProg(0), 0
    pbset hProg(0), 0, 100, 0, 1

*main
    wait 16
    pbstep hProg(0)     ; ステップ進行
    pbstcol hProg(0)    ; 現在位置を取得し、その値に応じて状態を変更
                        ; 40超過で緑色, 25未満で赤色, 25以上40以下は黄色
    goto *main

%group
オブジェクト制御命令
%type
ユーザー定義命令
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
バー色変更 百分率
%prm
p1,p2,p3,p4,p5,p6
p1     :  オブジェクトハンドル
p2(25) :  中間域の下限値(int:百分率)
p3(40) :  中間域の上限値(int:百分率)
p4(2)  :  下位域の状態 (PBST_ERROR  (赤色))
p5(3)  :  中間域の状態 (PBST_PAUSED (黄色))
p6(1)  :  上位域の状態 (PBST_NORMAL (緑色))
%inst
この命令は、pbstcol命令の第2,3パラメータを百分率で指定できるようにしたものです。
百分率で指定できるようになったので、最大値が切りの悪い場合や正確な数値を指定することが面倒な場合に効果的です。
^
例えば、最小値 : 0, 最大値 : 17931, 初期値 : 0 という条件で
25%未満は赤色、25%以上40%以下は黄色、40%超過で緑色にしたい場合、

    pbstcol2 objhwnd, 25, 40, 2, 3, 1

となります。
また、
    pbstcol2 objhwnd, 25, 40

というように第4パラメータ以降を省略しても構いません。
上記の設定では、17931の25%は4482.75、40%は7172.40となりますが内部でint関数によりそれぞれ4482、7172と小数点以下切り捨てで処理されます。
^
これ以降のパラメータ等の解説はpbstcol命令と同じものとなります。
^
※注意事項として、いずれのパラメータも整数値（int）となっています。実数値（double）は扱えません。

%sample
    #include "01_mypb.hsp"

    mes "hProg(0)"
    mypb 300, 15, hProg(0), 0
    pbset hProg(0), 0, 1783, 0, 2

*main
    wait 16

    pbstep hProg(0)                     ; ステップ進行
    pbstcol2 hProg(0), 25, 35           ; 百分率指定

    goto *main

%group
オブジェクト制御命令
%type
ユーザー定義命令
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
バーの情報取得
%prm
p1,p2
p1 : オブジェクトハンドル
p2 : 取得タイプ
%inst
この関数はプログレスバーの各種情報を取得するものです。
^
p1にオブジェクトハンドルを指定して下さい。
p2に取得したい情報の取得タイプを指定して下さい。返り値はシステム変数statに格納されます。
^
タイプ |            内容          |         返り値（stat）
------------------------------------------------------------------------------------
    0  :  現在位置 (PBM_GETPOS)   :  pbinfo関数実行時点での現在位置が整数で返ります
    1  :  最小値   (PBM_GETRANGE) :  pbset命令で設定した整数値
    2  :  最大値   (PBM_GETRANGE) :           同上
    3  :  範  囲                  :  (最大値) - (最小値)
    4  :  変化量   (PBM_GETSTEP)  :  pbset命令で設定した整数値
    5  :  状  態   (PBM_GETSTATE) :  pbinfo関数呼び出し時点でのバーの状態
^
取得タイプ4の状態は次のいずれかになります。
    1  :  PBST_NORMAL (緑色)
    2  :  PBST_ERROR  (赤色)
    3  :  PBST_PAUSED (黄色)
^
※注意事項として、pbinfo関数は 関数形式のマクロですので必ずパラメータを丸括弧で囲んで下さい。

%sample
    #include "01_mypb.hsp"

    sdim moni, 256, 7                   ; プログレスバーの情報表示用
    moni(0) = "hProg(" + n + ")"
    moni(1) = "現在位置 = "
    moni(2) = "最小値   = "
    moni(3) = "最大値   = "
    moni(4) = "範  囲   = "
    moni(5) = "変化量   = "
    moni(6) = "状  態   = "

    mes "hProg(0) (min:0, Max:100, start:0, step:+1)"
    mypb 300, 15, hProg(0), 0
    pbset hProg(0), 0, 100, 0, 1

    winobj "static", "", , $50000000 | $800000, 250, 130
    id_static = stat  :  hStatic = objinfo(stat, 2)

*main
    wait 16
    pbstep hProg(0)      ; ステップ進行
    pbstcol hProg(0)     ; 現在位置を取得し、その値に応じて状態を変更

    moni(0) = "hProg(" + n + ")"

    repeat 6, 1
        moni(0) += "\n " + moni(cnt) + pbinfo(hProg(n), cnt - 1)    ; 通常型 : ループ内で使用可
    loop

    sendmsg hStatic, $C, 0, moni

    goto *main

%group
情報取得関数
%type
ユーザー定義関数
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
現在位置マクロ
%prm
p1
p1 : オブジェクトハンドル
%inst
この関数は、pbinfo関数の現在位置を返す関数形式のマクロです。
p1にはオブジェクトハンドルを指定して下さい。
^
pb_now(p1) と pbinfo(p1, 0) は全く同じ値を返します。

%sample

*main
    wait 16
    pbstep hProg(0)      ; ステップ進行
    pbstcol hProg(0)     ; 現在位置を取得し、その値に応じて状態を変更

    moni(0) = "hProg(" + n + ")"

    moni(0) += "\n 現在位置 = " + pb_now(hProg(n))   ; パラメータ略称型
    moni(0) += "\n 最小値   = " + pb_min(hProg(n))   ; メリット
    moni(0) += "\n 最大値   = " + pb_max(hProg(n))   ; * 何の値を返しているのかがスクリプト上でわかる
    moni(0) += "\n 範  囲   = " + pb_rag(hProg(n))   ;
    moni(0) += "\n 変化量   = " + pb_var(hProg(n))   ;
    moni(0) += "\n 状  態   = " + pb_sts(hProg(n))   ;

    sendmsg hStatic, $C, 0, moni

    goto *main

%group
情報取得関数
%type
ユーザー定義関数
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
最小値マクロ
%prm
p1
p1 : オブジェクトハンドル
%inst
この関数は、pbinfo関数の最小値を返す関数形式のマクロです。
p1にはオブジェクトハンドルを指定して下さい。
^
pb_min(p1) と pbinfo(p1, 1) は全く同じ値を返します。
%sample

*main
    wait 16
    pbstep hProg(0)      ; ステップ進行
    pbstcol hProg(0)     ; 現在位置を取得し、その値に応じて状態を変更

    moni(0) = "hProg(" + n + ")"

    moni(0) += "\n 現在位置 = " + pb_now(hProg(n))   ; パラメータ略称型
    moni(0) += "\n 最小値   = " + pb_min(hProg(n))   ; メリット
    moni(0) += "\n 最大値   = " + pb_max(hProg(n))   ; * 何の値を返しているのかがスクリプト上でわかる
    moni(0) += "\n 範  囲   = " + pb_rag(hProg(n))   ;
    moni(0) += "\n 変化量   = " + pb_var(hProg(n))   ;
    moni(0) += "\n 状  態   = " + pb_sts(hProg(n))   ;

    sendmsg hStatic, $C, 0, moni

    goto *main

%group
情報取得関数
%type
ユーザー定義関数
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
最大値マクロ
%prm
p1
p1 : オブジェクトハンドル
%inst
この関数は、pbinfo関数の最大値を返す関数形式のマクロです。
p1にはオブジェクトハンドルを指定して下さい。
^
pb_max(p1) と pbinfo(p1, 2) は全く同じ値を返します。
%sample

*main
    wait 16
    pbstep hProg(0)      ; ステップ進行
    pbstcol hProg(0)     ; 現在位置を取得し、その値に応じて状態を変更

    moni(0) = "hProg(" + n + ")"

    moni(0) += "\n 現在位置 = " + pb_now(hProg(n))   ; パラメータ略称型
    moni(0) += "\n 最小値   = " + pb_min(hProg(n))   ; メリット
    moni(0) += "\n 最大値   = " + pb_max(hProg(n))   ; * 何の値を返しているのかがスクリプト上でわかる
    moni(0) += "\n 範  囲   = " + pb_rag(hProg(n))   ;
    moni(0) += "\n 変化量   = " + pb_var(hProg(n))   ;
    moni(0) += "\n 状  態   = " + pb_sts(hProg(n))   ;

    sendmsg hStatic, $C, 0, moni

    goto *main

%group
情報取得関数
%type
ユーザー定義関数
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
範囲マクロ
%prm
p1
p1 : オブジェクトハンドル
%inst
この関数は、pbinfo関数の範囲を返す関数形式のマクロです。
p1にはオブジェクトハンドルを指定して下さい。
^
pb_rag(p1) と pbinfo(p1, 3) は全く同じ値を返します。
%sample

*main
    wait 16
    pbstep hProg(0)      ; ステップ進行
    pbstcol hProg(0)     ; 現在位置を取得し、その値に応じて状態を変更

    moni(0) = "hProg(" + n + ")"

    moni(0) += "\n 現在位置 = " + pb_now(hProg(n))   ; パラメータ略称型
    moni(0) += "\n 最小値   = " + pb_min(hProg(n))   ; メリット
    moni(0) += "\n 最大値   = " + pb_max(hProg(n))   ; * 何の値を返しているのかがスクリプト上でわかる
    moni(0) += "\n 範  囲   = " + pb_rag(hProg(n))   ;
    moni(0) += "\n 変化量   = " + pb_var(hProg(n))   ;
    moni(0) += "\n 状  態   = " + pb_sts(hProg(n))   ;

    sendmsg hStatic, $C, 0, moni

    goto *main

%group
情報取得関数
%type
ユーザー定義関数
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
変化量マクロ
%prm
p1
p1 : オブジェクトハンドル
%inst
この関数は、pbinfo関数の変化量を返す関数形式のマクロです。
p1にはオブジェクトハンドルを指定して下さい。
^
pb_var(p1) と pbinfo(p1, 4) は全く同じ値を返します。
%sample

*main
    wait 16
    pbstep hProg(0)      ; ステップ進行
    pbstcol hProg(0)     ; 現在位置を取得し、その値に応じて状態を変更

    moni(0) = "hProg(" + n + ")"

    moni(0) += "\n 現在位置 = " + pb_now(hProg(n))   ; パラメータ略称型
    moni(0) += "\n 最小値   = " + pb_min(hProg(n))   ; メリット
    moni(0) += "\n 最大値   = " + pb_max(hProg(n))   ; * 何の値を返しているのかがスクリプト上でわかる
    moni(0) += "\n 範  囲   = " + pb_rag(hProg(n))   ;
    moni(0) += "\n 変化量   = " + pb_var(hProg(n))   ;
    moni(0) += "\n 状  態   = " + pb_sts(hProg(n))   ;

    sendmsg hStatic, $C, 0, moni

    goto *main

%group
情報取得関数
%type
ユーザー定義関数
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
状態マクロ
%prm
p1
p1 : オブジェクトハンドル
%inst
この関数は、pbinfo関数の状態を返す関数形式のマクロです。
p1にはオブジェクトハンドルを指定して下さい。
^
pb_sts(p1) と pbinfo(p1, 5) は全く同じ値を返します。
%sample

*main
    wait 16
    pbstep hProg(0)      ; ステップ進行
    pbstcol hProg(0)     ; 現在位置を取得し、その値に応じて状態を変更

    moni(0) = "hProg(" + n + ")"

    moni(0) += "\n 現在位置 = " + pb_now(hProg(n))   ; パラメータ略称型
    moni(0) += "\n 最小値   = " + pb_min(hProg(n))   ; メリット
    moni(0) += "\n 最大値   = " + pb_max(hProg(n))   ; * 何の値を返しているのかがスクリプト上でわかる
    moni(0) += "\n 範  囲   = " + pb_rag(hProg(n))   ;
    moni(0) += "\n 変化量   = " + pb_var(hProg(n))   ;
    moni(0) += "\n 状  態   = " + pb_sts(hProg(n))   ;

    sendmsg hStatic, $C, 0, moni

    goto *main

%group
情報取得関数
%type
ユーザー定義関数
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
通常(緑色)
%prm
0x0001
0x0001 : 緑色
%inst
バー全体が緑色になります。
通常とありますが、あくまでそういう表現なのでしょう。
^
バーの進行、停止はこの定数に左右されません。
%sample
#const PBST_NORMAL  0x0001
%group
定数
%type
win32API定数
%href
pbinfo
pb_sts
pbsetst
pbstcol
pbstcol2

;===============================================================================

%index
PBST_ERROR
エラー(赤色)
%prm
0x0002
0x0002 : 赤色
%inst
バー全体が赤色になります。
停止はしません。あくまでそういう表現なのでしょう。
^
バーの進行、停止はこの定数に左右されません。
%sample
#const PBST_ERROR   0x0002
%group
定数
%type
win32API定数
%href
pbinfo
pb_sts
pbsetst
pbstcol
pbstcol2

;===============================================================================

%index
PBST_PAUSED
一時停止 (黄色)
%prm
0x0003
0x0003 : 黄色
%inst
バー全体が黄色になります。
一時停止はしません。あくまでそういう表現なのでしょう。
^
バーの進行、停止はこの定数に左右されません。
%sample
#const PBST_PAUSED  0x0003
%group
定数
%type
win32API定数
%href
pbinfo
pb_sts
pbsetst
pbstcol
pbstcol2

;===============================================================================