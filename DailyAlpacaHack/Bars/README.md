## [Web][Easy]Bars

Bars, bars, and more bars.

## Solution

フラグがとにかく長い。
スクロールも右クリックもキーボードも全く使えなかったが、
curlコマンド使ってアクセスするとページのフラグを見ることができた。

```
...
...
  <pre>FLAG: Alpaca{|1||I|l1|IIIl1|1lII|1II|1|I||||1IIlII|11I11II|l11|111l1lllI|I|1|lIIII1I1ll|l1|l1Il1I|11IIl1|1l1IlIII|I1I1I|llllll|l11l1ll11II||||ll11|1lIl11llI1Ill||I1||1|11llIlIIII|IIll1II|lll|I1l||IIIl1I11|1I|III|II|1||1III1I1lllI1l1l|I|1l1lI|II|1|||l|Il|IlII|ll|lIlI1IlIl1Ill11|II111||lI|lII|||IllllIII|l||l|l1Ill}</pre>
...
...
```

ソースを見るとあらゆる操作がJavaScriptによって無効化されていた。

・キーボード操作全般（keydown / keypress / keyup）

・マウスホイールによるスクロール（wheel）

・タッチ操作（touchstart / touchmove によるスクロールやタップ等）

・テキストの選択（selectstart）

・要素のドラッグ（dragstart）
・コピー（copy）

・カット（cut）

・ペースト（paste）

・画面スクロールの維持（scrollイベント発生時に強制的に最上部へ巻き戻し）


無効化されていてもソースを見る方法はある。

## Flag

```
Alpaca{|1||I|l1|IIIl1|1lII|1II|1|I||||1IIlII|11I11II|l11|111l1lllI|I|1|lIIII1I1ll|l1|l1Il1I|11IIl1|1l1IlIII|I1I1I|llllll|l11l1ll11II||||ll11|1lIl11llI1Ill||I1||1|11llIlIIII|IIll1II|lll|I1l||IIIl1I11|1I|III|II|1||1III1I1lllI1l1l|I|1l1lI|II|1|||l|Il|IlII|ll|lIlI1IlIl1Ill11|II111||lI|lII|||IllllIII|l||l|l1Ill}
```