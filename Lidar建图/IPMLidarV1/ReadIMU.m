function [speed,delta_x,delta_y,delta_eu] = ReadIMU(scanIdx )
    csv =  load( 'ipmdata2/imu/driving_log_fix.csv');
    dataold  =  csv(scanIdx-1,:);
    data= csv(scanIdx,:);
    speed = data(4)*0.44704;
    delta_x = data(5) - dataold(5);
    delta_y = data(7) - dataold(7);
    delta_eu= quatern2euler(data(8:11)) - quatern2euler(dataold(8:11));
    

end

function euler = quatern2euler(q)
%QUATERN2EULER Converts a quaternion orientation to ZYX Euler angles
%
%   q = quatern2euler(q)
%
%   Converts a quaternion orientation to ZYX Euler angles where phi is a
%   rotation around X, theta around Y and psi around Z.
%
%   For more information see:
%   http://www.x-io.co.uk/node/8#quaternions
%
%	Date          Author          Notes
%	27/09/2011    SOH Madgwick    Initial release

    R(1,1,:) = 2.*q(:,1).^2-1+2.*q(:,2).^2;
    R(2,1,:) = 2.*(q(:,2).*q(:,3)-q(:,1).*q(:,4));
    R(3,1,:) = 2.*(q(:,2).*q(:,4)+q(:,1).*q(:,3));
    R(3,2,:) = 2.*(q(:,3).*q(:,4)-q(:,1).*q(:,2));
    R(3,3,:) = 2.*q(:,1).^2-1+2.*q(:,4).^2;

    phi = atan2(R(3,2,:), R(3,3,:) );
    theta = -atan(R(3,1,:) ./ sqrt(1-R(3,1,:).^2) );
    psi = atan2(R(2,1,:), R(1,1,:) );

    euler = [phi(1,:)' theta(1,:)' psi(1,:)'];
end