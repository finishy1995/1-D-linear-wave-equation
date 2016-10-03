classdef firstOrder
%
%  作者：王元恺  日期：2016-10-03
%  绘制一阶微分图
%

    %%  公共属性
    properties (Access = 'public')
        T = 2.0;
        X1 = -10;
        X2 = 10;
        Delta_x = 0.01;
        Delta_t = 0.01;
        A = 1;
    end
    
    %%  私有属性
    properties (Access = 'private')
        PI = 3.14159;
    end
    
    %%  依赖属性
    properties (Dependent)
        N;
        M;
        Start;
    end
    
    %%  自调用方法
    methods
        %%  生成横轴网格点数
        function n = get.N(obj)
            n = ceil((obj.X2-obj.X1)/obj.Delta_x)+1;
        end
        
        %%  生成纵轴网格点数
        function m = get.M(obj)
            m = ceil(obj.T/obj.Delta_t)+1;
        end
        
        %%  生成初始状态
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
    
    %%  共有方法
    methods (Access = 'public')
        %%  前项差分
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
            xlabel('变量 X');
            ylabel('变量 T');
            title({'前差',['T=',num2str(obj.T),'  DeltaX=',num2str(obj.Delta_x),'  DeltaT=',num2str(obj.Delta_t),'  A=',num2str(obj.A)]});
            print('-dpng',filename);
        end
        
        %%  后项差分
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
            xlabel('变量 X');
            ylabel('变量 T');
            title({'后差',['T=',num2str(obj.T),'  DeltaX=',num2str(obj.Delta_x),'  DeltaT=',num2str(obj.Delta_t),'  A=',num2str(obj.A)]});
            print('-dpng',filename);
        end
        
        %%  中间差分
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
            xlabel('变量 X');
            ylabel('变量 T');
            title({'中差',['T=',num2str(obj.T),'  DeltaX=',num2str(obj.Delta_x),'  DeltaT=',num2str(obj.Delta_t),'  A=',num2str(obj.A)]});
            print('-dpng',filename);
        end
        
        %%  前项/后项差分（带粘性项，根据a值正负确定）
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
            xlabel('变量 X');
            ylabel('变量 T');
            title({'前/后差（带粘性项，由a正负决定）',['T=',num2str(obj.T),'  DeltaX=',num2str(obj.Delta_x),'  DeltaT=',num2str(obj.Delta_t),'  A=',num2str(obj.A)]});
            print('-dpng',filename);
        end
    end
end