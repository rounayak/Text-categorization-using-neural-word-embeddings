# -*- coding: utf-8 -*-
"""
Created on Wed Nov 29 18:26:54 2017

@author: rounayak
"""
import fasttext
 
# CBOW model
model = fasttext.skipgram('C:/Users/rounayak/Documents/Fuso/word embedding/fasttext/skip gram/summing/train/trainset.txt', 'model')
print (model.words)
