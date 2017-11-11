function  M  = TPTC( mode, n, beta1, zeta, theta, lambda1, lambda2, k, lambda3, lambda4, lambda5, lambda6, sigma, N, epsilon )
%TPTC = Trash's Processing Total Cost 垃圾处理总成本
% n 城市的户数；beta1 每户平均每年生成的垃圾量
% zeta 户分类补贴（元/kg）；theta 每kg垃圾运输的费用
% lambda1 填埋费用（元/kg）；lambda2 焚烧费用（元/kg）
% k 发电量（kW·h/kg）；lambda3 发电补贴（元/kg）
% lambda4 湿垃圾生物处理费用（元/kg）；lambda5 产能补贴（元/kg）
% lambda6 人工分选的费用（元/kg）；sigma 二噁英致癌率
% N 城市人口数；epsilon因环境污染损失的金额


% mode 处理垃圾的多种方式
% mode = 1 混合收集 + 全部焚烧 + 灰渣填埋
% mode = 2 源头分类收集 + 湿垃圾生物处理 + 干垃圾焚烧
% mode = 3 混合收集 + 末端分类 + 湿垃圾生物处理 + 干垃圾焚烧
% mode = 4 混合收集 + 全部填埋


% B1 干垃圾量；B2 湿垃圾量
% 干垃圾占全部垃圾比例为 p1 ，焚烧后的干垃圾占原干垃圾比例为 p2 。
p1 = 0.6;
p2 = 0.5;
B1 = n * beta1 * p1;
B2 = n * beta1 - B1;
B1_ = B1 * p2;


% 分类收集
% 户分类补贴
m1 = n * beta1 * zeta;


% 运输成本
m2 = n * beta1 * theta;


% 处理费用
% 直接填埋
m3 = n * beta1 * lambda1;
% 干垃圾焚烧
m4 = lambda2 * B1 + lambda3 * k * B1 + lambda1 * B1_;
% 湿垃圾生物处理
m5 = lambda4 * B2 + lambda5 * B2;
% 混合收集，末端分类为干湿两部分
m6 = lambda6 * n * beta1 + m4 + m5;
% 全部焚烧 + 灰渣填埋
m8 = lambda2 * n * beta1 + lambda1 * n * beta1 * p2;



% 对环境的影响
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
        msgbox('输入错误，请重新来过');
end


end

