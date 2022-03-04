function  [values, powerF] = sDFS(data)
% Written By: RoundStarling20
% Created:    December 01 2021
% Modified:   Febuary 08 2022
%
%
%  Function Description:  
%      The purpose of this program is to perform a digital Fourier Series
%      and return the harmonic coefficients.
%
% INPUTS:
%  data:        Discrete Data To DFS.
%
% OUTPUTS:
%  values:      Coefficients of the DFS.
%  powerF:      Average Power of the frequency values.
%
% VARIABLES:
%  No:             Length of the data.
%  coefficients:   The Coefficients for a specific n value stored to be
%                  summed
%  ohm:            2 pi / N0.
%
%
% Example Code:
% discreteData = [18,12,6,0,6,12];
% [values, power] = sDFS(discreteData)
% values =
%
%   9.0000 + 0.0000i
%   4.0000 + 0.0000i
%  -0.0000 - 0.0000i
%   1.0000 - 0.0000i
%   0.0000 - 0.0000i
%   4.0000 + 0.0000i
%
%
% power =
%
%     114.0000e+000 +  8.0043e-015i
%

No = length(data);
ohm = 2 * pi / No;
coefficients = zeros(1,No);
values = zeros(No,1);

for k = 0:No-1
    for n = 1:No
        coefficients(1,n) = data(n) * exp(-1j * ohm * k * (n-1));
    end
    values(k+1,1) = sum(coefficients(1,:)) * 1/No;
end

powerF = sum(values.^2);
end %% End of function "sDFS"
