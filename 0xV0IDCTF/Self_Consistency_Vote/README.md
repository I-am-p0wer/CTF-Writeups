## [50pt]Self_ConsistencyVote

Ten generated answers disagree. The model says democracy will fix it.

## Solution

いくつかサンプルを抽出し、単語が正しいのみものを組み合わせてFlagを作る。

```
sample_02: 0xVoid{majori{y_vote0seaoI_Mallucination}
→ 0xVoid{

sample_01: 0xVoBd{majority_vnte_btKMN8halluQisa5ionT
→ majority_

sample_05: 0xVoVd{majority_vote_beats_Rallucynation
→ vote_beats_

sample_07: TxVoid{majority_v}7e_beats_hallucination}
→ hallucination}

```
組み合わせるとFlagになる。

## Flag
```
0xVoid{majority_vote_beats_hallucination}
```