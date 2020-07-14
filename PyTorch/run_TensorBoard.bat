@ECHO OFF
set PATH=%PATH%;C:\ProgramData\Anaconda3\Scripts
CALL C:\ProgramData\Anaconda3\Scripts\activate.bat venv_pt
START tensorboard --logdir=./runs/fashion_mnist_experiment_1 --port 6006
EXIT