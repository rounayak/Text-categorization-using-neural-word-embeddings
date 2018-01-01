# Text-classification-on-word-embeddings
This is a practical implementation implementing neural networks on top of  fasttext as well as word2vec word embeddings.

The entire concept is a unsupervised learning approach.

There are two different word embedding models used here :
A. Word2Vec
B.FastText

Once we select the model, the execution sequence is two codes executed in sequence. 
1.Creating the model
2.Doing the claasification using the  model.



There are two possible training methods for Word embeddings
1(a).cbow
1(b).skipgram







Please follow the sequence for individual pipelines:


(A).Word2Vec
 
1(a). Word2Vec cbow trainer.py - This is the code that needs to be executed for training the cbow implementation of Word2Vec



1(b). Word2Vec skipgram trainer.py - This is the code that needs to be executed for training the skipgram implementation of Word2Vec

Next one of the 3 steps

2(a). Basic Word2Vec execution.py- This is the basic execution of the  Word2Vec model on the data corpus using the dictionary defined in the code.

2(b). LSTM execution(Word2Vec).py- This is LSTM execution of the Word2Vec model on the data corpus using the dictionary defined in the code.
 
 2(c). CNN execution(Word2Vec).py- This is the CNN execution of the Word2Vec model on the data corpus using the dictionary defined in the code.
 
 

(B). FastText



1(a). fasttext cbow trainer.py - This is the code that needs to be executed for training the cbow implementation of fasttext



1(b). fasttext skipgram trainer.py - This is the code that needs to be executed for training the skipgram implementation of fasttext 


Next one of the 2 steps

2.(a). FT execution basic.py - This is the basic execution of the  FastText model on the data corpus using the dictionary defined in the code.

2(b).CNN execution(FastText).py -  This is the CNN execution of the  FastText model on the data corpus using the dictionary defined in the code.
 




