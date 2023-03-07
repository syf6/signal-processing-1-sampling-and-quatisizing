clc;clear;close all
%Music quantisation 
[y,Fs] = audioread('file_example_MP3_700KB.mp3');

y2=((y+1)/2)*15; % add 1 to make [-1,1] to [0,2], /2 then 15 to get 16 integers [0,15]
y3=(round(y2)/15)*2-1; 

filename='file_example_MP3_700KB.wav';
audiowrite(filename,y3,Fs);