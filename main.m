%
%  ���ߣ���Ԫ��  ���ڣ�2016-10-03
%  �����г���
%

%%  ʵ��������
case1 = firstOrder;

%%  ��������ͼ��
case1.plot1('01.png');
case1.plot2('02.png');
case1.plot3('03.png');

%%  ��T=1ʱ��ͼ��
case1.T = 1;
case1.plot1('04.png');
case1.plot2('05.png');
case1.plot3('06.png');

%%  ��x����Ϊ0.001ʱ��ͼ��
case1.T = 2;
case1.Delta_x = 0.001;
case1.plot1('07.png');
case1.plot2('08.png');
case1.plot3('09.png');

%%  ��t����Ϊ0.001ʱ��ͼ��
case1.Delta_x = 0.01;
case1.Delta_t = 0.001;
case1.plot1('10.png');
case1.plot2('11.png');
case1.plot3('12.png');

%%  ��aΪ-1ʱ��ͼ��
case1.Delta_t = 0.01;
case1.A = -1;
case1.plot1('13.png');
case1.plot2('14.png');
case1.plot3('15.png');

%%  ��aΪ2ʱ��ͼ��
case1.A = 2;
case1.plot1('16.png');
case1.plot2('17.png');
case1.plot3('18.png');

%%  ��ճ�����ͼ�� ճ��Ӱ��С
case1.A = 1;
case1.Delta_x = 0.1;
case1.Delta_t = 0.001;
case1.plot4('19.png');
case1.A = -1;
case1.plot4('20.png');

%%  ��ճ�����ͼ�� ճ��Ӱ����
case1.A = 1;
case1.Delta_x = 0.1;
case1.Delta_t = 0.01;
case1.plot4('21.png');
case1.A = -1;
case1.plot4('22.png');

%%  ��ճ�����ͼ�� ճ��Ӱ���
case1.A = 1;
case1.Delta_x = 0.1;
case1.Delta_t = 0.1;
case1.plot4('23.png');
case1.A = -1;
case1.plot4('24.png');

%%  ��ճ�����ͼ�� ճ��Ӱ�쳬��
case1.A = 1;
case1.Delta_x = 0.01;
case1.Delta_t = 0.01;
case1.plot4('25.png');
case1.A = -1;
case1.plot4('26.png');