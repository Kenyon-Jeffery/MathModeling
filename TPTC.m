function  M  = TPTC( mode, n, beta1, zeta, theta, lambda1, lambda2, k, lambda3, lambda4, lambda5, lambda6, sigma, N, epsilon )
%TPTC = Trash's Processing Total Cost ���������ܳɱ�
% n ���еĻ�����beta1 ÿ��ƽ��ÿ�����ɵ�������
% zeta �����ಹ����Ԫ/kg����theta ÿkg��������ķ���
% lambda1 ������ã�Ԫ/kg����lambda2 ���շ��ã�Ԫ/kg��
% k ��������kW��h/kg����lambda3 ���粹����Ԫ/kg��
% lambda4 ʪ�������ﴦ����ã�Ԫ/kg����lambda5 ���ܲ�����Ԫ/kg��
% lambda6 �˹���ѡ�ķ��ã�Ԫ/kg����sigma ���fӢ�°���
% N �����˿�����epsilon�򻷾���Ⱦ��ʧ�Ľ��


% mode ���������Ķ��ַ�ʽ
% mode = 1 ����ռ� + ȫ������ + ��������
% mode = 2 Դͷ�����ռ� + ʪ�������ﴦ�� + ����������
% mode = 3 ����ռ� + ĩ�˷��� + ʪ�������ﴦ�� + ����������
% mode = 4 ����ռ� + ȫ������


% B1 ����������B2 ʪ������
% ������ռȫ����������Ϊ p1 �����պ�ĸ�����ռԭ����������Ϊ p2 ��
p1 = 0.6;
p2 = 0.5;
B1 = n * beta1 * p1;
B2 = n * beta1 - B1;
B1_ = B1 * p2;


% �����ռ�
% �����ಹ��
m1 = n * beta1 * zeta;


% ����ɱ�
m2 = n * beta1 * theta;


% �������
% ֱ������
m3 = n * beta1 * lambda1;
% ����������
m4 = lambda2 * B1 + lambda3 * k * B1 + lambda1 * B1_;
% ʪ�������ﴦ��
m5 = lambda4 * B2 + lambda5 * B2;
% ����ռ���ĩ�˷���Ϊ��ʪ������
m6 = lambda6 * n * beta1 + m4 + m5;
% ȫ������ + ��������
m8 = lambda2 * n * beta1 + lambda1 * n * beta1 * p2;



% �Ի�����Ӱ��
m7 = N * sigma * epsilon;


switch mode
    case 1
        M = m2 + m8 + m7;
    case 2
        M = m1 + m4 + m5 + m7 + m2;
    case 3
        M = m2 + m6 + m7;
    case 4
        M = m2 + m3;
    otherwise
        msgbox('�����������������');
end


end

