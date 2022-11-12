# マイ・プログレスバー ![GitHub release (latest by date including pre-releases)](https://img.shields.io/github/v/release/YUZURANIUM/01_mypb?include_prereleases&style=flat-square)

プログレスバーを比較的簡単に設置できるモジュールです。不定期更新です。

不具合報告や要望等は [Twitter](https://twitter.com/YUZRANIUM) のDMか [HSPの掲示板](http://hsp.tv/play/pforum.php) 等で頂けると幸いです。

**※現在ヘルプファイルの制作中です()**

<br>

## 特徴（Feature）

* `user32.as` や `gdi32.as`、`hsp3util.as` 等を必要とせず、本モジュールのみでプログレスバーを設置可能。

* 設置したプログレスバーに関する情報の取得は全て関数で行うため、式の中で利用可能。

* 内部で、オブジェクトの設置には `winobj 命令`、それ以外の命令･関数は `sendmsg 命令` を使用。

<br>

## 今後の予定
* [ ] ヘルプファイルの作製（現在制作中）
* [ ] 設定に関する命令を1つにまとめたい
* [ ] 背景色、バーの色設定命令の追加
* [x] 背景色、バーの色取得関数の追加
* [ ] ループ内で現在位置を監視・取得し、その値に応じて配色を変更する命令（バーの状態を変更することによる配色変更命令は実装済み）

<br>

## 導入方法（Introduction）

~~~
.
├── 01_mypb.hsp
│
├── 01_mypb
│   ├── 01_mypbhelp.hs
│   ├── 01_mypb_smpl.hsp
│   └── 01_mypb.txt
│
├── README.md
├── README.html
└── License.txt
~~~

* 01_mypb.hsp をユーザースクリプトのディレクトリか、HSP のインストールディレクトリ下の commonフォルダ内において、01_mypb.hspをインクルードしてください。

~~~
    例） hsp36/common/01_mypb.hsp
~~~

<br>

* 01_mypbフォルダをHSPのインストールディレクトリ下にある **doclibフォルダ内に01_mypbフォルダごと** 置いて下さい。サンプルファイルもそのままで構いません。

~~~
    例） hsp36/doclib/01_mypb
~~~

<br>

## 機能（Function）

<details>

<summary>追加される命令･関数 全8つ</summary>

~~~ hsp
;---------------------------------------
;オブジェクトの設置
;---------------------------------------

// プログレスバーの設置（命令・マクロ）
// p1,p2 : Xサイズ, Yサイズ
// p3    : オブジェクトハンドルを受け取る変数
// p4(0) : スタイル
//         0 : 通常
//         1 : 垂直
//         2 : マーキー
    mypb X, Y, Objhwnd, style


;---------------------------------------
;オブジェクトの設定
;---------------------------------------

// プログレスバーの設定（命令・マクロ）
// p1      : オブジェクトハンドル
// p2(0)   : 最小値   (int)
// p3(100) : 最大値   (int)
// p4(0)   : 現在位置 (int)
// p5(1)   : 1ステップ当たりの変化量(+/-int)
    pbset objhwnd, min, Max, delta, now


;---------------------------------------
;プログレスバーの実行
;---------------------------------------

// 設定した変化量だけ進める（命令）
// p1 : オブジェクトハンドル
    pbstep objhwnd


;---------------------------------------
;プログレスバーの情報取得
;---------------------------------------

//プログレスバーの情報取得（関数）
// p1 : オブジェクトハンドル
// p2 : 取得タイプ
//       0 : 現在位置 (int)
//       1 : 最小値 (int)
//       2 : 最大値 (int)
//       3 : 変化量 (int)    ※ 取得できない? 調整中
//       4 : バーの状態 (int)
//       5 : バーの色 (COLORREF)    ※ 取得できず 調整中
//       6 : 背景色   (COLORREF)
    pbinfo(objhwnd, p2)



;---------------------------------------
;現在位置
;---------------------------------------

// プログレスバーの位置設定（命令・マクロ）
// p1    : オブジェクトハンドル
// p2    : 新しく設定する位置(int)
// p3(0) : 設定フラグ(0 = 絶対位置, 1 = 相対位置)
    pbsetpos objhwnd, newpos, flag


;---------------------------------------
;プログレスバーの状態
;---------------------------------------

// プログレスバーの状態設定（命令）
// p1 : オブジェクトハンドル
// p2 : バーの状態
//  1 = PBST_NORMAL (緑色)
//  2 = PBST_ERROR  (赤色)
//  3 = PBST_PAUSED (黄色)
    pbsetst objhwnd, status


// プログレスバーの配色変更（命令・マクロ）
// p1     : オブジェクトハンドル
// p2(25) : 中間域の下限値(int)
// p3(40) : 中間域の上限値(int)
// p4(2)  : 下位域の状態 (PBST_ERROR  (赤色))
// p5(3)  : 中間域の状態 (PBST_PAUSED (黄色))
// p6(1)  : 上位域の状態 (PBST_NORMAL (緑色))
    pbsetst2 objhwnd, under, higher, p4, p5, p6


;---------------------------------------
;マーキーの操作
;---------------------------------------

// マーキーの操作（命令・マクロ）
// p1     : オブジェクトハンドル
// p2     : マーキー(0 = 停止, 1 = 再生)
// p3(30) : アニメーション更新間隔(ms)
    pbmarq objhwnd, p2, p3
~~~

</details>

<br>

## 必要環境（Environment）

* Windows10, 11
* HSP3.6以上

<br>

## 使用言語（Coding Language）

* [Hot Soup Processor(HSP3)](https://hsp.tv/)

<!-- <br> -->

## 開発環境（Development environment）

* Windows11 Pro 22H2 x64
* Hot Soup Processor 3.7beta3
* Visual Studio Code ver 1.73.1

<!-- <br> -->

## LICENSE

本ソフトウェアおよび関連文書のファイル（以下「ソフトウェア」）の複製を取得するすべての人に対し、ソフトウェアを無制限に扱うことを無償で許可します。

これには、ソフトウェアの複製を使用、複写、変更、結合、掲載、頒布、サブライセンス、および/または販売する権利、およびソフトウェアを提供する相手に同じことを許可する権利も無制限に含まれます。


ソフトウェアは「現状のまま」で、明示であるか暗黙であるかを問わず、何らの保証もなく提供されます。ここでいう保証とは、商品性、特定の目的への適合性、および権利非侵害についての保証も含みますが、それに限定されるものではありません。

作者または著作権者は、契約行為、不法行為、またはそれ以外であろうと、ソフトウェアに起因または関連し、あるいはソフトウェアの使用またはその他の扱いによって生じる一切の請求、損害、その他の義務について何らの責任も負わないものとします。

<br>

## 更新履歴（Change Log）

### ver 0.2.0
2022/11/12
* 情報取得関数 `pbinfo関数` の新規追加。 それに伴い次の関数を削除

    * pbgetp  &nbsp; (現在位置の取得)
    * pbgetst &nbsp; (状態の取得)

### ver 0.1.1
2022/11/09
ディレクトリの変更

### ver 0.1.0
2022/11/07 初公開
