classdef firstOrder
%
%  ���ߣ���Ԫ��  ���ڣ�2016-10-03
%  ����һ��΢��ͼ
%

    %%  ��������
    properties (Access = 'public')
        T = 2.0;
        X1 = -10;
        X2 = 10;
        Delta_x = 0.01;
        Delta_t = 0.01;
        A = 1;
    end
    
    %%  ˽������
    properties (Access = 'private')
        PI = 3.14159;
    end
    
    %%  ��������
    properties (Dependent)
        N;
        M;
        Start;
    end
    
    %%  �Ե��÷���
    methods
        %%  ���ɺ����������
        function n = get.N(obj)
            n = ceil((obj.X2-obj.X1)/obj.Delta_x)+1;
        end
        
        %%  ���������������
        function m = get.M(obj)
            m = ceil(obj.T/obj.Delta_t)+1;
        end
        
        %%  ���ɳ�ʼ״̬
        function start = get.Start(obj)
            start = zeros(1,obj.N);
            for i = 1:obj.N
                xpos = obj.X1+(i-1)*obj.Delta_x;
                if abs(xpos)<=(obj.PI)
                    start(i) = sin(xpos/2);
                end
            end
        end
    end
    
    %%  ���з���
    methods (Access = 'public')
        %%  ǰ����
        function plot1(obj,filename)
            tran = obj.Start;
            ans1 = zeros(1,obj.N);
            for i = 1:obj.M
                for j = 1:(obj.N-1)
                    ans1(j) = tran(j)-obj.A*obj.Delta_t/obj.Delta_x*(tran(j+1)-tran(j));
                end
                ans1(obj.N) = 0;
                tran = ans1;
            end
            x = obj.X1:obj.Delta_x:obj.X2;
            plot(x,ans1);
            xlabel('���� X');
            ylabel('���� T');
            title({'ǰ��',['T=',num2str(obj.T),'  DeltaX=',num2str(obj.Delta_x),'  DeltaT=',num2str(obj.Delta_t),'  A=',num2str(obj.A)]});
            print('-dpng',filename);
        end
        
        %%  ������
        function plot2(obj,filename)
            tran = obj.Start;
            ans1 = zeros(1,obj.N);
            for i = 1:obj.M
                for j = 2:obj.N
                    ans1(j) = tran(j)-obj.A*obj.Delta_t/obj.Delta_x*(tran(j)-tran(j-1));
                end
                ans1(1) = 0;
                tran = ans1;
            end
            x = obj.X1:obj.Delta_x:obj.X2;
            plot(x,ans1);
            xlabel('���� X');
            ylabel('���� T');
            title({'���',['T=',num2str(obj.T),'  DeltaX=',num2str(obj.Delta_x),'  DeltaT=',num2str(obj.Delta_t),'  A=',num2str(obj.A)]});
            print('-dpng',filename);
        end
        
        %%  �м���
        function plot3(obj,filename)
            tran = obj.Start;
            ans1 = zeros(1,obj.N);
            for i = 1:obj.M
                for j = 2:(obj.N-1)
                    ans1(j) = tran(j)-obj.A*obj.Delta_t/obj.Delta_x/2*(tran(j+1)-tran(j-1));
                end
                ans1(1) = 0;
                ans1(obj.N) = 0;
                tran = ans1;
            end
            x = obj.X1:obj.Delta_x:obj.X2;
            plot(x,ans1);
            xlabel('���� X');
            ylabel('���� T');
            title({'�в�',['T=',num2str(obj.T),'  DeltaX=',num2str(obj.Delta_x),'  DeltaT=',num2str(obj.Delta_t),'  A=',num2str(obj.A)]});
            print('-dpng',filename);
        end
        
        %%  ǰ��/�����֣���ճ�������aֵ����ȷ����
        function plot4(obj,filename)
            tran = obj.Start;
            ans1 = zeros(1,obj.N);
            match = [obj.A,0];
            mmax = max(match);
            mmin = min(match);
            for i = 1:obj.M
                for j = 2:(obj.N-1)
                    ans1(j) = tran(j)-obj.Delta_t/obj.Delta_x*(mmin*(tran(j+1)-tran(j))+mmax*(tran(j)-tran(j-1)))+(obj.Delta_t/obj.Delta_x/obj.Delta_x)*(tran(j+1)+tran(j-1)-2*tran(j));
                end
                ans1(1) = 0;
                ans1(obj.N) = 0;
                tran = ans1;
            end
            x = obj.X1:obj.Delta_x:obj.X2;
            plot(x,ans1);
            xlabel('���� X');
            ylabel('���� T');
            title({'ǰ/����ճ�����a����������',['T=',num2str(obj.T),'  DeltaX=',num2str(obj.Delta_x),'  DeltaT=',num2str(obj.Delta_t),'  A=',num2str(obj.A)]});
            print('-dpng',filename);
        end
    end
end