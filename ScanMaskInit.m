classdef ScanMaskInit
    methods(Static)

        function MaskInitialization(maskInitContext)
            % Get parameters
            fov_max = str2double(get_param(gcb,'fov_max'));
            fov_min = str2double(get_param(gcb,'fov_min'));
            range = str2double(get_param(gcb,'range'));
            dz = str2double(get_param(gcb,'dz'));

            % Compute linelens
            if fov_max == fov_min
                linelens = ones(1, 20)*fov_max; % Default to all zeros
            else
                len_step = (fov_max - fov_min) / 20;
                linelens = len_step * (1:20)+fov_min-len_step;
            end
            set_param(gcb,'linelens', mat2str(linelens));

            % Compute shifts
            %if range == dz
            %    shifts = zeros(1, 20); % Default to all zeros
            %else
                shift_step = (range - dz) / 20;
                shifts = dz+shift_step * (1:20)-shift_step;
            %end
            set_param(gcb,'shifts', mat2str(shifts));
        end
    end
end
