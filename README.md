# MyDeepLearning

私個人の勉強と備忘録目的を兼ねた，ディープラーニング関連の環境設定や実装物などを挙げておくものです．

- [Converter](./Converter/README.md): 何かしらのライブラリで使われるモデルを，他のライブラリで使えるようにするための変換についてです．  
- [keras](./Keras/README.md): keras 関連についての環境構築と実装における注意点など．  


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
