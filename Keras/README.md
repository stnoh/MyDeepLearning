## MyDeepLearning/Keras

### Installation

幾つかの注意点をメモしておきます．  

- tensorflow version: 大概問題を起こすのは keras 部分じゃなくてバックエンドである [tensorflow] 側．なので，tensorflow の使っている CUDA バージョンが一致するかをちゃんと確認すべき．  
- **Python 3.6**: もし， [CNTK]をバックエンドとして利用するには， Python を3.6以下に設定しておくべきです [[link]](https://github.com/microsoft/CNTK/issues/3522)．Anaconda 等で venv を作る際に Python version に注意しよう (最近は 3.7 が基本になっている)．  

[tensorflow]:https://www.tensorflow.org/guide/versions
[CNTK]:https://docs.microsoft.com/en-us/cognitive-toolkit/

### Setting (latest)

- Anaconda: Anaconda3-2020.02-Windows-x86_64.exe  
- CUDA 10.0 (V10.0.130)  
- tensorflow-1.15.0 (from conda)  
- keras-2.3.1 (from conda)  
- CNTK-2.7 (latest, from PIP)  
    > pip install cntk cntk-gpu  

### Setting (previous)

こちらのセッティングは，以前 Maya で keras (+tensorflow) を動かした際に使った設定．  
当時(未だ？) Maya は Python 2.7 しか支援しておらず，使った年代に比べてかなり古い API を使っていた．  

- Anaconda: Anaconda3-2019.10-Windows-x86_64.exe  
- [CUDA 9.0 (V9.0.176)](https://developer.nvidia.com/cuda-90-download-archive)  
- tensorflow-1.11.0 (from conda, 但し Python 2.7 用は custom compile: [[link]](https://bitbucket.org/stnoh/maya-pythonpackages) )  
- keras-2.2.5 (from conda)  
- CNTK-2.7 (from PIP)  
