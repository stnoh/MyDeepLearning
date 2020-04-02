## MyDeepLearning/Converter

変換が必要になった際，参考になりそうな資料を集めています．  
- まず，[ysh329@githubの作成したリスト](https://github.com/ysh329/deep-learning-model-convertor)をみましょう．大概のものが載っているはずです．  

### Normalized VGG-19 (Caffe-v1 .caffemodel -> Keras .h5)

### TL;DR
Download from my bitbucket repository (**78.2MB**): [[link]](https://bitbucket.org/stnoh/Maya-PythonPackages/raw/master/models/vgg19_weights_normalized.h5)

### 解説

かの有名な，Gatysらの Style Transfer [[CVPR16]](https://www.cv-foundation.org/openaccess/content_cvpr_2016/html/Gatys_Image_Style_Transfer_CVPR_2016_paper.html) や Texture synthesis [[NeurIPS15]](https://papers.nips.cc/paper/5633-texture-synthesis-using-convolutional-neural-networks) に使われた Normalized VGG-19 をkeras版に変換したことについての内容．  

0. まず，VGG-19 自体は Oxford Visual Geometry Group が2014年発表した [[link]](http://www.robots.ox.ac.uk/~vgg/research/very_deep/) もので，そのページから様々なデータが得られると思う．しかし，今回の内容に関してそこまで有効な情報はない．  
2. 実質重要なところはここから．Gatysらの論文では，この VGG-19 モデルから top layer (つまり， fc1-fc2-softmax) を除去し，CNN層は何かしら normalized している．  
    - 本来 VGG-19 の Pooling 層は Max であったが，それを Average に変えたと言っている．そこで，上記の VGG ページから得た [.prototxt](https://gist.githubusercontent.com/ksimonyan/3785162f95cd2d5fee77/raw/f02f8769e64494bcd3d7e97d5d747ac275825721/VGG_ILSVRC_19_layers_deploy.prototxt) 定義ファイルを参考に編集し，定義ファイルを作成した: [VGG_ave_pool_deploy.prototxt](./VGG_ave_pool_deploy.prototxt)  
    - モデルは [BethgeLabのページ](http://bethgelab.org/media/uploads/deeptextures/)にある **vgg_normalised.caffemodel (78.2MB)** でダウンロードできる．詳細はちょっと分からないけど，実際 weight を表示してみると元のモデルから数値が定数倍に減ったり増えたりしている．  
3. Caffe は C++ 仕様なので，インストールに労力がかかる．そこで，手軽に使える keras に変換しようとした．そのような変換をしてくれる [caffe2keras](https://github.com/qxcv/caffe2keras) というのがあって，早速試したものの，エラーが発生．問題は恐らく，caffe2keras は Caffe-v2 仕様しか受け入れない [[issue]](https://github.com/qxcv/caffe2keras/issues/6) こと．  
4. 定義ファイルである .prototxt を Caffe-v2 仕様に合わせる．  
    - 仕様変更用のパッチ: [VGG_ave_pool_deploy.prototxt.patch](./VGG_ave_pool_deploy.prototxt.patch)  
    - 変更された定義ファイル: [VGG_ave_pool_deploy_patched.prototxt](./VGG_ave_pool_deploy_patched.prototxt)  
5. 最後に，caffe2kerasを使って .caffemodel を keras 用の .h5 に変換．  
    > python -m caffe2keras VGG_ave_pool_deploy_patched.prototxt vgg_normalised.caffemodel vgg19_normalized_notop.h5
