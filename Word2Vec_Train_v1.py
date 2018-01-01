
# coding: utf-8

# In[27]:

import gensim, logging
import os
#logging.basicConfig(format='%(asctime)s : %(levelname)s : %(message)s', level=logging.INFO)
 
class MySentences(object):
    def __init__(self, dirname):
        self.dirname = dirname
 
    def __iter__(self):
        for fname in os.listdir(self.dirname):
            for line in open(os.path.join(self.dirname, fname), encoding='utf-8'):
                yield line.split()
 
sentences = MySentences('C:/Users/rounayak/Documents/Fuso/word2vec/train')
                    


# In[23]:

iter(sentences)


# In[40]:

model = gensim.models.Word2Vec(sentences, size=300, window=5, min_count=3, workers=4)


# In[41]:

model.save('C:/Users/rounayak/Documents/Fuso/word2vec/Word2Vec')


# In[37]:



