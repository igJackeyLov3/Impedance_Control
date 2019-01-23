%% Copyright (c) 2019. 
%% All rights reserved.
%% Author:SRQ

clc
clear all
close all

%% �����迹ģ�Ͳ�������
Md = [0,50,100,150,200];
Bd = [35,45,55,65,75,100];
Kd = [0,0.1,0.3,0.5,0.7,1];

%% ************************Md��Bd��Kd�������Է���************************%% 
%% �̶�Bd��Kd��ѡ��ͬ��Md���з���
n1 = numel(Md); % ����Md��Ԫ������
Data_Save_t_1 =  cell(1,n1); % ����Ԫ�����鱣��ʱ�䣨ÿ��Ԫ�ظ�����ͬ��
Data_Save_X_1 =  cell(1,n1); % ����Ԫ�����鱣��λ��
Data_Save_F_1 =  cell(1,n1); % ����Ԫ�����鱣��Ӵ���
Bd1 = 55; Kd1 = 0; % �̶�Bd��Kd
for i = 1:n1
    Md1 = Md(i);
    Md0 = Md1; Bd0 = Bd1; Kd0 = Kd1; % ΪSimulink�в�����ֵ
    sim('Position_Based_Impedance_Control'); % ����Simulink�����ͼ
    Data_Save_t_1{i} = tout; Data_Save_X_1{i} = X; Data_Save_F_1{i} = F; % ��������
end

%% �̶�Md��Kd��ѡ��ͬ��Bd���з���
n2 = numel(Bd); % ����Bd��Ԫ������
Data_Save_t_2 =  cell(1,n2); % ����Ԫ�����鱣��ʱ�䣨ÿ��Ԫ�ظ�����ͬ��
Data_Save_X_2 =  cell(1,n2); % ����Ԫ�����鱣��λ��
Data_Save_F_2 =  cell(1,n2); % ����Ԫ�����鱣��Ӵ���
Md2 = 0.5; Kd2 = 0; % �̶�Md��Kd
for i = 1:n2
    Bd2 = Bd(i);  
    Md0 = Md2; Bd0 = Bd2; Kd0 = Kd2; % ΪSimulink�в�����ֵ
    sim('Position_Based_Impedance_Control'); % ����Simulink�����ͼ
    Data_Save_t_2{i} = tout; Data_Save_X_2{i} = X; Data_Save_F_2{i} = F; % ��������
end
%% �̶�Md��Bd��ѡ��ͬ��Kd���з���
n3 = numel(Kd); % ����Kd��Ԫ������
Data_Save_t_3 =  cell(1,n3); % ����Ԫ�����鱣��ʱ�䣨ÿ��Ԫ�ظ�����ͬ��
Data_Save_X_3 =  cell(1,n3); % ����Ԫ�����鱣��λ��
Data_Save_F_3 =  cell(1,n3); % ����Ԫ�����鱣��Ӵ���
Md3 = 0.5; Bd3 = 55; % �̶�Md��Bd
for i = 1:n3
    Kd3 = Kd(i);  
    Md0 = Md3; Bd0 = Bd3; Kd0 = Kd3; % ΪSimulink�в�����ֵ
    sim('Position_Based_Impedance_Control'); % ����Simulink�����ͼ
    Data_Save_t_3{i} = tout; Data_Save_X_3{i} = X; Data_Save_F_3{i} = F; % ��������
end

%% ��������
save Data_Save_t_1; save Data_Save_X_1; save Data_Save_F_1;
save Data_Save_t_2; save Data_Save_X_2; save Data_Save_F_2;
save Data_Save_t_3; save Data_Save_X_3; save Data_Save_F_3;

%% ��ͼ
Plot_Figure;