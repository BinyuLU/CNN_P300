function [opts, bad] = test_cnntest2(net, x, y, opts)
    %  feedforward
    for i = 1 : opts.testepochs
        net = test_cnnff(net, x{i});
        if net.o(1) == net.o(2)
            bad = 1;
            opts.erp = [opts.erp -1];
        else            
            [~, h] = max(net.o);
            [~, a] = max(y(i,:));
            bad = find(h ~= a); %��������λ��
            if bad == 1
                opts.erp = [opts.erp i];
            end
        end
        
        opts.er = opts.er + numel(bad);      %���������
    end
    opts.er = opts.er / opts.testepochs;
end
