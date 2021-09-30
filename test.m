clc 
clear all
close all

rE = zeros(20000,1);
VE = zeros(20000,1);

T = csvread('t-gelio.csv');
for i = 1:1:20000
[rE,VE] = planetEphemeris(T(i)/24/3600,'Sun','Earth');
end