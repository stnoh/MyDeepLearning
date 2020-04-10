# MyDeepLearning

私個人の勉強と備忘録目的を兼ねた，ディープラーニング関連の環境設定や実装物などを挙げておくものです．

- [Converter](./Converter/README.md): 何かしらのライブラリで使われるモデルを，他のライブラリで使えるようにするための変換についてです．  
- [keras](./Keras/README.md): keras 関連についての環境構築と実装における注意点など．  
- [PyTorch](./PyTorch/README.md): PyTorch 関連．  

## Anaconda [[link]](https://www.anaconda.com/distribution/)

Windows で Python 環境を構築するには Anaconda が一番やりやすい．  
現在 **Anaconda3-2020.02-Windows-x86_64.exe** で環境を整えている．  
バージョンが上がったら具体的に何が変わっていくのかは正直把握していないので，  
使っている PC 全てに統一して同じバージョンを入れている;;;


## GraphViz [[link]](https://graphviz.gitlab.io/_pages/Download/Download_windows.html)

Windows で GraphViz を使って可視化するには，ちょっとした設定が必要となる．**システム環境変数** に **GRAPHVIZ_DOT 項目を追加**する必要がある．
- **辿りつく方法**: コントロール パネル > システムとセキュリティ > システム > システムの詳細設定 > 詳細設定タブ > 環境変数 > システム環境変数  
- 新規のパスを追加する．基本は以下のようなパスになっているはず．  
    > C:\\Program Files (x86)\\Graphviz2.38\\bin\\dot.exe


## JupyterNotebook

Anacondaでインストールしたら，普通に**Anaconda Navigator**の初期画面からインストールできる．これを利用してインストールすると，基本的なワーキングフォルダが個別ユーザのDocuments以下になってしまう．これを直すには，プロパティからアクセスできるリンク先を修正する．  

```diff
C:\ProgramData\Anaconda3\python.exe C:\ProgramData\Anaconda3\cwp.py 
- C:\Users\{ユーザ名}\.conda\envs\{venv名} C:\Users\{ユーザ名}\.conda\envs\{venv名}\python.exe C:\Users\{ユーザ名}\.conda\envs\{venv名}\Scripts\jupyter-notebook-script.py
+ %USERPROFILE%\.conda\envs\{venv名} %USERPROFILE%\.conda\envs\{venv名}\python.exe %USERPROFILE%\.conda\envs\{venv名}\Scripts\jupyter-notebook-script.py
- "%USERPROFILE%/"
+ {目標しているフォルダ}
```
