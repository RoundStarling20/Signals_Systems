function  [values] = sDFT(data)
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
%  data:        Discrete Data To DFT.
%
% OUTPUTS:
%  values:      Coefficients of the DFT.
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
% [values] = sDFT(discreteData)
% values =
%
%  54.0000 + 0.0000i
%  24.0000 + 0.0000i
%  -0.0000 - 0.0000i
%   6.0000 - 0.0000i
%   0.0000 - 0.0000i
%  24.0000 + 0.0000i
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

values = values * No;
end %% End of function "sDFT"
