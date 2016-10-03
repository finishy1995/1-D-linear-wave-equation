%
%  作者：王元恺  日期：2016-10-03
%  主运行程序
%

%%  实例化对象
case1 = firstOrder;

%%  生成条件图像
case1.plot1('01.png');
case1.plot2('02.png');
case1.plot3('03.png');

%%  当T=1时的图像
case1.T = 1;
case1.plot1('04.png');
case1.plot2('05.png');
case1.plot3('06.png');

%%  当x增量为0.001时的图像
case1.T = 2;
case1.Delta_x = 0.001;
case1.plot1('07.png');
case1.plot2('08.png');
case1.plot3('09.png');

%%  当t增量为0.001时的图像
case1.Delta_x = 0.01;
case1.Delta_t = 0.001;
case1.plot1('10.png');
case1.plot2('11.png');
case1.plot3('12.png');

%%  当a为-1时的图像
case1.Delta_t = 0.01;
case1.A = -1;
case1.plot1('13.png');
case1.plot2('14.png');
case1.plot3('15.png');

%%  当a为2时的图像
case1.A = 2;
case1.plot1('16.png');
case1.plot2('17.png');
case1.plot3('18.png');

%%  带粘性项的图像 粘性影响小
case1.A = 1;
case1.Delta_x = 0.1;
case1.Delta_t = 0.001;
case1.plot4('19.png');
case1.A = -1;
case1.plot4('20.png');

%%  带粘性项的图像 粘性影响中
case1.A = 1;
case1.Delta_x = 0.1;
case1.Delta_t = 0.01;
case1.plot4('21.png');
case1.A = -1;
case1.plot4('22.png');

%%  带粘性项的图像 粘性影响大
case1.A = 1;
case1.Delta_x = 0.1;
case1.Delta_t = 0.1;
case1.plot4('23.png');
case1.A = -1;
case1.plot4('24.png');

%%  带粘性项的图像 粘性影响超大
case1.A = 1;
case1.Delta_x = 0.01;
case1.Delta_t = 0.01;
case1.plot4('25.png');
case1.A = -1;
case1.plot4('26.png');