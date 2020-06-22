# The universal workflow of machine learning

- このページは["Deep Learning with Python"](https://www.amazon.com/Deep-Learning-Python-Francois-Chollet/dp/1617294438/)の4.5章を読みながら要約したものです．  
- この本やkeras frameworkに限らず，多様な場面で使えそうな情報なのでわざわざ要約を作りました．  


## 4.5.1 Defining the problem and assembling a dataset

まず，問題を正しく定義すべきである．  

- **データ**: 入力データは何か？何を予測(=出力データ)しなければならないか？  
  何かを予測するには，利用可能な入力データのみで行うしかない．例えば，映画の情緒を予測するには，映画のレビューデータと情緒のアノテーションデータがなければ適用不可能である．即ち，この段階では（別途，お金を払ってアノテーションしてくれる人を雇わない限り）データの利用可能性が制約事項になる．  
- **問題**: 解きたい問題はどのような問題なのか？  
  Binary classification? Multiclass classfication? Scalar regression? Vetor regression? Multiclass, multilabel classification? そうでもなければ，clustering, generation, または強化学習(reinforcement learning)？  

次のステップに移る前に，以下の内容が定かであるかを確かめよう．  
機械学習を用いることは，以下のことを自然と仮定していることになる．  

- 出力は与えられた入力だけで予測可能なものである  
- 入力と出力の関係を導けるほどデータ数のが十分である  

> この「十分」について疑問を抱いてしまう．本に書かれているような内容は(知っている人にとっては)当然過ぎてあまり参考にならない．私が疑問になるのは，実際解けそうな問題についても，どれほどの数があれば十分であるか？とのこと．大雑把な表現でなく，定量的に測れないのか？  


## 4.5.2 Choosing a measure of success

要点: 成功/失敗を測る尺度(metric)を決め，それに似合う損失関数(loss function)を決める


## 4.5.3 Deciding on an evaluation protocol

大概の場合，１番目の選択肢で十分であろう．

1. a hold-out validation: データ数が十分多い場合．  
2. K-fold cross-validation: データ数が十分でない場合.  
3. iterated K-fold validation: 更に精度を高めたい場合.  

> 個人的な疑問: 幾らデータがあれば十分で，幾らは十分でないと言えるのか？


## 4.5.4 Preparing your data

- テンソル型に落とす (trivial)  
- [-1.0:1.0]または[0.0:1.0]のような**小さい値にスケーリング**する  
- 特徴量の範囲が異なる場合，**正規化**を行う.  
- 特に問題規模が小さい場合，特徴量の加工が必要かも知れない  


## 4.5.5 Developing a model that does better than a baseline

当然ながら，扱う問題に適切な活性化関数と損失関数を選ぶべき．以下の表はその一例である．  

| 問題 | 出力層の活性化関数 <br> (last-layer activation) | 損失関数 <br> (loss function) |
| ---- | ----------------------------------------- | ------------------------ |
| 二値分類 <br> (binary classification) | sigmoid | binary_crossentropy |
| 多クラス，ラベル分類 <br> (multiclass, single-label classification) | softmax | categorical_crossentropy |
| 多クラス，多ラベル分類 <br> (multiclass, multi-label classification) | sigmoid | binary_crossentropy |
| 回帰 (範囲が定まっていない場合) | \<無し\> | mse (mean squared error) |
| 回帰 ([0.0:1.0] 範囲内に落とす場合) | sigmoid | mse または binary_crossentropy |


## 4.5.6 Scaling up: developing a model that overfits

あるモデルにおいて最も適切な状態とは，**過小学習(underfitting)と過剰学習(overfitting)の間にある状態**である．  
その境界線がどこにあるかを調べるには，モデルを過学習状態まで持っていくしかない．  
そのために用いられる方法は以下のようになる:  

- 層を増やす  
- 層のパラメータ数を増やす  
- 訓練のエポック数を増やす  

> この過程の典型例は[Section 3.6](./Keras/Sect3.6-Boston.ipynb)にも出ている内容だと思う．  


## 4.5.7 Regularizing your model and tuning your hyperparameters

ここが恐らく，最も時間のかかる作業だろう．モデルを修正，訓練，検証データに対して評価し，またモデルを修正することを繰り返す．  
試すべき内容を要約すると以下のようになる:  

- dropout層を追加  
- 層を増やすか減らす等，異なる構造(architectures)を試す  
- L1/L2 正則化(regularization)を入れる  
- 最適なhyperparameter設定を探す  
- **(付加的に) 特徴量の加工**: 新しい特徴の追加，または重要で無さそうな特徴の削除  

一応満足のいく設定が導けたら，最終的に使える全てのデータ(訓練及び検証データ)を用いて最終的な訓練を行う．  

> この過程の典型例は[Section 3.6](./Keras/Sect3.6-Boston.ipynb)にも出ている内容だと思う．  

もし，その結果が検証に比べあまりにもよくなかったら，それは検証過程があまり妥当でないか，検証データに過剰適応してしまったことを意味する．この場合，もっと信頼性のある検証方法(iterated K-fold法など)を用いる必要がある．  
