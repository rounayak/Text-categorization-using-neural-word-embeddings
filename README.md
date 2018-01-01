# Text-classification-on-word-embeddings
This is a practical implementation implementing neural networks on top of  fasttext as well as word2vec word embeddings.

The entire concept is a unsupervisedl earning approach.

There are two different pipelines :
A. Word2Vec
B.FastText


Please follow the sequence for individual pipelines:


(A).Word2Vec
 
 
1. Word2Vec(Training).py- This is the code that needs to be executed to be first for training Word2Vec

Next one of the three 3 steps

2(a). Basic Word2Vec execution.py- This is the basic execution of the trained Word2Vec model on the data corpus using the dictionary defined in the code.

2(b). LSTM execution(Word2Vec).py- This is LSTM execution of the trained Word2Vec model on the data corpus using the dictionary defined in the code.
 
 2(c). CNN execution(Word2Vec).py- This is the CNN execution of the trained Word2Vec model on the data corpus using the dictionary defined in the code.
 
 

(B). FastText

There are two possible training methods for Word embeddings
1(a).cbow
1(b).skipgram

1(a). fasttext cbow trainer.py - This is the code that needs to be executed for training the cbow implementation of fasttext



1(b). fasttext skipgram trainer.py - This is the code that needs to be executed for training the skipgram implementation of fasttext 



2.(a). FT execution basic.py - This is the basic execution of the trained FastText model on the data corpus using the dictionary defined in the code.

2(b).CNN execution(FastText).py -  This is the CNN execution of the trained FastText model on the data corpus using the dictionary defined in the code.
 




