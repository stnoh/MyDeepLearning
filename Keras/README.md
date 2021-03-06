## MyDeepLearning/Keras

### Before Installation

幾つかの注意点をメモしておきます．  

- tensorflow version: 大概問題を起こすのは keras 部分じゃなくてバックエンドである [tensorflow] 側．なので，tensorflow の使っている CUDA バージョンが一致するかをちゃんと確認すべき．  
- **Python 3.6**: もし， [CNTK]をバックエンドとして利用するには， Python を3.6以下に設定しておくべきです [[link]](https://github.com/microsoft/CNTK/issues/3522)．Anaconda 等で venv を作る際に Python version に注意しよう (最近は 3.7 が基本になっている)．  
- CNTK のインストールするには以下のように簡単に行える．  
    > pip install cntk cntk-gpu  


[tensorflow]:https://www.tensorflow.org/guide/versions
[CNTK]:https://docs.microsoft.com/en-us/cognitive-toolkit/

### Setting

Keras の backend 指定(ex. CNTKへの変更)は json ファイルで行える．基本経路は次のようになる:    
> C:\\Users\\{ユーザ名}\\.keras\\keras.json  

```json
{
    "floatx": "float32",
    "epsilon": 1e-07,
    "backend": "tensorflow",
    "image_data_format": "channels_last"
}
```

### Installation (laptop)

こちらのセッティングは，以前 Maya で keras (+tensorflow) を動かした際に使った設定．  
当時(未だ？) Maya は Python 2.7 しか支援しておらず，使った年代に比べてかなり古い API を使っていた．  

- [CUDA 9.0 (V9.0.176)](https://developer.nvidia.com/cuda-90-download-archive)  
- tensorflow-1.12.0 (by **conda**)  
- keras-2.3.1 (by **conda**)  
- CNTK-2.7 (latest, by **pip**)  

### Installation (desktop)

- [CUDA 10.1 (V10.1.243)](https://developer.nvidia.com/cuda-10.1-download-archive-update2)  
- tensorflow-2.1.0 (by **conda**)  
- keras-2.3.1 (by **conda**)  
- CNTK-2.7 (latest, by **pip**)  

---

### Tried Installation

### Installation (previous)

こちらのセッティングは，以前 Maya で keras (+tensorflow) を動かした際に使っていた設定．  
当時(未だ？) Maya は Python 2.7 しか支援しておらず，使った年代に比べてかなり古い API を使っていた．  
Python 2.7 用の wheel に関しては，私の custom compile を参考すること: [[link]](https://bitbucket.org/stnoh/maya-pythonpackages)  

- [CUDA 9.0 (V9.0.176)](https://developer.nvidia.com/cuda-90-download-archive)  
- tensorflow-1.11.0 (from conda)  
- keras-2.2.5 (from conda)  
- CNTK-2.7 (from **pip**)  

ついでに，Python 3の方は **Anaconda3-2019.10-Windows-x86_64.exe** でインストールしていた．  

#### Installation (laptop, CUDA 10.0)

- **CUDA 10.0 (V10.0.130)**  
- tensorflow-1.15.0 (from **conda**)  
- keras-2.3.1 (from **conda**)  
- CNTK-2.7 (from **pip**)  

この設定ではkerasでGPUが動くものの，PyTorchでGPUが動かない問題があってやめた．  

#### Installation (laptop, CUDA 10.1)

ドライバーなどはインストールできるが，その後，tensorflowがまともに動作しないのでやめた．  
