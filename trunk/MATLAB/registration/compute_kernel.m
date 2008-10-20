%% compute the kernel and basis matrix for thin-plate splines
%% reference:  Landmark-based Image Analysis, Karl Rohr, p195 
function [K,U] = compute_kernel(ctrl_pts,landmarks, lambda)
%%=====================================================================
%% $RCSfile: compute_kernel.m,v $
%% $Author: bjian $
%% $Date: 2008/06/28 23:32:20 $
%% $Revision: 1.1 $
%%=====================================================================

[n,d] = size(ctrl_pts);
if (nargin<3)
    lambda = 0;
end
%K = zeros(n);
K = lambda*ones(n);
switch d
  case 2
    for i=1:n
        for j=1:n
            r = norm(ctrl_pts(i,1:2) - ctrl_pts(j,1:2));
            if (r>0)
                    K(i,j) =   r*r*log(r);
            end
        end
    end
  case 3
    for i=1:n
        for j=1:n
            r = norm(ctrl_pts(i,1:3) - ctrl_pts(j,1:3));
            K(i,j) =   -r;
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (nargin>=2)
    [m,d] = size(landmarks);
    %U = zeros(m,n);
    U = lambda*ones(m,n);
    switch d
        case 2
            for i=1:m
                for j=1:n
                    r = norm(landmarks(i,1:2) - ctrl_pts(j,1:2));
                    if (r>0)
                        U(i,j) =   r*r*log(r);
                    end
                end
            end
        case 3
            for i=1:m
                for j=1:n
                    r = norm(landmarks(i,1:3) - ctrl_pts(j,1:3));
                    U(i,j) =   -r;
                end
            end
    end
end
